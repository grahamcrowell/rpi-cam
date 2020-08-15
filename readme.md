
# rpi-cam

on rpi:
```bash
cd ~/Documents/rpi-cam
rm -rf ~/raw-video/* || true && git pull && ./main-capture.sh && ./main-sync.sh
```

on local:
```bash
cd ~/Documents/rpi-cam
rm -rf ~/raw-video && aws s3 --profile personal cp --recursive s3://nico-pup/raw-video/ ~/raw-video 
ffmpeg -framerate 24 -i ~/raw-video/2020-08-15T03:04:20+00:0000001.h264 -c copy ~/raw-video/2020-08-15T03:04:20+00:0000001.mp4
```