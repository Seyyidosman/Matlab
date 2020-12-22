% ��aret ��leme Ve Lineer Sistemler - CRN:11200 - �dev2
% Seyyid Osman Sevgili
% 040170045
%------------------------------------------------------------------------------
%Command Window ve Workspace temizleniyor.
clc;
clear;
%------------------------------------------------------------------------------
%AFD i�in kullan�lacak olan N de�erimiz.
N = 7;
%------------------------------------------------------------------------------
%Sinyallerimi tan�mlad�m
x = [3,-2,4,-1,5];
h = [3,2,-2,1];
%------------------------------------------------------------------------------
%Sinyallerimin boyutlar�n� bir de�i�kene atad�m
x_len = 5;
h_len = 4;
%------------------------------------------------------------------------------
%Algoritma ba�lang�c�
%�ncelikle i�erideki for loop i�erisinde as�l AFD i�lemini ger�ekle�tiriyorum
%D��ar�da for loop sayesinde ise istedi�im k de�erlerini bu AFD lere verip
%X_k de�erlerini elde ediyorum.

x_k = 0; %AFD lerin tutuldu�u de�i�ken.
X_k(7) = 0; %Genliklerin tutuldu�u array.

W7 = exp(-1i*2*pi/N); %W7 de�erimiz

for  k = 1:7 %De�er loopu
    for n = 1:x_len %AFD loopu, Burada x_leni ge�en de�erler zaten 0 olur.
        x_k = x_k + x(n)*W7^((n-1)*(k-1)); %AFD i�lemi ger�ekle�iyor.
    end
    X_k(k) =  x_k; %De�erleri her loopta arrayimize at�yorum.
    x_k = 0; %Her loop sonunda de�i�keni s�f�rl�yorum.
end

%Grafiklerin �izdirildi�i k�s�m
figure
subplot(2,1,1)
grid on
title("Genlik De�erleri (X_k)")
xlabel('k') 
ylabel ('Genlik')
hold on 
stem(abs(X_k))

subplot(2,1,2)
grid on
title("Faz De�erleri (X_k)")
xlabel('k') 
ylabel ('Faz')
hold on 
stem(angle(X_k))

%------------------------------------------------------------------------------
%Yukar�da anlat�lan algoritman�n ayn�s� kullan�lm��t�r.
h_k = 0;
H_k(7) = 0; 
W7 = exp(-1i*2*pi/N);
for  k = 1:7
    for n = 1:h_len
        h_k = h_k + h(n)*W7^((n-1)*(k-1));   
    end
    H_k(k) =  h_k;
    h_k = 0;
end

%Grafiklerin �izdirildi�i k�s�m.
figure
subplot(2,1,1)
grid on
title("Genlik De�erleri (H_k)")
xlabel('k') 
ylabel ('Genlik')
hold on 
stem(abs(H_k))

subplot(2,1,2)
grid on
title("Faz De�erleri (H_k)")
xlabel('k') 
ylabel ('Faz')
hold on 
stem(angle(H_k))
%------------------------------------------------------------------------------
%Burada nokta �arp�m kullanarak Y_k de�erlerimiz bulduk.
Y_k = X_k.*H_k;

%Grafiklerin �izdirildi�i k�s�m.
figure
subplot(2,1,1)
grid on
title("Genlik De�erleri (Y_k)")
xlabel('k') 
ylabel ('Genlik')
hold on 
stem(abs(Y_k))

subplot(2,1,2)
grid on
title("Faz De�erleri (Y_k)")
xlabel('k') 
ylabel ('Faz')
hold on 
stem(angle(Y_k))
%------------------------------------------------------------------------------
%Burada yine ayn� algoritma kullan�lm��t�r fakat burada ters d�n���m
%al�nd��� i�in W7 de�erinde i nin i�areti + olmu�tur.
y_n = 0;
Y_n(7) = 0; 
W7 = exp(1i*2*pi/N);
for  n = 1:7
    for k = 1:7
        y_n = y_n + Y_k(k)*W7^((n-1)*(k-1)); 
    end
    Y_n(n) =  y_n/N;
    y_n = 0;
end

%Buldu�umuz Y_n de�erlerini Comamnd Windowda yazd�r�yoruz.
Y_n




