#!/bin/bash

Pid_File="./print_time_presentation_pid"

# trap "printf \"\033[?25h\" && exit 0" SIGINT

while true
do

    clear
    printf "START: "
    read

    screenrecord_file="screenrecord_full_$(date "+%F_%H-%M-%S").mp4"

    sh -c "echo \$$ > $Pid_File && \
        ./print-time.sh" &

    # ffmpeg -y -framerate 30 -f x11grab -i :0.0 -f pulse -i ipwebcam.monitor out.mp4

    sh -c "ffmpeg \
        -y \
        -loglevel quiet \
        -video_size 1920x1080 \
        -framerate 30 \
        -f x11grab \
        -i :0.0 \
        -f pulse \
        -i ipwebcam.monitor \
        -preset ultrafast \
        -pix_fmt yuv420p \
        ${screenrecord_file}"

    if [[ -f "$Pid_File" ]]; then
        processes=$(ps -aux)
        if grep $(cat "$Pid_File" 2> /dev/null) 2> /dev/null 1>&2 <<<"$processes" ; then
            # print-time is running
            kill $(cat "$Pid_File")
            rm "$Pid_File"
        fi
    fi

done
