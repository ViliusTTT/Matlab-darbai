function pusiaukirtu_metodas(f,a,b,sk)


%------------------------   PRADINIAI DUOMENYS  ---------------------------



% range=[-10,10] % parenkame saknu atskyrimo intervala 
%range=[-2.2,1.8]; 
 range=[a,b];
%range=[-2.2,-1.8]; 
eps=1e-5;  % parenkame tikslumo reiksme 
nitmax=200; 
% braizomas funkcijos grafikas
npoints=1000; x=range(1): (range(2)-range(1))/(npoints-1) :range(2);  
figure(sk); grid on; hold on;

str=[f,'=0;   Pusiaukirtu metodas ']; title(str);
plot(x,0,'r-');
plot(range,[0 0],'b-');

xn=range(1);xn1=range(2);prec=1;
nit=0;

%------------------------   SPRENDIMAS  -----------------------------------

xn=range(1);xn1=range(2);prec=1;
nit=0;
while prec > eps
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius');break;end
    plot(xn,0,'mp');h = findobj(gca,'Type','line');h1=h(1); % paskutinio grafinio objekto valdiklis irasomas handle masyvo priekyje
    plot(xn1,0,'cp');h = findobj(gca,'Type','line');h2=h(1);


xmid=(xn+xn1)/2;plot(xmid,0,'gs');h = findobj(gca,'Type','line');h3=h(1);
        
    x=xmid;fxmid=eval(f);
    
    % jeigu pradzioje tikriname kairi taska
    x=xn;fxn=eval(f);
    if sign(fxmid) == sign(fxn), xn=xmid;
    else, xn1=xmid;
    end
    
%     x=xn1;fxn1=eval(f);
%     if sign(fxmid) == sign(fxn1), xn1=xmid;
%     else, xn=xmid;
%     end
        
    pause(0.05)
    delete(h1);delete(h2);delete(h3);
    
    prec=abs(fxmid); 
    fprintf(1,'iteracija %d    tikslumas= %g \n',nit,prec);
end
plot(xmid,0,'k*');plot(xmid,0,'ko');
fprintf(1,'\n tikslumas pasiektas, saknis xmid=%g\n\n',xmid);
