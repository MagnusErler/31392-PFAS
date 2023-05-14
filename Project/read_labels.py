import pandas as pd

# Read the file into a DataFrame: df
seq_1 = pd.read_csv(r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\seq_01\labels.txt", sep=" ",
                    names=["frame", "track_id", "type", "truncated", "occluded", "alpha", "bbox_0", "bbox_1", "bbox_2", "bbox_3", "dimensions_height", "dimensions_width", "dimensions_length", "location_x", "location_y", "location_z", "rotation_y", "score"])
seq_2 = pd.read_csv(r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\seq_02\labels.txt",sep=" ",
                    names=["frame", "track_id", "type", "truncated", "occluded", "alpha", "bbox_0", "bbox_1", "bbox_2", "bbox_3", "dimensions_height", "dimensions_width", "dimensions_length", "location_x", "location_y", "location_z", "rotation_y", "score"])

# Print every columen with track_id == 1)
print(seq_1.loc[seq_1['track_id'] == 1])
