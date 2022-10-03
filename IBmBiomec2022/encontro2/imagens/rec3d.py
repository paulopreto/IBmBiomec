# %% Reconstruction 3D
def r3d(DLTs, cc2ds):
    DLTs = np.asarray(DLTs)
    cc2ds = np.asarray(cc2ds)
    
    m = len(DLTs)
    M = np.zeros([2 * m, 3])
    N = np.zeros([2 * m, 1])

    for i in range(m):
        M[i*2,:] = [DLTs[i,0]-DLTs[i,8]*cc2ds[i,0], DLTs[i,1]-DLTs[i,9]*cc2ds[i,0], DLTs[i,2]-DLTs[i,10]*cc2ds[i,0]]
        M[i*2+1,:] = [DLTs[i,4]-DLTs[i,8]*cc2ds[i,1],DLTs[i,5]-DLTs[i,9]*cc2ds[i,1],DLTs[i,6]-DLTs[i,10]*cc2ds[i,1]]
        Np1 = cc2ds[i,:].T
        Np2 = [DLTs[i,3],DLTs[i,7]]
        N[[i*2,i*2+1],0] = Np1 - Np2

    cc3d = inv(M.T.dot(M)).dot((M.T.dot(N)))
    
    return cc3d
