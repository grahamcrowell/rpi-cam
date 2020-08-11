#!/usr/bin/env bash
source .env
DURATION_MS=$(( $DURATION_SECONDS * 1000 ))
TIMESTAMP=$(date --utc --iso-8601=seconds)

if [ ! -d "${RAW_VIDEO_PATH}" ]; then
    echo "create ${RAW_VIDEO_PATH}"
    mkdir ${RAW_VIDEO_PATH}
fi

echo "capturing..."
# https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspivid.md
raspivid -o "${RAW_VIDEO_PATH}/${TIMESTAMP}.h264" -t ${DURATION}
echo "capture complete."
