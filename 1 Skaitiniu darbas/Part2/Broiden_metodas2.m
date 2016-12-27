
% Broideno metodas
function Broiden_metodas2
clc,close all

eps=1e-15
itmax=100000
x=[-5;2;-9;3];   
n=length(x);

% Pradines Jakobio matricos reiksmes apskaiciavimas:
dx=sum(abs(x))*1e-5;
f0=f(x);
for i=1:n, x1=x; x1(i)=x1(i)+dx; f1=f(x1); A(:,i)=(f1-f0)/dx; end
% A=-eye(n)*10   %*10  *(-10) 

% Broideno metodo iteracijos:
fi=f(x);  % pradine funkcijos reiksme
for iii=1:itmax
    deltax=-A\f(x); x=x+deltax; fi1=f(x); A=A+(fi1-fi-A*deltax)*deltax'/(deltax'*deltax);
    
    tikslumas=norm(deltax)/(norm(x)+norm(deltax));
    fprintf(1,'\n iteracija %d  tikslumas %g',iii,tikslumas);
    if tikslumas < eps
        x
        fprintf(1,'\n sprendinys x ='); fprintf(1,'  %g',x);
        fprintf(1,'\n funkcijos reiksme f ='); fprintf(1,'  %g',f(x));
       xx=[-5;2;-9;3];   
        fun = @f;
        xsolve=fsolve(fun,xx);
        xsolve
        
     
        break
    elseif iii == itmax
        fprintf(1,'\n ****tikslumas nepasiektas. Paskutinis artinys x ='); fprintf(1,'  %g',x);
        fprintf(1,'\n funkcijos reiksme f ='); fprintf(1,'  %g',f(x));
        break
    end
fi=fi1;
end

    return
end

%   Lygciu sistemos funkcija 
function F=f(X) 
 F(1)=4*X(2)+3*X(3)+3*X(4)-26;
 F(2)=3*X(2)+4*X(2)*X(3)-75;
 F(3)=X(3)^3-2*X(4)^2-25;
 F(4)=5*X(1)-12*X(2)+40;
 F=F(:);
 return
end 



