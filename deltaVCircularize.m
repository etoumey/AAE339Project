function [ deltaV ] = deltaVCircularize( r1, r2 )
% Computes the delta v required to circularize from a Hohmann transfer
% orbit, given the initial and final orbit altitudes.
%   r1: Initial orbit height (km)
%   r2: Final orbit height (km)
    
    % Constant definitions
    G = 6.67408e-11; % m^3 kg^-1 s^-2
    M = 5.9721986e24; % kg
    
    % Convert given orbit radii from km to m
    r1 = r1 * 1000;
    r2 = r2 * 1000;
    
    % Compute the required delta v
    deltaV = sqrt(G * M / r2) * (1 - sqrt(2 * r1 / (r1 + r2)));
end