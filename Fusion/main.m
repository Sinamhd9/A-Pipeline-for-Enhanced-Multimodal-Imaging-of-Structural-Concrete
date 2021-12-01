%% Main file for the proposed image fusion

% set im1 to the preprocessed XTFM image of GPR
im1 =  im_gpr;

% set im2 to the preprocessed XTFM image of UEA
im2 = im_uea;

% Average fusion
fused_ave = (im1+im2)/2; 

% Max fusion
fused_max = max(im1,im2);

% Product fusion
fused_prod = im1.*im2;

%% Proposed fusion
% rule on approximations (FusionCustomRule.m function)
Fusmeth_approx = struct('name','UserDEF','param','FusionCustomRule');

% fused image with symlet 5 wavelet and 4 levels decomposition
fused_wav = (wfusimg(im1, im2,'sym5',4, Fusmeth_approx ,'max'));

%% Result
imagelist= {im1,im2,fused_ave,fused_max,fused_prod,fused_wav};

figure
imshow(imtile(imagelist, 'BorderSize', [20,10],'BackgroundColor','w'))