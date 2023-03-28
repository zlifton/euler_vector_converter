% Converts Euler vector (pole lat/long and rotation magnitude) into plate
% motion at surface in North and East velocities (Ve, Vn, rate, direction).
% Created by Zach Lifton on Sept 03 2009
% Radius units in cm

%Inputs:

lambdap = input('Enter Euler vector latitude plate (S & W as negative):') ;
phip = input('Enter Euler vector longitude of plate (S & W as negative):') ;
omega = input('Enter Euler vector rotation magnitude of plate :') ;
lambdax = input('Enter latitude of location (S & W as negative):') ;
phix = input('Enter longitude of location (S & W as negative):') ;
R = 6.37*10^8 ;

% Test Data (ctrl+t/ctrl+r toggles comments):
% lambdap = 56 ;
% phip = -94 ;
% omega = 7.2*10^(-7) ;
% lambdax = -28 ;
% phix = -71 ;
% R = 6.37*10^8 ;

% Computations:

omega = (omega*pi/180) ;
a = acosd(sind(lambdax)*sind(lambdap) + cosd(lambdax)*cosd(lambdap)*cosd(phip - phix)) ;
C = asind(((cosd(lambdap))*(sind(phip - phix))/sind(a))) ;
v = omega*R*(sind(a)) ;
beta = 90 + C ;
Vns = R*omega*(cosd(lambdap))*(sind(phix - phip)) ;
Vew = R*omega*((sind(lambdap))*(cosd(lambdax)) - (cosd(lambdap))*(sind(lambdax))*(cosd(phix - phip))) ;

% Display results:

disp('North velocity (cm/yr):') 
disp(Vns)
disp('East velocity (cm/yr):')
disp(Vew)
disp('Rate (cm/yr):')
disp(v)
disp('Direction (azimuth degrees):')
disp(beta)

% End