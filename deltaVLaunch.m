function [ deltaV ] = deltaVLaunch( ro, rf )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  mu = 3.98600441E14; %m^3 s^-2
  
  deltaV = sqrt(mu/ro)*(sqrt(2*rf/(ro+rf))-1);
kljAf;ljkSADF;LKJ

end