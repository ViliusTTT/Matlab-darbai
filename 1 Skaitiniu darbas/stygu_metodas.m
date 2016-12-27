% Stygu metodas
function stygu_metodas(f,a,b,sk)

range=[a, b]; % Intervalas tarp vienos ðaknies
eps=1e-9;  % parenkame tikslumo reikðmæ 
nitmax=100;% parenkame didþiausià leistinà iteracijø skaièiø

% Grafiko braiþymas
npoints=1000; x=range(1): (range(2)-range(1))/(npoints-1) :range(2);  
figure(sk); grid on; hold on;

str=[f,'=0;   Stygø metodas ']; title(str);
plot(x,eval(f),'r-');
plot(range,[0 0],'b-');

xn=range(1);xn1=range(2);prec=1;
nit=0;
while prec > eps
    nit=nit+1;
    if nit > nitmax, fprintf('Virðytas leistinas iteracijø skaièius');break;end
    plot(xn,0,'mp');h = findobj(gca,'Type','line');h1=h(1); % paskutinio grafinio objekto valdiklis áraðomas handle masyvo priekyje
    plot(xn1,0,'cp');h = findobj(gca,'Type','line');h2=h(1);
            x=xn;fxn=eval(f);x=xn1;fxn1=eval(f);
            k=abs(fxn/fxn1);xmid=(xn+k*xn1)/(1+k);
            plot(xmid,0,'gs');plot([xn,xn1],[fxn,fxn1],'g-');h = findobj(gca,'Type','line');h3=h(1:2);
    x=xmid;fxmid=eval(f);
    
    % jeigu pradþioje tikriname kairá taðkà
    x=xn;fxn=eval(f);
    if sign(fxmid) == sign(fxn), xn=xmid;
    else, xn1=xmid;
    end
  
    pause(0.2)
    delete(h1);delete(h2);delete(h3);
    
    prec=abs(fxmid); 
    fprintf(1,'iteracija %d  x= %g  prec= %g \n',nit,xn,prec);
end
plot(xmid,0,'k*');plot(xmid,0,'ko');
fprintf(1,'\n tikslumas pasiektas, ðaknis xmid= %g\n\n',xmid);


end

