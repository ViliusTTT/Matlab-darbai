%
% Oilerio metodas
%
function Dif_Lygtis_Oileris
clc, clear all,
close all
spalva='r';
x0=0; % pradinis laiko momentas (s)
% dx=2; % integravimo zingsnis
% dx=0.05; % integravimo zingsnis
dx=1; % integravimo zingsnis

global rH c h0 tmax1 rc g;
rH = 0.01; % dugne esanèios ertmës spindulys
c = 0.6; % proporcingumo daugiklis
h0 = 0.3; % pradinis skysèio aukğtis inde
tmax1 = 100; % galinis laiko monentas (s)
rc = 0.075; % skysèio spindulys
g = 9.8; % laisvo kritimo pagreitis

nsteps=tmax1/dx;
figure(1), hold on, grid on;
xlabel('laikas (s)'); ylabel('Vandens lygis inde (m)');
title('Oilerio metodas');
x=x0;y=h0;
pntx=x;pnty=y;
for i=1:nsteps
    dy=DY(x,y);
    y=y+dx*dy;
    x=x+dx;
    plot(x,y,[spalva,'.'],'MarkerSize',8)
    plot([pntx,x],[pnty,y],[spalva,'-']);
    pntx=x;pnty=y;
end
return
function dy=DY(x,y)
  rc = (y/2)+1/40*cos((50*pi*y)/3)+0.09; % kinta virğuje esanèio skysèio spindulys (uşkomentuoti, kai cilindras)
    if y > 0
        dy=-(((c*rH.^2)/rc.^2)*(2*g*y).^(1/2));
    else
        dy=0;
    end
return,end
end