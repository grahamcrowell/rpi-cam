#!/usr/bin/env bash
echo "$0"
source .env

CAPTURE_ITERS=10;
CAPTURE_NUM=CAPTURE_ITERS;

function capture-loop() {
    while true; do
        echo "CAPTURE_NUM=${CAPTURE_NUM}"
        ./main-capture.sh
        if (( $CAPTURE_NUM < 0 )); then
            break
        else
            CAPTURE_NUM=$(( $CAPTURE_NUM - 1 ))
        fi
    done
}


SYNC_ITERS=10;
SYNC_NUM=SYNC_ITERS;

function sync-loop() {
    while true; do
        echo "CAPTURE_NUM=${CAPTURE_NUM}"
        ./main-sync.sh
        if (( $SYNC_NUM < 0 )); then
            break
        else
            SYNC_NUM=$(( $SYNC_NUM - 1 ))
        fi
    done
}


capture-loop &
capture_pid=$!

sync-loop &
sync_pid=$!

echo $capture_pid
echo $sync_pid

wait $capture_pid
wait $sync_pid
