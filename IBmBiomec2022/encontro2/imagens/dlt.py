# Bibliotecas utilizadas
import numpy as np
import pandas as pd
import scipy as sp
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
from numpy.linalg import inv
from numpy.linalg import pinv
import sys

# %% Calibration DLT
def dlt_calib(cp3d, cp2d):

# =============================================================================
#                DLT 3D  
# Calcula os parametros do DLT
# onde:
# dlet_calib = vetor linha com os parametros do DLT calculados
# [L1,L2,L3...L11]
# cp3d = matriz retangular com as coordenadas 3d (X, Y, Z) dos pontos (p) do calibrador
# Xp1 Yp1 Zp1
# Xp2 Yp2 Zp2
# Xp3 Yp3 Zp3
#  .   .   .
#  .   .   .
# Xpn Ypn Zpn
# 
# cp2d = matriz retangular com as coordenadas de tela (X, Y) dos pontos (p) do calibrador
# xp1 yp1
# xp2 yp2
# xp3 yp3
#  .   .
#  .   .
# xpn ypn
# =============================================================================

    cp3d = np.asarray(cp3d)
    cp2d = np.asarray(cp2d)

    m = np.size(cp3d[:, 0], 0)
    M = np.zeros([m * 2, 11])
    N = np.zeros([m * 2, 1])

    for i in range(m):
        M[i*2,:] = [cp3d[i,0], cp3d[i,1], cp3d[i,2] ,1, 0, 0, 0, 0, -cp2d[i, 0] * cp3d[i, 0], -cp2d[i, 0] * cp3d[i, 1], -cp2d[i, 0] * cp3d[i, 2]]
        M[i*2+1,:] = [0 , 0, 0, 0, cp3d[i,0], cp3d[i,1], cp3d[i,2],1, -cp2d[i,1] * cp3d[i,0],-cp2d[i,1] * cp3d[i,1], -cp2d[i,1] * cp3d[i,2]]
        N[[i*2,i*2+1],0] = cp2d[i, :]

    Mt = M.T
    M1 = inv(Mt.dot(M))
    MN = Mt.dot(N)

    DLT = (M1).dot(MN).T

    return DLT

# %% Run CMD or Terminal Shell
if __name__ == '__main__':
    arq3d = sys.argv[1]
    arq2d = sys.argv[2]
    cp3d = np.loadtxt(arq3d)
    cp2d = np.loadtxt(arq2d)

    dlt_c1 = dlt_calib(cp3d, cp2d)
    print(dlt_c1)

    import pdb; pdb.set_trace()


