% ENGR-240 Project, Problem 2
% Written By: [author], [date]
%
%  Uses MATLAB ode45 solver to calculate the water height in a tank
%  as a function of time. Several sizes of outflow hole are modled and
%  finally an outflow hole size is determined which will result in an
%  average water height of 3m.

Atank = 3.13;
Ahole = 0.06;
k1 = 300;
k2 = 200;
rho = 1e3;
h0=3;
tspan = [0 150];

% Part a, solve and plot dh/dt with Ahole=0.06m^2
[ah, t, h] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank);

plot(t,h)
title('Water Height vs Time')
xlabel('Time (s)')
ylabel('Water Height (m)')
text(10,3.3,'Ahole = 0.06 m^2')
grid

% Part b, solve and plot dh/dt with Ahole = 0.01, 0.04, 0.07. 0.10
Ahole = 0.01;
[ah, t1, h1] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank);

Ahole = 0.04;
[ah, t2, h2] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank);

Ahole = 0.07;
[ah, t3, h3] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank);

Ahole = 0.10;
[ah, t4, h4] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank);

figure
plot(t1,h1,'b-',t2,h2,'b-.',t3,h3,'b--',t4,h4,'b:+')
title('Water Height vs Hole Area vs Time')
xlabel('Time (s)')
ylabel('Water Height (m)')
legend('0.01 m^2','0.04 m^2','0.07 m^2', '0.10 m^2','Location','NorthWest')
grid

% Find a value of Ahole where water level averages 3m.
% Ahole size found via linear interpolation

Ahole = 0.039181; %oscillates around 3m
[ah, t, h] = WaterTankHeight(tspan,h0,k1,k2,rho,Ahole,Atank);
ah

figure
plot(t,h)
title('Water Height vs Time')
xlabel('Time (s)')
ylabel('Water Height (m)')
text(10,3.35,'Ahole = 0.03981 m^2')
grid


