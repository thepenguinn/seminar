#!/bin/bash

feh --bg-fill bg.jpg
xdotool key super+5 # switching to tag 5
sleep 0.2
xdotool key super+F # switching on floating window mode

if ! xdotool search --name "present.pdf" > /dev/null 2>&1 ; then
    zathura --fork -P 1 present.pdf
    sleep 1.0
    xdotool search --name "present.pdf" windowsize 1500 843.75  windowmove 20 118
    xdotool key ctrl+n
    xdotool type ":set recolor false"
    xdotool key Return
else
    echo zathura is running with present.pdf, so skipping lauching zathura
fi

# if true; then
if ! xdotool search --name "mpv_cam_presentation" > /dev/null 2>&1 ; then
    mpv --title="mpv_cam_presentation" av://v4l2:/dev/video2 --video-rotate=270 --profile=low-latency --force-seekable=yes --no-cache --untimed --cache-pause=no > /dev/null 2>&1 &

    # mpv --title="mpv_cam_presentation" output.mp4 --loop-file --video-rotate=270 --profile=low-latency --force-seekable=yes --no-cache --untimed --cache-pause=no &
    sleep 0.5
    xdotool search --name "mpv_cam_presentation" windowsize 350 262 windowmove $((1920-350-20)) 70
else
    echo mpv webcam is running, so skipping lauching mpv
fi


if ! xdotool search --name "start-recording.sh" > /dev/null 2>&1 ; then

    kitty --name "start-recording.sh" > /dev/null 2>&1 ./start-recording.sh &
    sleep 0.5
    xdotool search --name "start-recording.sh" windowsize 350 200 windowmove $((1920-350-20)) $((1080-118-200))
else
    echo presenation timer is running, so skipping lauching kitty
fi
