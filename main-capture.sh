#!/usr/bin/env bash
echo "$0"
source .env
DURATION_MS=$(( $DURATION_SECONDS * 1000 ))
TIMESTAMP=$(date --utc --iso-8601=seconds)

# if [ -n $LOCAL_RAW_VIDEO_PATH && ! -d "${LOCAL_RAW_VIDEO_PATH}" ]; then
#     echo "create ${LOCAL_RAW_VIDEO_PATH}"
#     mkdir ${LOCAL_RAW_VIDEO_PATH}
# fi

echo "capturing..."
# https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspivid.md
raspivid --output "${LOCAL_RAW_VIDEO_PATH}/${TIMESTAMP}.h264" --timeout ${DURATION}
echo "capture complete."
