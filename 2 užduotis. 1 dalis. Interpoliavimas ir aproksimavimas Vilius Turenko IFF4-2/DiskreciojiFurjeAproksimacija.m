%III uþduotis. Aproksimavimas - diskreèioji Furje aproksimacija
function DiskreciojiFurjeAproksimacija
clc,close all,clear all
n=500; n=round(n/2)*2+1                                % tasku skaicius, nelyginis
m=(n+1)/2                                                           % m - harmoniku skaicius

T=10;
dazniu_slenkstis=m/2                                         % harmoniku numeriu slenkstis triuksmu filtravimui
ampl_slenkstis=0.5                                            % harmoniku amplitudziu slenkstis triuksmu filtravimui
dt=T/n
N=1000                                                                % vaizdavimo tasku skaicius
dttt=T/N

t=[0:dt:T-dt];
ttt=[-T:dttt:2*T];

fff=fnk(T,t);                                                          % apskaiciuojame ir pavaizduojame duota tasku seka
figure(1),hold on,grid on,plot(t,fff,'b.-','MarkerSize',8);
legend(sprintf('Vienas funkcijos periodas n=%d tasku',n))
title('Duotoji funkcija')

ac0=dot(fff,fC(0,T,t))/n;
for i=1:m-1
    ac(i)=dot(fff,fC(i,T,t))*2/n;
    as(i)=dot(fff,fS(i,T,t))*2/n;
end

figure(2),hold on
bar(0:m-1,[ac0,sqrt(ac.^2+as.^2)],0.01)
xx=axis;
plot(xx(1:2),ampl_slenkstis*[1 1],'m--','LineWidth',3);                         % braizo amplitudziu slenkscio linija
plot(dazniu_slenkstis*[1 1],xx(3:4),'g--','LineWidth',3);                       % braizo dazniu slenkscio linija
title('Furje amplitudziu spektras pagal kompleksinio skaiciaus moduli ')
legend({'amplitudziu spektras';'amplitudes slenkstis';'dazniu slenkstis'})


fffz=ac0*fC(0,T,ttt)
frequencies=[1:m-1];
frequencies=frequencies(find(frequencies < dazniu_slenkstis))
for i=frequencies
    if sqrt(ac(i)^2+as(i)^2) > ampl_slenkstis
        fffz=fffz+ac(i)*fC(i,T,ttt)+as(i)*fS(i,T,ttt);
    end
end

figure(3),hold on,grid on, plot(ttt,fffz,'r');plot(t,fff,'b-','LineWidth',2);
legend(sprintf('n=%d tasku, m=%d harmoniku, a-slenkstis=%g  d-slenkstis=%g',n,m,ampl_slenkstis,dazniu_slenkstis))
title(sprintf('Pagal Furje spektra atkurta funkcija'))

return
end

function c=fC(i,T,t), if i==0,c=1*cos(0*t); else, c=cos(2*pi*i/T*t); end, return, end
function s=fS(i,T,t), s=sin(2*pi*i/T*t); return, end
% function rez=fnk(T,t), rez=sign(2*pi*t/T).*cos(2*pi*3*t/T)+0.1; return, end                                    %Signalas
 function rez=fnk(T,t), rez=0.2*cos(2*pi*100*t/T)+0.12*cos(2*pi*20*t/T); return, end                %Triuksmas g(t)
%function rez=fnk(T,t), rez=sign(2*pi*t/T).*cos(2*pi*3*t/T)+0.1+0.2*cos(2*pi*100*t/T)+0.12*cos(2*pi*20*t/T); return, end  %Signalas su triuksmu
%function rez=fnk(T,t), rez=sign(2*pi*t/T).*cos(2*pi*3*t/T)+0.1+0.2*cos(2*pi*100*t/T); return, end
