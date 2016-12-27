function skenavimoIntervalai = skenavimas(f, zingsnis, xx)
xmin=xx(1); xmax=xx(end);
x=xmin;
skenavimoIntervalai=[];
figure(3);
plot(xx, f(xx), 'g', 'LineWidth', 2);
grid on; hold on;
axis([-8,8,-50,50]);
while x < xmax
 % paskutinio grafinio objekto valdiklis irasomas handle masyvo priekyje
    if (sign(f(x))~=sign(f(x+zingsnis)))
        skenavimoIntervalai=[skenavimoIntervalai; x, x+zingsnis];
        plot(x, 0, 'b>',...
            'MarkerFaceColor', 'r');
        plot(x+zingsnis, 0, 'b<',...
            'MarkerFaceColor', 'r');
        legend('kreivë f(x)','intervalo pradþia', 'intervalo pabaiga');
        title('x.^4+3/4*x.^3-41/8*x.^2+9/2*x-9/8');
    end
    x=x+zingsnis;
end    
   
skenavimoIntervalai

end
    