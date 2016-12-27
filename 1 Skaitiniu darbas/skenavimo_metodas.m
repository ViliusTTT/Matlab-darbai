function skenavimo_metodas(f,a,b,nr)

range=[a-0.2; b+0.2]; % parenkame saknu atskyrimo intervala 
plot(range(1), range(2));
eps=1e-9;  % parenkame tikslumo reikðme 
nitmax=150;% parenkame didþiausià leistinà iteracijø skaièiø
step = 1; % þingsnis
konst = 25;

% Grafiko braiþymas
npoints=1000; x=range(1): (range(2)-range(1))/(npoints-1) :range(2);  
figure(nr); grid on; hold on;
str=[f,'=0; Tikslinimas skenavimo metodu']; title(str);
plot(x,eval(f),'g-');
plot(range,[0 0],'b-');

xn=range(1);
xn1=range(2);
i = 0;
while xn < range(2)
nit=0;
prec = 1;
while prec > eps && xn < range(2)
     
    nit=nit+1;
    if nit > nitmax, fprintf('Virðitas leistinas iteraciju skaièius');break;end
    plot(xn,0,'mp'); %vaizduojamas kairys taðkas
    h = findobj(gca,'Type','line');
    h1=h(1); % paskutinio grafinio objekto valdiklis áraðomas handle masyvo priekyje
    plot(xn1,0,'cp'); %deðinio taðko vaizdavimas
    h = findobj(gca,'Type','line');
    h2=h(1);
    
    xn1 = xn + step;
    x = xn1;
    fxn1 = eval(f);
    x = xn; 
    fxn = eval(f);
    
    if sign(fxn) == sign(fxn1) ~= 0
            xn = xn1;
            xn1 = xn + step;
    else
             step = step / konst;
             xn = xn + step;
             xn1 = xn + step;
    end
    x = xn;
    fx = eval(f);
    prec = abs(fx); 
    pause(0.2)
   
    delete(h1);delete(h2); 
    fprintf(1,'iteracija %d    tikslumas= %g \n',nit,prec);
end
if (prec < eps)
    xmid = xn;
    plot(xn,0,'k*');plot(xn,0,'ko');
    fprintf(1,'\n tikslumas pasiektas, ðaknis xmid= %g -> tikslumas= %g\n',xmid, prec);
    xn = xn1 + step;
    step = 1;
    i=i+1;
end
end
