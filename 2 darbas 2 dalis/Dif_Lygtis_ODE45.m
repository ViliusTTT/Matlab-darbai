%
% ode45 standartin� funkcija
%
function Dif_Lygtis_ODE45
clc, clear all,
close all;
global rH c h0 tmax1 rc g;
rH = 0.01; % dugne esan�ios ertm�s spindulys
c = 0.6; % proporcingumo daugiklis
h0 = 0.3; % pradinis skys�io auk�tis inde
tmax1 = 100; % galinis laiko monentas (s)
rc = 0.075; % skys�io spindulys
g = 9.8; % laisvo kritimo pagreitis

[T,X]=ode45(@funkcija,[0 tmax1],h0);
figure(1); hold on; grid on;
plot(T,X,'.-');
xlabel('laikas (s)'); ylabel('Vandens lygis inde (m)');
title('ode45 standartin� funkcija');
function f=funkcija(t,h)
%    rc = (h/2)+1/40*cos((50*pi*h)/3)+0.09; % kinta vir�uje esan�io skys�io spindulys (u�komentuoti, kai cilindras)
    if h > 0
    f=-(((c*rH.^2)/rc.^2)*(2*g*h).^(1/2));
    else
        f=0;
    end
end
end