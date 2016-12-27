% Vilius Turenko IFF-4/2
% 21 uþduoties variantas 
clc; close all; clear all;

lygtis = 'daugianaris';
%lygtis = 'funkcija';

if strcmp(lygtis,'daugianaris')
% Daugianaris f(x)
f=@(x)(x.^4+0.75*x.^3-5.125*x.^2+4.5*x-1.125)*1;
ff = '(x.^4+0.75*x.^3-5.125*x.^2+4.5*x-1.125)*1';
syms x
fff = (x.^4+0.75*x.^3-5.125*x.^2+4.5*x-1.125)*1;
saknys = roots([1 3/4 -41/8 9/2 -9/8])
sak = saknys;

    % 1.1
    % Daugianario ðaknø intervalo nustatymas naudojant "grubø" ir tikslesná áverèius
    % 
    [x_min, x_max] = Daugianario_saknu_reziu_iverciai(fff,saknys);
    fprintf('F-jos ðaknø áverèiai x_min= %g ir  x_max= %g \n\n',x_min,x_max);

    x = x_min:0.01:x_max;
    format long;
    zingsnis = 0.17;
    
    % 1.2
    %Daugianaris f(x) grafiðkai pavaizduojamas nustatytame ðaknø intervale
    figure(2)
    plot(x, f(x), 'r--', 'LineWidth', 3);
    grid on; hold on;
    plot(saknys, 0*saknys,'ko',...
        'MarkerFaceColor', 'g','MarkerSize',10);
        plot(x_min,0,'bp');
        plot(x_max,0,'bp');
    axis([-8,8,-50,50]);
    title('Daugianaris x.^4+3/4*x.^3-41/8*x.^2+9/2*x-9/8',...
        'FontSize',14)
    legend('Daugianaris','Ðaknys', 'Tikslesnis ðaknø intervalo ávertis')

    %1.3
    % Naudodami skenavimo algoritmà su nekintanèiu skenavimo 
    % þingsniu atskirkite ðaknø intervalus. Daugianaro skenavimas

    display('Skenavimo rezultatai su nekintanciu skenavimo zingsniu:')
    skenavimoIntervalai = skenavimas(f, zingsnis, x);

  
    %1.4
  % metodas = 'skenavimo';
   %  metodas = 'stygu';
   % metodas = 'kirstiniu';
       % metodas = 'pusiaukirtu';
     metodas = 'iteraciju';
    sk = 4;
    % Skenavimo metodas
    if strcmp(metodas,'skenavimo')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);
            skenavimo_metodas(ff,a,b,sk);
            sk = sk + 1;
        end
    % Stygø metodas
    elseif strcmp(metodas,'stygu')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);
            stygu_metodas(ff,a,b,sk);
            sk = sk + 1;
        end

    % Kirstiniø metodas
    elseif strcmp(metodas,'kirstiniu')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);         
            kirstiniu_metodas(a,b,sk);
            sk = sk + 1;
        end
         % pusiaukirtu metodas
    elseif strcmp(metodas,'pusiaukirtu')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);         
           pusiaukirtu_metodas(ff,a,b,sk);
            sk = sk + 1;
        end
              % papr iteraciju metodas
    elseif strcmp(metodas,'iteraciju')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);         
           paprastuju_iteraciju(a,b,sk);
            sk = sk + 1;
        end
     else fprintf('Klaidingai nurodytas metodas \n');
    end

   % ðaknu radinmas su fzero() ir roots
     fzer=[];
     for i=1:size(skenavimoIntervalai)
         fz = fzero(f,skenavimoIntervalai(i,1)+0.1);
         fzer=[fzer; fz;];
     end
    fzer
    saknys
    

elseif strcmp(lygtis,'funkcija')
    % Funkcijos g(x) grafinis pavaizdavimas pagal nurodytà intervalà
    figure(1)
    x = 1:0.01:5;
    g=@(x)sin((exp(x)./5))-x/5;
    gg = 'sin((exp(x)./5))-x/5';
    ggg = sin((exp(x)./5))-x/5;
    plot(x,ggg,'k--','LineWidth',3); grid;
    s(1)=fzero('sin((exp(x)./5))-x/5',2)
    s(2)=fzero('sin((exp(x)./5))-x/5',3.2)
    s(3)=fzero('sin((exp(x)./5))-x/5',3.7)
    s(4)=fzero('sin((exp(x)./5))-x/5',4.1)
    s(5)=fzero('sin((exp(x)./5))-x/5',4.38)
    s(6)=fzero('sin((exp(x)./5))-x/5',4.5)
    s(7)=fzero('sin((exp(x)./5))-x/5',4.68)
    s(8)=fzero('sin((exp(x)./5))-x/5',4.89)
     s(9)=fzero('sin((exp(x)./5))-x/5',4.64438)
    saknys = s;
    hold; grid on;
    plot(s,0*s,'rs','MarkerSize',16,...
        'MarkerFaceColor','g');
    axis([1,5,-2,2]);
    title('Funkcija sin((exp(x)./5))+x/5',...
        'FontSize',14)
    legend('Funkcija', 'Ðaknys')
   
    format long;
    zingsnis = 0.02;
    
    % 1.3 ðaknø atskirimas skenavimo metodu
    skenavimoIntervalai = skenavimas2(g, zingsnis, x);
    
    %1.4
    metodas = 'skenavimo';
  % metodas = 'stygu';
    %metodas = 'kirstiniu';
    sk = 3;
    
    % Skenavimo metodas
    if strcmp(metodas,'skenavimo')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);
            skenavimo_metodas2(gg,a,b,sk);
            sk = sk + 1;
        end
    % Stygø metodas
    elseif strcmp(metodas,'stygu')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);
            stygu_metodas(gg,a,b,sk);
            sk = sk + 1;
        end
        % Kirstiniø metodas
    elseif strcmp(metodas,'kirstiniu')
        for i=1:size(skenavimoIntervalai)
            a=skenavimoIntervalai(i,1);
            b=skenavimoIntervalai(i,2);
          kirstiniu_metodas2(a,b,sk);
            sk = sk + 1;
        end
     else fprintf('Klaidingai nurodytas metodas \n');
    end
    % ðaknu radinmas naudojant fzero() ir roots;
     fzer_sak=[];
     for i=1:size(skenavimoIntervalai)
         sak = fzero(g,skenavimoIntervalai(i,1));
         fzer_sak=[fzer_sak; sak;];
     end
    fzer_sak
end