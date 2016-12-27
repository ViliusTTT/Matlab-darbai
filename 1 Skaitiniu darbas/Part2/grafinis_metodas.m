
%Grafinis metodas lygciu sistemai

function grafinis_metodas(sk)


x=[-11:0.5:11];y=[-8:0.5:8];
Z=pavirsius(@f,x,y);
figure(sk),hold on,grid on,axis equal,axis([min(x) max(x) min(y) max(y) -10 10]);view([1 1 1]);
sk=sk+1;
xlabel('x'),ylabel('y');
mesh(x,y,Z(:,:,1)','FaceAlpha',0.2);contour(x,y,Z(:,:,1)',[0,0 ],'LineWidth',1.5);
xx=axis;
fill([xx(1),xx(1),xx(2),xx(2)],[xx(3),xx(4),xx(4),xx(3)],'c','FaceAlpha',0.2);

figure(sk),hold on,grid on,axis equal,axis([min(x) max(x) min(y) max(y) -10 10]);view([1 1 1]);
sk=sk+1;
xlabel('x'),ylabel('y')
mesh(x,y,Z(:,:,2)','FaceAlpha',0.2);contour(x,y,Z(:,:,2)',[0 0],'LineWidth',1.5)
xx=axis;
fill([xx(1),xx(1),xx(2),xx(2)],[xx(3),xx(4),xx(4),xx(3)],'b','FaceAlpha',0.2);




figure(sk),hold on,grid on,axis equal
sk=sk+1;
contour(x,y,Z(:,:,1)',[0 0],'LineWidth',1.5,'Linecolor',[0 0 1])
contour(x,y,Z(:,:,2)',[0 0],'LineWidth',1.5,'Linecolor',[0 1 0])
% contour(x,y,Z(:,:,1)')
% contour(x,y,Z(:,:,2)')
xlabel('x'),ylabel('y')
legend('x(1)^2-x(2)^2-5*x(1)*cos(x(2)+1)-10','x(1)^2+x(2)^2+x(1)*x(2)-20');

return
end

%   Lygciu sistemos funkcija 
    function fff=f(x)
    fff=[x(2)^2-x(2)^2-5*x(1)*cos(x(2)+1)-10;
         x(1)^2+x(2)^2+x(1)*x(2)-20];
    return
    end

    function Z=pavirsius(funk,x,y)
    for i=1:length(x)
        for j=1:length(y)
            Z(i,j,1:2)=funk([x(i),y(j)]);
        end
    end
        
    return
    end