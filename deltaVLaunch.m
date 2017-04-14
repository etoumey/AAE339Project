function [ deltaV ] = deltaVLaunch( ro, rf, lat, azimuth )
%UNTITLED Summary of this function goes here
%   Azimuth in launch trajectory in degrees. 90 is due east.

mu = 3.98600441E14; %m^3 s^-2
w = 2*pi/(23.95*60*60); %Period of earth in rad/sec

deltaVGrav = 1500;  % [m/s]
deltaVDrag = 150; % [m/s]
deltaVSteer = 200; % [m/s]

deltaV = sqrt(mu/(rf)) - ro*cosd(lat)*w*sind(azimuth) + deltaVGrav + deltaVDrag + deltaVSteer; %free DeltaV from earths rotation

end