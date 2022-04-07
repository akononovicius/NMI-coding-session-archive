% The main scripts ETS 1-3

clear all;

%% Get user input

width = input('Width (m): ');
length = input('Length (m): ');
height = input('Height (m): ');
thick = input('Thickness (m): ');

%% Calculating volume

boxVolume = getCuboidVolume(width,length,height,0) - ...
    getCuboidVolume(width,length,height,thick);

%% Calculating mass

rho = 2.7 * (100^3) / 1000; % kg / m^3
boxMass = rho * boxVolume;

fprintf('Weight of the box is %.2f kg.\n',boxMass);