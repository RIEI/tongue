__author__ = 'pferland'
import cymysql, time, os, sys, threading
from TongueConfig  import *
from TongueD import *
print "Tongue Video Streaming Server V1.0 GPLv2 16/Mar/2014 by Phil Ferland (pferland@randomintervals.com)"

tcfg = TongueConfig()
config = tcfg.ConfigMap("TongueDaemon")

#feeds = check_used_feeds(config['ffservers'], config['sql_host'], config['sql_user'], config['sql_pwd'] )
#print feeds

ffserver_stats(config['ffservers'])

sys.exit(1)

#Connect to the MySQL Server, DB Name is Hard coded, not to be changed unless you go through all the code.
#try:

#except cymysql.MySQLError, e:
#    print e

conn = cymysql.connect(host=config['sql_host'], user=config['sql_user'], passwd=config['sql_pwd'], db=config['db'])

print "Console Output Key:"
print "\t(+)  = New Feed that is in use. (Feed Checker Thread)"
print "\t[+]  = Update Feed that is in use. (Feed Checker Thread)"
print "\t+    = New Feed that is not in use. (Feed Checker Thread)"
print "\t-    = Feed that is not in use. (Feed Checker Thread)"
print "\t|    = Next Feed Server being checked. (Feed Checker Thread)"
print "\t<-#> = Feed marked as unused and threads killed. # is the thread number. (Main Thread cleaning up unused feeds)"
print "\t,    = Sleep for main thread."
print "\t.    = New item in the Shows search/preparing."
print "\t`    = New item in the Movies search/preparing.\n\n\n"

print "Spawning Thread to check for updates to the Movies folders."
#prep_sql_movies(config['movies_mnt'], conn)
movie_folder_thread = threading.Thread(name="Tongue Movie Indexer", target=prep_sql_movies, args=(config['movies_mnt'], config['sql_host'], config['sql_user'], config['sql_pwd'], config['db'] ))
movie_folder_thread.start()

print "Spawning Thread to check for updates to the Shows folders."
#prep_sql_shows(config['shows_mnt'], conn)
Shows_Folder_Thread = threading.Thread(name="Tongue Shows Indexer", target=prep_sql_shows, args=(config['shows_mnt'], config['sql_host'], config['sql_user'], config['sql_pwd'], config['db'] ))
Shows_Folder_Thread.start()

# Spawn the Feed Checker Thread
#feed_checker_thread = threading.Thread(name="Tongue Feed Checker Thread", target=check_feeds, args=(config['ffserver_ip'], config['ffserver_port'], config['sql_host'], config['sql_user'], config['sql_pwd'] ))
#feed_checker_thread.start()

print "Spawning Thread for status socket."
Status_thread = threading.Thread(name="Tongue Status Socket", target=tongue_socket, args=(config['tongue_ip'], int(config['tongue_port'])))
Status_thread.start()

print "Start main thread"
player_threads = {} # Start the list for the Video Feed Threads
i = 1
while 1:
    waiting = fetch_waiting(conn) #Check for videos that need to be streamed
    #print waiting
    if not waiting: # If fetch_waiting returns 0, check to see if any feeds are unused
        time.sleep(1)
        feeds = check_used_feeds(config['ffservers'], config['sql_host'], config['sql_user'], config['sql_pwd'] )
        print "feeds: "
        print feeds

        unused_feeds = get_unused_feeds(conn) # Get the Unused feeds
        #print unused_feeds
        removed = clean_threads(unused_feeds, player_threads)# check them against running ffmpeg input threads
        for rm in removed:
            #print rm
            del player_threads[rm]
        #print player_threads
        sys.stdout.write(",")
        sys.stdout.flush()
        #time.sleep(0.5) # This probably will get removed.
        continue
    # if fetch_waiting returns a video, stream it.
    if waiting[-1] == "movie_files":
        #print waiting
        fullpath = os.path.normpath(config['movies_mnt'] + "/" + waiting[5])
        feed_name = waiting[2]
        feed_server = waiting[3]
        seek = waiting[4]
        group = waiting[6]
        dvd_flag = waiting[8]
    elif waiting[-1] == "video_files":
        #print waiting
        fullpath = os.path.normpath(config['shows_mnt']+"/"+waiting[5]+"/"+waiting[6])
        feed_name = waiting[1]
        feed_server = waiting[2]
        seek = waiting[3]
        group = 0
        dvd_flag = 0
    #print waiting
    #sys.exit(1)
    print feed_name, feed_server, seek, fullpath, config['bin_path']
    #continue

    play_file(feed_name, feed_server, seek, fullpath, config['bin_path'])

    player_threads.update({i:{"feed": waiting[1]}})# Add the thread feed to a list so we can manage it.
    i += 1
    remove_waiting(waiting[0], conn) # Remove the waiting video file from the table so we don't play it again
    time.sleep(1) # This probably will get removed.