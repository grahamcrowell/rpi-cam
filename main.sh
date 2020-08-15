#!/usr/bin/env bash
echo "$0"
source .env

function clean () {
    rm ${LOCAL_RAW_VIDEO_PATH}
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
            echo "previous sync process no longer running."
            echo "starting new sync process"
            ./main-sync.sh &
            sync_pid=$!
            echo "new sync pid = $sync_pid"
        else
            echo "sync process $sync_pid stilling running"
        fi
        if (( $REMAINING_ITERS <= 0 )); then
            break
        else
            REMAINING_ITERS=$(( $REMAINING_ITERS - 1 ))
        fi
    done
}

./main-sync.sh
clean
main-loop
# main-loop &
# main_pid=$!

# echo "main_pid = $main_pid"

# wait $main_pid
