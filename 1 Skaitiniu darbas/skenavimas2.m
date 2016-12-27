function skenavimoIntervalai = skenavimas2(f, zingsnis, xx)
xmin = xx(1); xmax =xx(end);
x=xmin;
skenavimoIntervalai=[];
figure(2);
plot(xx, f(xx), 'g', 'LineWidth', 2);
grid on; hold on;
axis([1,5,-2,2]);
while x < xmax
    if (sign(f(x))~=sign(f(x+zingsnis)))
        skenavimoIntervalai=[skenavimoIntervalai; x, x+zingsnis];
        plot(x, 0, 'b>',...
            'MarkerFaceColor', 'r');
        plot(x+zingsnis, 0, 'b<',...
            'MarkerFaceColor', 'r');
        legend('g(x)','intervalo pradþia', 'intervalo pabaiga');
        title('sin((exp(x)./5))+-x/5');
    end
    x=x+zingsnis;
end    
   
skenavimoIntervalai


end

