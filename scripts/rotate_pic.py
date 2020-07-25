from PIL import Image

dst = "/home/pi/Pictures/nico/latest.jpg"
# dst = "mock-sync-folder/latest.jpg"
 

# Create an Image object from an Image

colorImage  = Image.open(dst)

 

# Rotate it by 45 degrees

rotated = colorImage.rotate(180)

# Rotate it by 90 degrees

# transposed  = colorImage.transpose(Image.ROTATE_90)
rotated.save(dst, "JPEG")

