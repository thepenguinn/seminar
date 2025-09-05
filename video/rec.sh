# ffmpeg -y -f x11grab -i :0.0 -f pulse -i ipwebcam.monitor -ac 2 out.mp4
# ffmpeg -y -framerate 30 -f x11grab -i :0.0 -f pulse -i ipwebcam.monitor out.mp4 # audio works
ffmpeg -y -framerate 30 -f x11grab -i :0.0 -f pulse -i ipwebcam.monitor out.mp4

# mpv streaming
# mpv av://v4l2:/dev/video2 --video-rotate=270 --profile=low-latency --force-seekable=yes --no-cache --untimed --cache-pause=no
