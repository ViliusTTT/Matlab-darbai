%
% Vienos lygties sprendimas: paprastuju iteraciju metodas
% 
function paprastuju_iteraciju(a,b,sk)
%------------------------   PRADINIAI DUOMENYS  ----------------------------
% range=[-10,10] % parenkame saknu atskyrimo intervala
range=[a,b]

 x0=a;   % parenkame pradini artini

eps=1e-4   % parenkame sprendinio tikslumo reiksme

nitmax=100 % parenkame didziausia leistina iteraciju skaiciu

method='simple_iteration'  % parenkame metoda

alpha=1 % parenkame daugiklio reiksme
alpha=-1
% alpha=-10000
alpha=1       % sita reik parinkt kiekvienam skirtinga  
% alpha=-2
% alpha=-10

% braizomas funkcijos grafikas
npoints=1000; x=range(1): (range(2)-range(1))/(npoints-1) :range(2);  fff=f(x);
figure(sk); grid on; hold on; axis equal;
plot(x,fff/alpha+x,'r-');
plot(range,[0 0],'b-');
%------------------------   SPRENDIMAS  -----------------------------------

xn=x0;prec=1e20; nit=0; % pradinis artinys, pradine tikslumo reiksme ir iteracijos numeris
while prec > eps  % iteracijos
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius. Tikslumas nepasiektas');return;end

    if strcmp(method,'simple_iteration')
            fn=f(xn)/alpha+xn;
            plot([xn,xn,fn],[xn,fn,fn],'g-');
            plot(xn,fn,'mp');
            xn=fn;
    else, fprintf('neaprasytas metodas \n');
    end
     
        pause(0.2)
        
    prec=abs(f(xn));
    fprintf(1,'iteracija %d  x= %g  prec= %g \n',nit,xn,prec);
end
plot(xn,fn,'k*');plot(xn,fn,'ko');

fprintf(1,'\n tikslumas pasiektas, saknis xmid=%g\n\n',xn);

end


function fff=f(x)
    fff=(x.^4+0.75*x.^3-5.125*x.^2+4.5*x-1.125)*1;
%     fff=64*x.^4-576*x.s^3+10*x.^2+9*x;
return
end