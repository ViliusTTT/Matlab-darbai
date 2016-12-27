
% Broideno metodas 2 lygciu sistemai su vaizdavimu
function output = Broiden_metodas_tinkleliui(ss,ss2)

x=[ss;ss2];
n=length(x);
itmax=150;

% Pradinio Jakobio matricos artinio apskaiciavimas: **********
if 1  % pradinis A artinys skaiciuojamas pagal skaitinio diferencijavimo formule;
    dx=sum(abs(x))*1e-5; f0=f(x);
    for i=1:n
        x1=x;x1(i)=x1(i)+dx; 
        f1=f(x1);
        A(:,i)=(f1-f0)/dx;
    end
else,  % pradinis A artinys yra parinkta istrizainine matrica 
    A=eye(n)*10  %*15 *8) 
end  

% Broideno metodo iteracijos:
ff=f(x);  % pradine funkcijos reiksme
for iii=1:itmax
    deltax=-A\ff; 
    x1=x+deltax; 
    ff1=f(x1);
    A=A+(ff1-ff-A*deltax)*deltax'/(deltax'*deltax);
    tikslumas=norm(deltax)/(norm(x)+norm(deltax));
    
    if tikslumas < eps, output=[x(1),x(2),1]; break;
    elseif iii == itmax, output =[x(1),x(2),0];  break;
    end
    
    ff=ff1;x=x1;
    
end

return
end

%   Lygciu sistemos funkcija 
    function fff=f(x)
       fff=[x(2)^2-x(2)^2-5*x(1)*cos(x(2)+1)-10;
         x(1)^2+x(2)^2+x(1)*x(2)-20];
    return
    end

    function Z=pavirsius(funk,x,y)
        for i=1:length(x), for j=1:length(y)
              Z(i,j,1:2)=funk([x(i),y(j)]);
        end, end
    return
    end