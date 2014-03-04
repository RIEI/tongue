__author__ = 'sysferland'
import argparse, subprocess, os

parser = argparse.ArgumentParser()
parser.add_argument('-feed', help='feed name')
parser.add_argument('-ffserver', help='ffserver IP and PORT')
parser.add_argument('-source', help='video source path if DVD Raw the path to the VIDEO_TS folder')
parser.add_argument('-seek', help='time to seek to in for the feed')
parser.add_argument('-binpath', help='ffmpeg bin path')

args = parser.parse_args()

videofile = os.path.normpath(args.source)

#dt_to = datetime.time(00,20,00)
#dt_delta = datetime.time(00,00,30)

#seek_to = datetime.timedelta(hours=dt_to.hour,minutes=dt_to.minute,seconds=dt_to.second)
#seek_delta = datetime.timedelta(hours=dt_delta.hour,minutes=dt_delta.minute,seconds=dt_delta.second)
#seek_to_fast = seek_to - seek_delta
seek_delta = "00:00:00"
seek_to_fast = "00:00:00"
other_options = "-ss " + str(seek_to_fast)
options = "-ss "+ str(seek_delta)  # +" -trellis 1 -lmax 42000 "
ffm_output = " http://"+args.ffserver+"/"+args.feed


command = args.binpath + "ffmpeg -threads 2 "+ other_options +" -i " + videofile.replace("'", "\\'").replace(" ", "\\ ").replace("-", "\-").replace("&", "\&") + " " + options + ffm_output
command = command.replace("&", "\&")
print command
process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
#print process.stdout
out, err = process.communicate()