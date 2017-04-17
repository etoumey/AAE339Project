function [ deltaV ] = deltaVTransfer( r1, r2 )
% Computes the delta v required to inject into a Hohmann transfer orbit,
% given the initial and final orbit altitudes.
%   r1: Initial orbit height (km)
%   r2: Final orbit height (km)
    
    % Constant definitions
    G = 6.67408e-11; % m^3 kg^-1 s^-2
    M = 5.9721986e24; % kg
    
    % Convert given orbit radii from km to m

    
    % Compute the required delta v
    deltaV = sqrt(G * M / r1) * (sqrt(2 * r2 / (r1 + r2)) - 1);
end