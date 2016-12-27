function [minimalus, maximalus] = Daugianario_saknu_reziu_iverciai(ff,saknys)
clc, close all
syms f x

% daugianario sudarymas: ------
option=1;  % 1 - daugianaris, sugeneruojamas pagal duotas realias saknis;
           % 2 - argumento x funkcija, uþraðoma simboline iðraiðka
           
switch option           
    case 1   % daugianaris
        f=1;
        for i=1:numel(saknys), f=f*(x-saknys(i)); end 
        f=expand(f);  % panariui iðskleistas daugianaris
        
    case 2  % simboline iðraiðka, argumentas x

        f=ff;   % grubus ávertis geresnis uz tikslesná (kadangi B/a0 <1)

end

f=expand(f);   % daugianario skleistinë
fneig=expand(subs(f,x,-x));   % daugianario skleistinë pakeitus x-> -x

[CF1,orders]=coeffs(f,x); % daugianario f koeficientai ir juos atitinkantys x laipsniai

auksciausias_x_laipsnis=char(orders(1));      
nnn=strfind(auksciausias_x_laipsnis,'^');
n=str2num(auksciausias_x_laipsnis(nnn+1:end));  % aukðèiausias x laipsnio rodiklis daugianaryje (daugianario eile)

[CF1_neig,orders_neig]=coeffs(fneig,x); % daugianario fneig koeficientai ir juos atitinkantys x laipsniai

% suformuojama visu x laipsniø eilë: 
for i=1:n+1, orders_full(i)=x^(n-i+1); end
orders;

% koeficientu eilë papildoma nuliniais nariais:
for i=1:n+1
    j=find(orders == orders_full(i));
    if j>0, CF(i)=CF1(j); 
            CF_neig(i)=CF1_neig(j);
    else,   CF(i)=0;
            CF_neig(i)=0; 
    end
end

% koeficientas prie aukðèiausio x laipsnio turi bûti teigiamas:
CF=CF/CF(1);  % f(x) koeficientai 
CF_neig=CF_neig/CF_neig(1);  % f(-x) koeficientai
CF;
CF_neig;

% Ðaknø intervalo áverèiai:

% ------------- Grubus ivertis:
CF_value=eval(CF);  % f(x) koeficientø simboliai paverèiami skaièiais
R=max(abs(CF_value(2:end)))/CF_value(1)+1;  % taikoma grubaus áverèio formulë 

% grafinis funkcijos, ðaknø ir grubaus áverèio intervalo pavaizdavimas:
t=-R:R/500:R;
figure(1);grid on;hold on
plot(t,fnk(CF_value,t),'g-');
if option == 1, plot(saknys,0*saknys,'go');end
plot([-R,R],[0 0],'r*')

% ------------ Tikslesnis ivertis:
% teigiamoms ðaknims:

neig_ind=find(CF_value(2:end) < 0);
if ~isempty(neig_ind);
    B=max(abs(CF_value(neig_ind+1)));
    k=neig_ind(1);
    Rteig=1+(B/CF_value(1))^(1/k);
else
    Rteig=0;
end
plot(min(R,Rteig),0,'bp'); % pavaizduojamas teigiamø ðaknø virðutinës ribos ávertis 
% neigiamoms ðaknims: 
CF_value_neig=eval(CF_neig);  % f(-x) koeficientu simboliai paverèiami skaièiais
neig_ind1=find(CF_value_neig(2:end) < 0);
if ~isempty(neig_ind1)
    B=max(abs(CF_value_neig(neig_ind1+1)));
    k=neig_ind1(1);
    Rneig=1+(B/CF_value_neig(1))^(1/k);
else
    Rneig=0
end
maximalus=min(R,Rteig);
minimalus=-min(R,Rneig);
plot(-min(R,Rneig),0,'bp')
switch option, case 1, legend('kreive f(x)','f(x)=0 saknys','grubus saknu intervalo ivertis','tikslesnis saknu intervalo ivertis');
               case 2,   legend('kreive f(x)','grubus saknu intervalo ivertis','tikslesnis saknu intervalo ivertis');
end
title([char(f),'=0'])

end

function p=fnk(CF,x)
% Apskaièiuoja daugianario reikðmes, kai argumentas yra x
% Kai x yra reikðmiø vektorius, p taip pat yra atitinkamu funkcijos reikðmiø vektorius
    p=0; n=length(CF)-1;
    for i=1:length(CF),  p=p+CF(i)*x.^(n-i+1);  end  % veiksmas < .^ > reiðkia, kad laipsniu keliami visi vektoriaus x elementai  
return
end