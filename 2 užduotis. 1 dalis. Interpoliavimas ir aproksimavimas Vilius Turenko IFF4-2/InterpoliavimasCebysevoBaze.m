%-------------------------------------------------------------------------------------------------------
%I uþduotis. Interpoliavimas daugianariu. 
% Duota interpoliuojamos funkcijos analitinë iðraiðka.
% Pateikite interpoliacinës funkcijos iðraiðkà 
%-------------------------------------------------------------------------------------------------------
function InterpoliavimasCebysevoBaze
clc;
close all;
xmin=-2 ;xmax=3;                                             % duotas funkcijos apibrezimo intervalas
n=6;                                                                    % interpoliavimo tasku skaicius
xxx=[xmin:(xmax-xmin)/(n-1):xmax];                 %Tolygiai paskirstyti interpoliavimo taskai
x=reshape(xxx,[n,1]);                                         % tolygiai paskirstytu interpoliavimo tasku abscises

X=min(x)-2:(max(x)-min(x))/1000:max(x)+2;          %x reiksmes vaizdavimui
xcc = cos((2*(1:n)'-1)*pi/2/n);                           %Chebyshevs abscises
xc=reshape(xcc,[1 n]);                                      %Reshapinam cebysevo reiksmiu masyva
y=funkcija(x);                                                      %Gaunam tolygiai paskirstytu interpoliavimo tasku ordinates
yc=funkcija(xc);                                                  %Gaunam tolygiai paskirstytu cebysevo interpoliavimo tasku ordinates
                                                                            %Apsirasom legenda
leg={'duota funkcija',...
    'Ciobysevo abscises',...
    'interpoliavimas per Ciobysevo mazgus',...
    'netiktis interpoliuojant per tolygiai isdestytus cebysevo mazgus',...
    'tolygiai isdestyti mazgai',...
    'interpoliavimas per tolygiai isdestytus mazgus',...
    'netiktis interpoliuojant per tolygiai isdestytus mazgus'};
figure(1), hold on, grid on,box on,axis equal, set(gcf,'Color','w');
plot(X,funkcija(X),'b-')                                         % vaizduojama duotoji funkcija (t.y. pagal kuria interpoliuojama)

hg=legend(leg{1});
pause
plot(xc,yc,'go','MarkerFaceColor','g','MarkerSize',8) % vaizduojami tolygiai isdestyti cebysevo interpoliavimo taskai

delete(hg);
hg=legend(leg{1:2});
pause

[cc] = CebysevoDaugianaris(xxx);                   %Gaunam cebysevo daugianario koeficientus pagal tolygiai isdestytus interpoliavimo taskus(ne cebysevo)
c=reshape(cc,[1 n]);                                           %Reshapinam koeficientu masyva
[ccx] =  CebysevoDaugianaris(xc)                   %Gaunam cebysvo daugianario koefcinetus pagal tolygiai isdestytus cebysevo interpoliavimo taskus
cx=reshape(ccx,[1 n]);                                        %Reshapinam koefcinetu masyva

t =-1.2:0.01:1.6;                                                   %Interpoliavimo vaizdavimui skirtos reiksmes(Cebysevo mazgams)
t2 =-2:0.01:3;                                                       %Interpoliavimo vaizdavimui skirtos reiksmes(Ne Cebysevo mazgams)
ffc=CebysevoDaugianarioReiksmes(cx,t);      %Interpoliuojancios cebysevo baze paremtos funkcijos sudarymas (Cebysevo mazgai)
ff=CebysevoDaugianarioReiksmes(c,t2);        %Interpoliuojancios cebysevo baze paremtos funkcijos sudarymas(Ne cebysevo mazgai)
plot(t,ffc,'g')                                                           %Atvaizduojam funkcija(cebysevo mazgai naudojami)
plot(t,funkcija(t)-ffc,'g--')                                       %Atvaizduojam netiktis(cebysevo mazgai naudojami)
delete(hg);
hg=legend(leg{1:4});
pause
plot(x,y,'ro','MarkerFaceColor','r','MarkerSize',8) % vaizduojami tolygiai isdestyti interpoliavimo taskai
delete(hg);
hg=legend(leg{1:5});
plot(t2,ff,'r')                                                             %Atvaizduojam interpoliuojancia funkcija  (ne cebysevo mazgai naudojami)
delete(hg);
hg=legend(leg{1:6});
plot(t2,funkcija(t2)-ff,'r--')                                       %Atvaizduojam netiktis(ne Cebysevo mazgai naudojami)
delete(hg);
hg=legend(leg{1:7});
end
%-------------------------------------------------------------------------------------------------------
%Funkcija naudojanti Cebysevo daugianario koeficientus, interpoliuojanciai
%funkcijos reiksmei rasti
%-------------------------------------------------------------------------------------------------------
function u = CebysevoDaugianarioReiksmes(c,x)
n = length(c);                                                         
u = c(n)*ones(size(x));                                                                       
if n > 1                                                                     
    ujp1 = u;
    u = c(n-1) + 2*x*c(n);
    for j = n-2:-1:1
        ujp2 = ujp1;
        ujp1 = u;
        u = c(j) + 2*x.*ujp1 - ujp2;
    end
    u = u - x.*ujp1;
end
end
%-------------------------------------------------------------------------------------------------------
% apskaiciuoja interpoliuojamos funkcijos ordinaciu reiksmes taskuose x
%-------------------------------------------------------------------------------------------------------
function fnk=funkcija(x)

fnk=cos(2*x)./(sin(2*x)+1.5)-(x/5);
return
end
%-------------------------------------------------------------------------------------------------------
%Iesko cebysevo daugianario koefcientu   
%-------------------------------------------------------------------------------------------------------
function c = CebysevoDaugianaris(X)

Y=funkcija(X)                                                       %Randa ordinates pagal duotas abscises
n = numel(X);                                                       %Abscisiu skaicius
B=zeros(n,n);                                                       %Uzpildom B nuliais
B(:,1)=1;                                                               %Pirmas elementas lygus 1 (Pagal cebysevo polinomo sudarymo taisykles)
B(:,2)=X;                                                              %Antras elementas lygus x (Pagal cebysevo polinomo sudarymo taisykles)
for i=3:n                                                                %Pradedam nuo 3 elemento
    B(:,i)=2*X'.*B(:,i-1)-B(:,i-2);                             %Sekantis elementas lygus 2x padaugintam is ankstesniojo elemento pries ir elemento ankstesniojo ankstesniajam skirtumo
end
c=B\Y';                                                                    %Koeficientas randamas padalinus reiksmes is ordinaciu
    function fnk=funkcija(x)                                    % apskaiciuoja interpoliuojamos funkcijos ordinaciu reiksmes taskuose x
        fnk=cos(2*x)./(sin(2*x)+1.5)-(x/5);
        return
    end

end