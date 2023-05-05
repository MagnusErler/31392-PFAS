from PIL import Image

def getPixelValue(image_path, x, y):

    # print("image_path: ", image_path)
    # print("x: ", x)
    # print("y: ", y)

    if x < 0 or y < 0:
        print("Error: x or y is negative")
        return -1


    with Image.open(image_path) as img:
        # Get the RGB value of the pixel at (x, y)
        pixel_value = img.getpixel((x, y))
    return pixel_value