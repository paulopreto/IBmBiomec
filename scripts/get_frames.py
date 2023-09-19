import matplotlib.pyplot as plt

# Load and display the image
img = plt.imread('../frames/c1cal/c1cal.png')
fig, ax = plt.subplots()
ax.imshow(img)

# Get two points from user clicks (you can change the number as needed)
points = plt.ginput(0)
print(points)

plt.show()
