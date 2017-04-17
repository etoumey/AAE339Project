%%%%%%%%%%%%%%%%%%%%% AAE 339 Project %%%%%%%%%%%%%%%%%%%%%
%  Description: Main script for orbital calculations      %
%  Team 7:   Henry Heim                                   %
%            Logan Kirsch                                 %
%            Chris Prak                                   %
%            Glen Shumaker                                %  
%            Eliot Toumey                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

% Constants 
payloadMass = 3000; % kg
lat = 28.4740;

% Orbit charicteristics
altOriginal = 6.3710088E6; %earth's radius in meters
altLEO = 100; % km, low earth orbit altitude
altGEO = 35786; % km, geostationary orbit altitude
incLEO = lat; % low earth orbit inclination
incGEO = 0; % geostationary orbit inclinaton

dVLaunch = deltaVLaunch( altOriginal, altOriginal+altLEO*1000, lat, 90 );
dVTransfer = deltaVTransfer( altLEO+altOriginal/1000, altGEO+altOriginal/1000 );
% dVCircularize = deltaVCircularize( r1, r2 );
% dVInclination = deltaVInclination( r, angle );