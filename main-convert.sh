#!/usr/bin/env bash
echo "$0"
source .env

cd "$LOCAL_RAW_VIDEO_PATH" || return

RAW_EXT='.h264'
TARGET_EXT='.mp4'

RAW_FILES=$(find "$LOCAL_RAW_VIDEO_PATH" -name "*${RAW_EXT}" -type f | while read -r FILE; do echo $(basename "${FILE%.*}"); done | sort)
printf "$LOCAL_RAW_VIDEO_PATH:\n%s\n" "$RAW_FILES"
COMPLETE_FILES=$(find "$LOCAL_OUT_VIDEO_PATH" -name "*${TARGET_EXT}" -type f | while read -r FILE; do echo $(basename "${FILE%.*}"); done | sort)
printf "$LOCAL_OUT_VIDEO_PATH:\n%s\n" "$COMPLETE_FILES"
PENDING_FILES=$(comm -23 <(echo "$RAW_FILES") <(echo "$COMPLETE_FILES") | while read -r FILE; do echo "${FILE}"; done)
printf "PENDING_FILES:\n%s\n" "$PENDING_FILES"

echo "$PENDING_FILES"
if [ -n "$PENDING_FILES" ]; then
  echo "$PENDING_FILES" | while read -r FILE; do
    TARGET_PATH=$LOCAL_OUT_VIDEO_PATH/$(basename "$FILE$TARGET_EXT")
    echo "$FILE$RAW_EXT -> $FILE$TARGET_EXT"
    echo
    MP4Box -add "$FILE$RAW_EXT" "$TARGET_PATH"
  done
fi

echo conversion complete
