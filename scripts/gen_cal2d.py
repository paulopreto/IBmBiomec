import numpy as np

path_ref = "../data/ref2d.ref"
path_dat = "../frames/c1cal/c1cal.dat"

datref = np.loadtxt(path_ref, skiprows=1, delimiter=' ', usecols=(1,2))
datpixel = np.loadtxt(path_dat)

real_metros = datref[1, 0]
valor_pixel = datpixel[1, 0] - datpixel[0, 0]

num2calib = real_metros/valor_pixel

#import ipdb; ipdb.set_trace()
np.savetxt("../rec2d/cal2d.cal", [num2calib])
