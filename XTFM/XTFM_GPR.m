clc
close all
clear all


%% Loading the file %% 
disp('GPR Data is loading..........')
% Place the raw mat file in the same folder of this file, 
% We will share a DZT to mat converter when GSSI allows us to do so. 
fileName = "Specimen_3.mat";
% Read and clean the file
tic
data = importdata(fileName);
toc1=toc;
disp(['Data Loaded Successfully in ', num2str(toc1), ' seconds'])

%% Input parameters
% Define the required parameters for XTFM image reconstruction

% Desired region of interest, 300 means: 300 hundered pixels with a resolution defined below
mesh_dim = [300,952];
% transducer spacing, this is 1.6 inch for GSSI mini XT
spacing = 1.6;      
% recording frequency, it is 0.1 inch for GSSI mini XT
recording_step = 0.1;      
% signal resolution (This is 8.41ns signal duration for GSSI mini XT over the number of data points (512)
sR = 8.41 / 512;   
% Desired Resolution (Finer resolution = more processing time)
resolution = 0.05; % (meters)     
% Assuming wave speed
v=4.2;  %(inch/ns)
% Assuming epsilon     
const = 0.9;   

%% Turn data into FMC format for XTFM
Y = zeros(size(data,2), size(data,1),2, 2);
Y(:, :, 1, 2) = data';
Y(:, :, 2, 1) = data';

%% Run XTFM

% Measuring run time
tic
img = XTFM(Y, v, const, sR, recording_step, spacing, resolution, mesh_dim);
toc2=toc;
disp (['Image reconstructed sucessfully in ', num2str(toc2), ' seconds'])

%Showing the image with desired colormap
imagesc(img)
colormap gray

% Setting plot axis labels and ticks
xlabel('Length (inch)');
ylabel('Height (inch)');
x_ticks = 0:50:mesh_dim(2);
y_ticks = 0:25:mesh_dim(1);
xticks(x_ticks);
yticks(y_ticks);
yticklabels(round(yticks*resolution, 2));
xticklabels(round(xticks*resolution, 2));
axis image
        