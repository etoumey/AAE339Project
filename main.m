%%%%%%%%%%%%%%%%%%%%% AAE 339 Project %%%%%%%%%%%%%%%%%%%%%
%  Description: Main script for orbital calculations      %
%  Team 7:   Henry Heim                                   %
%            Logan Kirsch - Sucks                         %
%            Chris Prak                                   %
%            Glen Shumaker                                %  
%            Eliot Toumey                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

% Constants 
payloadMass = 3000; % kg
lat = 28.4740;

% Orbit charicteristics
rEarth = 6.3710088E6; %earth's radius in meters
altLEO = linspace(160000, 2000000, 1000); % m, low earth orbit altitude
altGEO = 35786000; % m, geostationary orbit altitude
incLEO = lat; % low earth orbit inclination
incGEO = 0; % geostationary orbit inclinaton

for i = 1:length(altLEO)
    dVLaunch(i) = deltaVLaunch( rEarth, rEarth+altLEO(i), lat, 90 );
    dVTransfer(i) = deltaVTransfer( altLEO(i)+rEarth, rEarth+altGEO);
    dVCircularize(i) = deltaVCircularize( rEarth+altLEO(i), rEarth+altGEO );
    dVInclination = deltaVInclination( rEarth+altGEO, lat );
    [dV1(i) dV2(i)] = staging(dVLaunch(i) + dVTransfer(i) + dVInclination, dVCircularize(i));
end
