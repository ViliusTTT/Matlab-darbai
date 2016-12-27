
% Broideno metodas
function Broideno_metodas(sk,ss,ss2,index)


x=[-10:0.2:10];y=[-10:0.2:10];
Z=pavirsius(@f,x,y);
fig1=figure(sk);
hold on,grid on,axis equal,axis([min(x) max(x) min(y) max(y) 0 5]);view([0 0 1]);xlabel('x'),ylabel('y');
mesh(x,y,Z(:,:,1)','FaceAlpha',0.2,'FaceColor','r','EdgeColor','r');contour(x,y,Z(:,:,1)',[0 0],'LineWidth',1.5,'LineColor','r');
mesh(x,y,Z(:,:,2)','FaceAlpha',0.2,'FaceColor','b','EdgeColor','b');contour(x,y,Z(:,:,2)',[0 0],'LineWidth',1.5,'LineColor','b');
xx=axis; fill([xx(1),xx(1),xx(2),xx(2)],[xx(3),xx(4),xx(4),xx(3)],'b','FaceAlpha',0.2);
xx=axis; fill([xx(1),xx(1),xx(2),xx(2)],[xx(3),xx(4),xx(4),xx(3)],'b','FaceAlpha',0.2);

eps=1e-5;itmax=100;
x=[ss;ss2];
n=length(x);


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

    figure(sk);plot3(x1(1),x1(2),0,'y*');line([x(1),x1(1)],[x(2),x1(2)],[0,0],'Color','white');
    line([x(1),x1(1)],[x(2),x1(2)],[ff(1),0*ff1(1)],'Color','magenta','LineWidth',2.5);
    pause(0.05);

    tikslumas=norm(deltax)/(norm(x)+norm(deltax));
    
    fprintf(1,'\n iteracija %d  tikslumas %g',iii,tikslumas);
    if tikslumas < eps,         fprintf(1,'\n sprendinys x =');fprintf(1,'  %g',x); plot3(x(1),x(2),0,'rp'); a=x(1); b=x(2); break;
    elseif iii == itmax,fprintf(1,'\n ****tikslumas nepasiektas. Paskutinis artinys x =');fprintf(1,'  %g',x); plot3(x(1),x(2),0,'gp'); break;
    end
    ff=ff1;x=x1;
    
end

figure(12),hold on,grid on,axis equal
x=[-10:0.2:10];y=[-8:0.2:8];
Z=pavirsius(@f,x,y);
contour(x,y,Z(:,:,1)',[0 0],'LineWidth',1.5,'Linecolor',[0 0 1])
contour(x,y,Z(:,:,2)',[0 0],'LineWidth',1.5,'Linecolor',[0 1 0])
colours='rgbcmykw';
plot(a,b,'rh','markers',12,'MarkerFaceColor',colours(index));
text(a+0.5,b+1.2,num2str(a),'HorizontalAlignment','center')
text(a+0.5,b+0.5,num2str(b),'HorizontalAlignment','center')
if(sk==11)
legend('Location','southeast','x(1)^2-x(2)^2-5*x(1)*cos(x(2)+1)-10','x(1)^2+x(2)^2+x(1)*x(2)-20');
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