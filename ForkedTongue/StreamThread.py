__author__ = 'sysferland'
import argparse, subprocess, os

parser = argparse.ArgumentParser()
parser.add_argument('-id', help='video waiting id in SQL table')
parser.add_argument('-feed', help='feed name')
parser.add_argument('-ffserver', help='ffserver IP and PORT')
parser.add_argument('-seek', help='seek to time')
parser.add_argument('-show', help='show name')
parser.add_argument('-season', help='season folder')
parser.add_argument('-video', help='video name')
parser.add_argument('-basepath', help='all base path')
parser.add_argument('-binpath', help='ffmpeg bin path')

args = parser.parse_args()

videofile = os.path.normpath(args.basepath+"/"+args.season+"/"+args.video)

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

command = args.binpath + "ffmpeg "+ other_options +" -i " + videofile.replace(" ", "\ ") + " " + options + ffm_output

#print command
process = subprocess.Popen(command.replace("&", "\&"), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
#print process.stdout
out, err = process.communicate()