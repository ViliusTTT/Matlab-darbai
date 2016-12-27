% Vilius Turenko IFF-4/2
% 21 uþduoties variantas 
clc; close all; clear all;

lygtis = '1 sistema';
%lygtis = '2 sistema';

if strcmp(lygtis,'1 sistema')

    %Skirtinguose grafikuose pavaizduokite pavirðius Z1(x1,x2) ir Z2(x1,x2)
    sk=1;
    grafinis_metodas(sk)
    %Broideno metodu iðsprendþiama sistema
    sk=4;
    
    xx=[-4 4;-2 5;-4 0;-2 -2;4 -5; 5 -3; 4 1;2 3]
    for i=1:8
    Broideno_metodas(sk,xx(i,1),xx(i,2),i)
    sk=sk+1;
    end;
     Tinklelis;    
xsolve;
elseif strcmp(lygtis,'2 sistema')
    Broiden_metodas2;
    
end
    
