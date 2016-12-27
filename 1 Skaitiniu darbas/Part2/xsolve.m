function  xsolvex
    function fff=f(x)
       fff=[x(2)^2-x(2)^2-5*x(1)*cos(x(2)+1)-10;
         x(1)^2+x(2)^2+x(1)*x(2)-20];
    return
    end
        fun = @f;

 xx=[-4 ;4 ];
        xsolve=fsolve(fun,xx); 
 xx=[-2 ;5 ];
        xsolve2=fsolve(fun,xx);
 xx=[-4 ;0 ];
        xsolve3=fsolve(fun,xx);
 xx=[-2 ;-2 ];
        xsolve4=fsolve(fun,xx);
 xx=[4 ;-5 ];
        xsolve5=fsolve(fun,xx);
 xx=[5 ;-3 ];
        xsolve6=fsolve(fun,xx);
 xx=[4 ;1 ];
        xsolve7=fsolve(fun,xx);
 xx=[2 ;3 ];
        xsolve8=fsolve(fun,xx);
xsolve
xsolve2
xsolve3
xsolve4
xsolve5
xsolve6
xsolve7
xsolve8
end

