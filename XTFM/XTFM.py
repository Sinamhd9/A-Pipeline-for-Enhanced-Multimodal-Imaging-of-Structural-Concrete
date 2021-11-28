
import numpy as np

def XTFM(X, V, eps, sR, d, s, r, dim):
  '''
  X: 4D matrix of raw measurements containing all slices of independent and interelement
  data with the format of nS* sL * nC * nC , where nS is the number of independent scans,
  sL is the signal length of a raw measurement and nC is the number of channels of the instrument.
  v: velocity of the medium
  ε: time offset
  sR: signal resolution
  d: recording frequency
  s: transducer spacing
  r: desired resolution
  dim: grid dimensions (2D)
  Output: im (reconstructed image)
  '''

  # Initialize vectors, xn, yn spanning from 0 to dim *r with a step of r
  yn = np.arange(0,dim[0]*r,r).reshape(-1,1)
  xn = np.arange(0,dim[1]*r,r).reshape(-1,1) 

  # square yn once to save time in the main the loop
  yn_sq = (yn**2).reshape(1,-1) 
  # Initialize the output image, im, with zeros with a size of dim
  im = np.zeros((len(yn),len(xn)))

  # get sL, nS, and nC from X shape
  sL = X.shape[1]
  nS = X.shape[0]
  nC  = X.shape[2]

  # For every k independent measurement (total of nS) 
  for k in range(nS):
    # For every i, j interelement measurement (total of (nC * (nC-1)/2):
    for i in range(nC):
      for j in range(i+1,nC):
        # Calculate t matrix
        t = np.round((((np.sqrt((xn-i*s - k*d)**2+yn_sq))+(np.sqrt((xn-j*s-k*d)**2+yn_sq)))/V+eps)/sR)
        # Mask T matrix to discard out of range values (values bigger than sL) and add the correct signal to the image
        t[t>=max_length] = -2
        t= t.astype(int).T
        im += np.ma.array(X[k,t, i, j], mask = t==-2) 
  return im

