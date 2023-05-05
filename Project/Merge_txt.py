import os
import re

# Set the directory containing the text files to be concatenated
dir_path = "/home/mrarnoldi/Desktop/yolov7-object-tracking/runs/detect/object_tracking2/labels"

# Set the output file name
output_filename = "combined_files.txt"

# Open the output file for writing
with open(output_filename, "w") as outfile:
    
    # Write the header row
    #outfile.write("filename\ttext\n")
    filenames = os.listdir(dir_path)
    filename_sorted = sorted(filenames, key=lambda i: int(os.path.splitext(re.sub('\D', '', os.path.basename(i)))[0]))
    # Loop through the files in the directory
    for filename in filename_sorted:

        # Check if the file is a text file
        if filename.endswith(".txt"):

            # Open the text file for reading
            with open(os.path.join(dir_path, filename), "r") as infile:

                # Read the text from the file
                Lines = infile.readlines()
                for line in Lines:
                    #print("Frame{}: {}".format(re.sub('\D', '', filename), line))
                    frame = re.sub('\D', '', filename)
                    # Write the filename and text to the output file, separated by a tab
                    outfile.write(f"{frame} {line}")