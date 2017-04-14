function [ deltaV ] = deltaVLaunch( ro, rf, lat )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  mu = 3.98600441E14; %m^3 s^-2
  w = 2*pi/(23.95*60*60); %Period of earth in rad/sec

deltaV = sqrt(mu/(rf)) - ro*cosd(lat)*w; %free DeltaV from earths rotation

end