#!/usr/bin/env bash
echo "$0"
source .env

function capture-loop() {
    while true; do
        ./main-capture.sh &
        capture_pid=$!
        wait $capture_pid
    done
}


function sync-loop() {
    while true; do
        ./main-sync.sh &
        sync_pid=$!
        wait $sync_pid
    done
}

capture-loop &
sync-loop &