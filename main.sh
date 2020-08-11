#!/usr/bin/env bash
echo "$0"
source .env

function clean () {
    rm ${LOCAL_RAW_VIDEO_PATH}/*
}


MAX_ITERS=10;
REMAINING_ITERS=MAX_ITERS;

function main-loop() {
    sync_pid=0
    while true; do
        echo "REMAINING_ITERS=${REMAINING_ITERS}"
        ./main-capture.sh
        ps -p $sync_pid -o args=
        if (( $? != 0 )); then
            echo "no active sync running."
            echo "starting sync now"
            ./main-sync.sh &
            echo "sync pid = $sync_pid"
            sync_pid=$!
        else
            echo "active sync in progress"
        fi
        

        
        if (( $REMAINING_ITERS <= 0 )); then
            break
        else
            REMAINING_ITERS=$(( $REMAINING_ITERS - 1 ))
        fi
    done
}

clean
main-loop
# main-loop &
# main_pid=$!

# echo "main_pid = $main_pid"

# wait $main_pid
