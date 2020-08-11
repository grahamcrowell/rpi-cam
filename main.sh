#!/usr/bin/env bash
echo "starting main"

DURATION=5
TIMESTAMP=$(date --utc --iso-8601=seconds)
RAW_VIDEO_PATH=~/raw-video

if [ ! -d "${RAW_VIDEO_PATH}" ]; then
    echo "create ${RAW_VIDEO_PATH}"
    mkdir ${RAW_VIDEO_PATH}
fi

# https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspivid.md
raspivid -o "${RAW_VIDEO_PATH}/${TIMESTAMP}.h264" -t ${DURATION}
echo "main complete"
