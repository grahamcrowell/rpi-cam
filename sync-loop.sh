#!/bin/bash
SYNC_FOLDER=/home/pi/Pictures/nico
# SYNC_FOLDER=mock-sync-folder
S3_TARGET_PATH=s3://grahamcrowell.com/nico
AWD_PROFILE=personal
SYNC_FILE=latest.jpg
x=0
while [ $x -ge 0 ]
do
    echo "Welcome $x times"
    x=$(( $x + 1 ))
    date

    echo "s3"
    aws --profile ${AWD_PROFILE} s3 ls ${S3_TARGET_PATH}

    raspistill -o ${SYNC_FOLDER}/${SYNC_FILE}

    python3 scripts/build_html.py
    python3 scripts/rotate_pic.py

    echo "local folder"
    ls -lha ${SYNC_FOLDER}

    printf "syncing\n"
    aws --profile ${AWD_PROFILE} s3 sync ${SYNC_FOLDER} ${S3_TARGET_PATH}

    sleep 1;
done
