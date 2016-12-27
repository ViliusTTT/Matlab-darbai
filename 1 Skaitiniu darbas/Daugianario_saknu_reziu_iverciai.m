function [minimalus, maximalus] = Daugianario_saknu_reziu_iverciai(ff,saknys)
clc, close all
syms f x

% daugianario sudarymas: ------
option=1;  % 1 - daugianaris, sugeneruojamas pagal duotas realias saknis;
           % 2 - argumento x funkcija, u�ra�oma simboline i�rai�ka
           
switch option           
    case 1   % daugianaris
        f=1;
        for i=1:numel(saknys), f=f*(x-saknys(i)); end 
        f=expand(f);  % panariui i�skleistas daugianaris
        
    case 2  % simboline i�rai�ka, argumentas x

        f=ff;   % grubus �vertis geresnis uz tikslesn� (kadangi B/a0 <1)

end

f=expand(f);   % daugianario skleistin�
fneig=expand(subs(f,x,-x));   % daugianario skleistin� pakeitus x-> -x

[CF1,orders]=coeffs(f,x); % daugianario f koeficientai ir juos atitinkantys x laipsniai

auksciausias_x_laipsnis=char(orders(1));      
nnn=strfind(auksciausias_x_laipsnis,'^');
n=str2num(auksciausias_x_laipsnis(nnn+1:end));  % auk��iausias x laipsnio rodiklis daugianaryje (daugianario eile)

[CF1_neig,orders_neig]=coeffs(fneig,x); % daugianario fneig koeficientai ir juos atitinkantys x laipsniai

% suformuojama visu x laipsni� eil�: 
for i=1:n+1, orders_full(i)=x^(n-i+1); end
orders;

% koeficientu eil� papildoma nuliniais nariais:
for i=1:n+1
    j=find(orders == orders_full(i));
    if j>0, CF(i)=CF1(j); 
            CF_neig(i)=CF1_neig(j);
    else,   CF(i)=0;
            CF_neig(i)=0; 
    end
end

% koeficientas prie auk��iausio x laipsnio turi b�ti teigiamas:
CF=CF/CF(1);  % f(x) koeficientai 
CF_neig=CF_neig/CF_neig(1);  % f(-x) koeficientai
CF;
CF_neig;

% �akn� intervalo �ver�iai:

% ------------- Grubus ivertis:
CF_value=eval(CF);  % f(x) koeficient� simboliai paver�iami skai�iais
R=max(abs(CF_value(2:end)))/CF_value(1)+1;  % taikoma grubaus �ver�io formul� 

% grafinis funkcijos, �akn� ir grubaus �ver�io intervalo pavaizdavimas:
t=-R:R/500:R;
figure(1);grid on;hold on
plot(t,fnk(CF_value,t),'g-');
if option == 1, plot(saknys,0*saknys,'go');end
plot([-R,R],[0 0],'r*')

% ------------ Tikslesnis ivertis:
% teigiamoms �aknims:

neig_ind=find(CF_value(2:end) < 0);
if ~isempty(neig_ind);
    B=max(abs(CF_value(neig_ind+1)));
    k=neig_ind(1);
    Rteig=1+(B/CF_value(1))^(1/k);
else
    Rteig=0;
end
plot(min(R,Rteig),0,'bp'); % pavaizduojamas teigiam� �akn� vir�utin�s ribos �vertis 
% neigiamoms �aknims: 
CF_value_neig=eval(CF_neig);  % f(-x) koeficientu simboliai paver�iami skai�iais
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
% Apskai�iuoja daugianario reik�mes, kai argumentas yra x
% Kai x yra reik�mi� vektorius, p taip pat yra atitinkamu funkcijos reik�mi� vektorius
    p=0; n=length(CF)-1;
    for i=1:length(CF),  p=p+CF(i)*x.^(n-i+1);  end  % veiksmas < .^ > rei�kia, kad laipsniu keliami visi vektoriaus x elementai  
return
end