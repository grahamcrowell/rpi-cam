#!/usr/bin/env bash
echo "$0"
source .env

DURATION_MS=$(( $DURATION_SECONDS * 1000 ))
# TIMESTAMP=$(date --utc --iso-8601=ns)
TIMESTAMP=$(date --utc --iso-8601=s)

if [ ! -d "$LOCAL_RAW_VIDEO_PATH" ]; then
    printf "${RED}directory not found: ${LOCAL_RAW_VIDEO_PATH}${RESET}\n"
    exit 1;
fi


# if [ -n $LOCAL_RAW_VIDEO_PATH && ! -d "${LOCAL_RAW_VIDEO_PATH}" ]; then
#     echo "create ${LOCAL_RAW_VIDEO_PATH}"
#     mkdir ${LOCAL_RAW_VIDEO_PATH}
# fi

echo "capturing..."
# https://www.raspberrypi.org/documentation/raspbian/applications/camera.md
# https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspivid.md
raspivid --output "${LOCAL_RAW_VIDEO_PATH}/${TIMESTAMP}%05d.h264" --width 1920 --height 1080 --framerate 25 --spstimings --segment $DURATION_MS --timeout 50000 --annotateex 10,0x00,0x8080FF --annotate 4 --annotate "hello %Y-%m-%d %X" 
echo "capture complete."
