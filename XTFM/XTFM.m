function [im] = XTFM(X, V, eps, sR, d, s, r, dim)
 
%{
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
 %}

%Initialize vectors, xn, yn spanning from 0 to dim *r with a step of r

yn = 0:r:dim(1)*r-r;   
xn = 0:r:dim(2)*r-r;   

%square yn once to save time in the main the loop
yn_sq = (yn.^2)';

%Initialize the output image, im, with zeros with a size of dim
im =zeros(length(yn), length(xn));

% get sL, nS, and nC from X shape
sL = size(X,2);
nS = size(X, 1);
nC  = size(X, 3);

% For every k independent measurement (total of nS) 
for k = 1:nS
    %For every i, j interelement measurement (total of (nC * (nC-1)/2):
    for i =1:nC-1
        for j=i+1:nC
            % Calculate t matrix
            t = round(((sqrt((bsxfun(@plus,((xn-i*s+s-k*d+d).^2),yn_sq)))+sqrt((bsxfun(@plus,((xn-j*s+s-k*d+d).^2),yn_sq))))./V+eps)/sR);
            %Mask T matrix to discard out of range values (values bigger than sL) and add the correct signal to the image
            t2 = t;
            t2(t2>sL) = sL;
            im = im + reshape(X(k,t2, i,j), dim).* (t<=sL);
        end
    end     
end

end

        
