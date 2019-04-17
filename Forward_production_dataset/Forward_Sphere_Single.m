function [Hax,Hay,Za,Delta_T]=Mag_Sphere_Forward(Grid_size,Grid_interval)
%% 球体/磁偶极子 磁场正演

%% Parameters
%% Invariant parameter
mu_0 = 4*pi*1e-7;% magnetic permeability
z = 0;% calculate the plane height(unit: m)

%% Random variation parameter
B = rand()*(60000-50000)+50000;% local magnetic field(unit: nT)
%B = (60000-50000)/2 + 50000
k = rand()*(0.2-0.07) + 0.07;% magnetic susceptibility(unit: SI)
%k = (0.2-0.07)/2 + 0.07
A = rand()*pi/4;% magnetic declination
%A = (pi/2-0)/2
I = rand()*pi/2;% magnetic dip
%I = (pi/2-0)/2
%%% Sphere model parameters
a = 5*round(rand()*(18+18)+(-18));% sphere center coordinate x(unit: m)
b = 5*round(rand()*(18+18)+(-18));% sphere center coordinate y(unit: m)
c = 2*round(rand()*(40-20)+20);% sphere center coordinate z/sphere center depth(unit: m)
R = 2*round(rand()*(15-10)+10);% sphere radius(unit: m)


%% Parameters that vary with parameters
vol = 4*pi*R*R*R/3;% sphere volume; vol=1(magnetic dipole is a sphere of unit volume)
M = k*B/mu_0;% magnetization intensity
m = M*vol;% magnetic moment
C_parameter = mu_0*m/(4*pi); % a combination parameter

%% Formula calculation
x = -Grid_size:Grid_interval:Grid_size;
y = -Grid_size:Grid_interval:Grid_size;
Points_num = size(x,2);
for i=1:Points_num
    for j=1:Points_num
        distance = ((x(i)-a)^2+(y(j)-b)^2+(z-c)^2)^0.5; % Grid point to model distance
        % Bij
        %{
        Bxx(j,i) = C_parameter*3/(distance^7)*(   ( 3*((y(j)-b)^2)+3*((z-c)^2)-2*((x(i)-a)^2) )*(x(i)-a)*cos(I)*cos(A)      +(   (y(j)-b)^2+(z-c)^2-4*((x(i)-a)^2)   )*(y(j)-b)*cos(I)*sin(A)           +(    (y(j)-b)^2+(z-c)^2-4*((x(i)-a)^2)     )*(z-c)*sin(I)       );
        Bxy(j,i) = C_parameter*3/(distance^7)*(   (       (y(j)-b)^2+(z-c)^2-4*((x(i)-a)^2)   )*(y(j)-b)*cos(I)*cos(A)      +(   (x(i)-a)^2+(z-c)^2-4*((y(j)-b)^2)   )*(x(i)-a)*cos(I)*sin(A)           +                         5*(x(i)-a)*(y(j)-b)*(z-c)*sin(I)       );
        Bxz(j,i) = C_parameter*3/(distance^7)*(   (          (y(j)-b)^2+(z-c)^2-4*((x(i)-a)^2)   )*(z-c)*cos(I)*cos(A)                               +5*(x(i)-a)*(y(j)-b)*(z-c)*cos(I)*sin(A)        +(     (y(j)-b)^2+(x(i)-a)^2-4*(z-c)^2      )*(x(i)-a)*sin(I)       );
        Byz(j,i) = C_parameter*3/(distance^7)*(                                5*(x(i)-a)*(y(j)-b)*(z-c)*cos(I)*cos(A)       +(     (x(i)-a)^2+(z-c)^2-4*((y(j)-b)^2)   )*(z-c)*cos(I)*sin(A)        +(     (x(i)-a)^2+(y(j)-b)^2-4*(z-c)^2      )*(y(j)-b)*sin(I)       );
        Bzz(j,i) = C_parameter*3/(distance^7)*(   (       ((y(j)-b)^2)+(x(i)-a)^2-4*((z-c)^2) )*(x(i)-a)*cos(I)*cos(A)   +(      (x(i)-a)^2+(y(j)-b)^2-4*((z-c)^2)   )*(y(j)-b)*cos(I)*sin(A)   +(    3*((x(i)-a)^2)+3*((y(j)-b)^2)-2*((z-c)^2)     )*(z-c)*sin(I)       );
        Byy(j,i) = -(Bxx(j,i)+Bzz(j,i));
        %}
        % Bi
        Hax(j,i) = C_parameter/(distance^5)*(  (2*((x(i)-a)^2)-(y(j)-b)^2-(z-c)^2)*cos(I)*cos(A)                  +3*(x(i)-a)*(y(j)-b)*cos(I)*sin(A)                     +3*(x(i)-a)*(z-c)*sin(I)     );
        Hay(j,i) = C_parameter/(distance^5)*(                  3*(x(i)-a)*(y(j)-b)*cos(I)*cos(A)  +(2*((y(j)-b)^2)-(x(i)-a)^2-(z-c)^2)*cos(I)*sin(A)                     +3*(y(j)-b)*(z-c)*sin(I)     );
        Za(j,i) = C_parameter/(distance^5)*(                      3*(x(i)-a)*(z-c)*cos(I)*cos(A)                     +3*(y(j)-b)*(z-c)*cos(I)*sin(A)  +(2*((z-c)^2)-(x(i)-a)^2-(y(j)-b)^2)*sin(I)     );
        Delta_T(j,i) = (Hax(j,i)*cos(I)*cos(A) + Hay(j,i)*cos(I)*sin(A) + Za(j,i)*sin(I));
    end
end
end