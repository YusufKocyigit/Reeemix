
# Reeemix - Optimize Videos For Web Without Reencoding

Reeemix is a simple batch file that you put next to the folder containing your videos, 

It allows you to optimize videos for web or network playing/sharing by putting the video metadata and container to the start of the file.

It's a simple Cli that runs the following ffmpeg command for every video file inside the input folder: 
ffmpeg -i "input\video.mp4" -map 0 -c copy -movflags +faststart "output\video-renc.mp4"

Nothing Else. 