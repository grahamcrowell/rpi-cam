#!/usr/bin/env bash
RELEASE_PERIOD=10
MAIN_SCRIPT=main.sh

printf "\n\n${GREEN}PULLING LATEST${RESET}\n\n"

git status
git pull
echo
printf "\n\n${GREEN}STARTING ${MAIN_SCRIPT}${RESET}\n\n"
echo
./${MAIN_SCRIPT} &
MAIN_PID=$!
printf "${YELLOW}${MAIN_SCRIPT} PID=${MAIN_PID}${RESET}\n"
printf "${RESET}sleeping for ${RELEASE_PERIOD}${RESET}...\n"
REMAINING=$RELEASE_PERIOD
while [ $REMAINING -gt 0 ]; do
    sleep 1
    if ps -p $MAIN_PID -o args= | grep -qs "${MAIN_SCRIPT}"; then
        printf "${GREY}ok ${MAIN_SCRIPT} still running${RESET}\n"
        sleep 1 &
        sleep_pid=$!
        printf "${GREY}${REMAINING}/${RELEASE_PERIOD}${RESET}\n"
        wait $sleep_pid
        REMAINING=$(($REMAINING - 1))
    else
        sleep 1 &
        sleep_pid=$!
        printf "${YELLOW}OK: ${MAIN_SCRIPT} ALREADY EXITTED${RESET}\n"
        wait $sleep_pid
        break
    fi

done

if ps -p $MAIN_PID -o args= | grep -qs "${MAIN_SCRIPT}"; then
    printf "${RED}KILLING ${MAIN_SCRIPT}${RESET}\n"
    kill -$signal $MAIN_PID 2>/dev/null
    sleep 1
else
    printf "${YELLOW}OK: ${MAIN_SCRIPT} ALREADY EXITTED${RESET}\n"
fi
