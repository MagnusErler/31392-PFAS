import math

rows = 200 
columns = 350
min_val = 0
max_val = 1023.
one_pixel = math.log2(max_val-min_val+1)

answer = rows*columns*one_pixel

print(answer)
