#!/usr/bin/env bash
echo "$0"
source .env

DURATION_MS=$(( $DURATION_SECONDS * 1000 ))
TIMESTAMP=$(date --utc --iso-8601=ns)

if [ ! -d "$LOCAL_RAW_VIDEO_PATH" ]; then
    printf "${RED}directory not found: ${LOCAL_RAW_VIDEO_PATH}${RESET}\n"
    exit 1;
fi


# if [ -n $LOCAL_RAW_VIDEO_PATH && ! -d "${LOCAL_RAW_VIDEO_PATH}" ]; then
#     echo "create ${LOCAL_RAW_VIDEO_PATH}"
#     mkdir ${LOCAL_RAW_VIDEO_PATH}
# fi

echo "capturing..."
# https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspivid.md
raspivid --output "${LOCAL_RAW_VIDEO_PATH}/%FT%T.h264" --width 1920 --height 1080 --framerate 25 --spstimings --segment $DURATION_MS
echo "capture complete."
