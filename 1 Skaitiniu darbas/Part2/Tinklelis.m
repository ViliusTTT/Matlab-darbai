function Tinklelis
figure(13),hold on,grid on
x=[-10:0.5:10];y=[-10:0.5:10];
Z=pavirsius(@f,x,y);
hold on,grid on,axis equal,axis([-10 10 -10 10]) 
for i=-10:0.5:10
    for j=-10:0.5:10   
       xx= Broiden_metodas_tinkleliui(i,j);
              plot(i,j,'.','markers',16,'MarkerEdgeColor','r');
                  h = zeros(9,9);
                    if(xx(3)==1)
                     if(xx(1)<-4.6 && xx(1)>-4.9 && xx(2)<4.3 && xx(2)>4.05)
                    plot(i,j,'.','markers',16,'MarkerEdgeColor','g');
                     end
                         if(xx(1)<-1.9 && xx(1)>-2.2 && xx(2)<5.3 && xx(2)>5)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor','r');
                         end
                         if(xx(1)<-4.4 && xx(1)>-4.7 && xx(2)<0.4 && xx(2)>0)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor','b');                 
                         end
                         if(xx(1)<-3 && xx(1)>-3.35 && xx(2)<-1.7 && xx(2)>-2)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor','c');
                         end
                         if(xx(1)<2.6 && xx(1)>2.3 && xx(2)<2.9 && xx(2)>2.6)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor','m');
                         end
                         if(xx(1)<3.9 && xx(1)>3.6 && xx(2)<1.3 && xx(2)>1)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor','y');
                         end
                         if(xx(1)<5.3 && xx(1)>5 && xx(2)<-2.7 && xx(2)>-3.2)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor',[0 0.6 1]);     
                         end
                        if(xx(1)<3.5 && xx(1)>3 && xx(2)<-4.8 && xx(2)>-5.2)
                     plot(i,j,'.','markers',16,'MarkerEdgeColor',[1 0.4 1]);
                        end
                      else     plot(i,j,'.','markers',16,'MarkerEdgeColor','k');
                    end
                   
              
    end
end
end
 function Z=pavirsius(funk,x,y)
        for i=1:length(x), for j=1:length(y)
              Z(i,j,1:2)=funk([x(i),y(j)]);
        end, end
    return
 end
    
     function fff=f(x)
       fff=[x(2)^2-x(2)^2-5*x(1)*cos(x(2)+1)-10;
         x(1)^2+x(2)^2+x(1)*x(2)-20];
    return
    end

