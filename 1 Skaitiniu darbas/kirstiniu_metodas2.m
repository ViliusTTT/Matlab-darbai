%
% Kirstiniø metodas
% 

function kirstiniu_metodas2(a,b,sk)
syms f x 
f=sin((exp(x)./5))+-x/5;
x0=a; % parenkame pradini artini
x01=a+0.01;  % kirstiniu metodui parenkame antra pradini artini  

deltax=0.01; % parenkame pradine zingsnio reiksme (reikalinga tik kirstiniu metodui)
nitmax=150; % parenkame didziausia leistina iteraciju skaiciu
if x0 ~= 0, range=[a-0.2,b+0.2]; % parenkame intervala vaizdavimui
else, range=[a-0.2,b+0.2];
end

eps=1e-9;  % Parenkame tiksluma
 x=x01;fxn1=eval(f);x=x0;fxn=eval(f);
    dfxn=(fxn1-fxn)/(x01-x0);  % Taikant kirstiniu metoda, reiks apskaiciuoti , 
                                   % pradines kirstines krypti pagal du pradinius artinius

% braizomas funkcijos grafikas:
npoints=1000; xrange=range(1): (range(2)-range(1))/(npoints-1) :range(2);  
figure(sk); grid on; hold on;  str=[char(f),'=0;   Kirstiniu metodas'];title(str);
x=xrange; % simbolinis x keiciamas reiksmemis is parinkto funkcijos vaizdavimo intervalo 
plot(x,eval(f),'r-');
plot(range,[0 0],'b-');
plot(x0,0,'mp');
h = findobj(gca,'Type','line');
h1=h(1);
       figure(sk); % skaiciavimas stabdomas iki bus paspaustas Enter klavisas

%Sprendimas
xn=x0;
prec=1;
nit=0;

    xn1=x01; 
    plot([xn,xn,xn1,xn1],[0,fxn,fxn1,0],'k-');
 % antras pradinis artinys
while prec > eps    % iteracijos 
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius');break;end
            
            xn1=xn-fxn/dfxn;
            plot([xn,xn,xn1],[0,fxn,0],'k-');
               pause(0.3);
            delete(h1);plot(xn1,0,'mp');h = findobj(gca,'Type','line');h1=h(1);
            x=xn1;fxn1=eval(f);dfxn=(fxn1-fxn)/(xn1-xn);
            xn=xn1;
            fxn=fxn1;
            
 figure(sk);
    x=xn;fxn=eval(f);prec=abs(fxn);
    fprintf(1,'iteracija %d  x= %g  prec= %g \n',nit,xn,prec);
end
plot(xn,fxn,'k*');plot(xn,fxn,'ko');
xn
nit

end


