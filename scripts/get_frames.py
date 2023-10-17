import numpy as np
import matplotlib.pyplot as plt

# Load and display the image
#img = plt.imread('../frames/c1cal/c1cal.png')
img = plt.imread('../frames/c1/000000064.png')
fig, ax = plt.subplots()
ax.imshow(img)

# Get two points from user clicks (you can change the number as needed)

points = plt.ginput(0, timeout=0)
points_m = np.asarray(points)
np.savetxt('../frames/c1/c1_fim.dat',points_m, fmt='%d', delimiter=' ')
#import pdb; pdb.set_trace()

print(points_m)


