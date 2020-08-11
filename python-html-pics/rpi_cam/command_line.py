from rpi_cam.controller import take_picture

SPLASH = """
             _                           
            (_)                          
  _ __ _ __  _ ______ ___ __ _ _ __ ___  
 | '__| '_ \| |______/ __/ _` | '_ ` _ \ 
 | |  | |_) | |     | (_| (_| | | | | | |
 |_|  | .__/|_|      \___\__,_|_| |_| |_|
      | |                                
      |_|                                
"""


def main():
    print(SPLASH)
    take_picture()
