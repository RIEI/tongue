__author__ = 'pferland'
import cymysql, time, sys, threading
from TongueConfig  import *
from TongueD import *

print "Tongue Video Streaming Server V1.0 GPLv2 1/1/2014 by Phil Ferland (pferland@randomintervals.com)"

tcfg = TongueConfig()
config = tcfg.ConfigMap("TongueDaemon")
#Connect to the MySQL Server, DB Name is Hard coded, not to be changed unless you go through all the code.
try:
    conn = cymysql.connect(host=config['sql_host'], user=config['sql_user'], passwd=config['sql_pwd'], db=config['db'])
except cymysql.MySQLError, e:
    print e

print "Console Output Key:"
print "\t(+) = New Feed that is in use. (Feed Checker Thread)"
print "\t[+] = Update Feed that is in use. (Feed Checker Thread)"
print "\t+   = New Feed that is not in use. (Feed Checker Thread)"
print "\t-   = Feed that no longer in use. (Feed Checker Thread)"
print "\t<-#> = Feed marked as unused and threads killed. # is the thread number. (Main Thread cleaning up unused feeds)"
print "\t,   = Sleep for main thread."
print "\t.   = New item in the Shows/Music/Movies search/preparing.\n\n\n"

print "Checking for updates to the Shows folders."
#prep_sql_shows(config['shows_mnt'], conn)

# Spawn the Feed Checker Thread
feed_checker_thread = threading.Thread(name="Tongue Feed Checker Thread", target=check_feeds, args=(config['ffserver_ip'], config['ffserver_port'], config['sql_host'], config['sql_user'], config['sql_pwd'] ))
feed_checker_thread.start()


feed_checker_thread = threading.Thread(name="Tongue Status Socket", target=tongue_socket, args=(config['tongue_ip'], int(config['tongue_port'])))
feed_checker_thread.start()

player_threads = {} # Start the list for the Video Feed Threads

#TODO:
# WIP - Feed to play_file thread so when someone disconnects the ffmpeg process can get killed and feed freed up
# NS  - Need to wait for stream to change to WAIT_FEED then you can send the next video.

i = 1
while 1:
    waiting = fetch_waiting(conn) #Check for videos that need to be streamed
    if not waiting: # If fetch_waiting returns 0, check to see if any feeds are unused
        time.sleep(1) # This probably will get removed.
        unused_feeds = get_unused_feeds(conn) # Get the Unused feeds
        removed = clean_threads(unused_feeds, player_threads)# check them against running ffmpeg input threads
        for rm in removed:
            #print rm
            del player_threads[rm]
        #print player_threads
        sys.stdout.write(",")
        sys.stdout.flush()
        continue
    # if fetch_waiting returns a video, stream it.
    waiting = waiting + (config['shows_mnt'], config['bin_path'])  #append shows folder and ffmpeg bin path to list so the Feed input thread knows about them
    play_file(waiting[0], waiting[1], waiting[2], waiting[3], waiting[4], waiting[5], waiting[6], waiting[7], waiting[8])

    player_threads.update({i:{"feed": waiting[1]}})# Add the thread feed to a list so we can manage it.
    i += 1
    remove_waiting(waiting[0], conn) # Remove the waiting video file from the table so we don't play it again
    time.sleep(1) # This probably will get removed.