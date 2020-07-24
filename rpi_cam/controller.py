from picamera import PiCamera
from time import sleep
from pathlib import Path
from datetime import datetime
import os, sys

LATEST_PATH = Path.home() / f"Pictures/nico/latest.jpg"


def take_picture():
    with PiCamera() as camera:
        dated_path = Path.home() / f"Pictures/nico/{datetime.now().isoformat()}.jpg"
        camera.capture(LATEST_PATH)

