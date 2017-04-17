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
altLEO = 100000; % km, low earth orbit altitude
altGEO = 35786000; % km, geostationary orbit altitude
incLEO = lat; % low earth orbit inclination
incGEO = 0; % geostationary orbit inclinaton

dVLaunch = deltaVLaunch( rEarth, rEarth+altLEO, lat, 90 );
dVTransfer = deltaVTransfer( altLEO+rEarth, rEarth+altGEO);
dVCircularize = deltaVCircularize( rEarth+altLEO, rEarth+altGEO );
dVInclination = deltaVInclination( rEarth+altGEO, lat );

[dV1 dV2] = staging(dVLaunch + dVTransfer + dVInclination, dVCircularize);