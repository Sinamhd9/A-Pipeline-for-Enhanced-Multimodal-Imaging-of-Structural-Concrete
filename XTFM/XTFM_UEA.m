clc
close all
clear all


%% Loading the file %% 
disp('UEA Data is loading..........')

% Number of measurements
nS = 98;
% Place the raw csv file in the same folder of this file
fileName = "Specimen_3.csv";
% Read and clean the file
tic
data=readFile(fileName, nS);
toc1=toc;
disp(['Data Loaded Successfully in ', num2str(toc1), ' seconds'])

%% Input parameters
% Define the required parameters for XTFM image reconstruction

% Desired region of interest, 300 means: 300 hundered pixels with a resolution defined below
mesh_dim = [300,952];
% transducer spacing, this is 3 centimeters for Proceq pundit array
spacing = 0.03;      
% recording frequency, it is 1 cm in our measurements (we are recording every 1 cm)
recording_step = 0.01;      
% signal resolution (This is 1ms signal duration over the number of data points (1000), equal to 1 micro second for proceq pundit)
sR = 1e-3 / size(data, 2);   
% Desired Resolution (Finer resolution = more processing time)
resolution = 0.00125; % (meters)     
% Assuming wave speed
v=2300;  %(m/s)
% Assuming epsilon     
const = 0.00005;   

%% Turn data into FMC format
Y= FMC(data,8);

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
xlabel('Length (m)');
ylabel('Height (m)');
x_ticks = 0:50:mesh_dim(2);
y_ticks = 0:25:mesh_dim(1);
xticks(x_ticks);
yticks(y_ticks);
yticklabels(round(yticks*resolution, 2));
xticklabels(round(xticks*resolution, 2));
axis image
        