function [ deltaV ] = deltaVInclination( alt, angle )
% Calculates the delta v required to change inclination a given amount at a
% given altitude.
%   alt: Orbit altitude (km)
%   angle: Desired change in inclination (degrees)
    
    % Constant efinitions
    G = 6.67408e-11; % m^3 kg^-1 s^-2
    M = 5.9721986e24; % kg
    
    % Calculate orbital velocity at given altitude
    velocity = sqrt(G * M / (alt * 1000));
    
    % Calculate required delta v to change inclination
    deltaV = 2 * velocity * sind(angle / 2);
end