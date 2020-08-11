#!/usr/bin/env bash
echo "$0"
source .env

# aws --profile ${AWD_PROFILE} s3 ls ${S3_RAW_VIDEO_PATH}
aws --profile ${AWD_PROFILE} s3 sync "${LOCAL_RAW_VIDEO_PATH}" ${S3_RAW_VIDEO_PATH}