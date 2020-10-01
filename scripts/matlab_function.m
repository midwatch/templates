function [ah, t, h] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank)
% WaterTankHeight uses the MATLAB ode45 function to solve the differential
% equation that models the tank water height as a function of time
%
% Written By: [author], [date]
%
% Synopsis: WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank)
%
% Input:    tspan, [start end] (s)
%           h0, initial water height (m)
%           k1, 1st coefficient (kg/s)
%           k2, 2nd coefficient (kg/s)
%           rho, fluid density (kg/m^3)
%           Ahole, Area of drain hole (m^2)
%           Atank, Area of tank (m^2)
%
% Output:   ah, average water height for period (m)
%           t, time (s)
%           h, tank height (m)
%
% Constants:    g, gravity (9.81 m/s^2)
%

g = 9.81;

dhdt =@(t,h,k1,k2,rho,Ahole,Atank) ...
    (k1+k2*cos((pi*t)/12)-rho*Ahole*sqrt(2*g*h))/(rho*Atank);

[t, h] = ode45(dhdt,tspan,h0,[],k1,k2,rho,Ahole,Atank);

ah = mean(h);


