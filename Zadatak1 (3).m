clear all; close all; clc;
a= [11 1209 1336 1447; 697 1 2 3; 770 4 5 6; 852 7 8 9; 941 31 0 41]; % # i * zamenjeni rendom ciframa
[br1,br2]=size(a); %Dimenzije matrice
indeks = input('Unesite broj indeksa: ');
moj = mod(indeks,10); %poslednja cifra
Frekv_odabiranja=8000;
for i = 1:br1
    for j = 1:br2
        if moj == a(i,j)
            fv = a(1,j);
            fn = a(i,1);
            break;
        else
            continue;
        end
    end
end %Trazenje zadatog broja u matrici i otkrivanje njegovih odgovarajucih frekvencija fv i fn
if fv>Frekv_odabiranja
    exit;
end
if fn>Frekv_odabiranja
exit;
end
Tv = 1/fv*1000;
Tn = 1/fn*1000; %Izvrseno je mnozenje sa 1000 kako bi vremenska osa bila u milisekundama
t = 0:0.25:25;
gr = 2*cos((2*pi*t)/Tv)+sin((2*pi*t)/Tn); %Signal za frekvenciju fv je za 3dB (2 puta) veci od signala za frekvenciju fn
plot(t,gr);
xlabel('Vreme [ms]');
ylabel('Amplituda');
