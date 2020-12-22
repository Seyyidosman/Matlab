% Ýþaret Ýþleme Ve Lineer Sistemler - CRN:11200 - Ödev2
% Seyyid Osman Sevgili
% 040170045
%------------------------------------------------------------------------------
%Command Window ve Workspace temizleniyor.
clc;
clear;
%------------------------------------------------------------------------------
%AFD için kullanýlacak olan N deðerimiz.
N = 7;
%------------------------------------------------------------------------------
%Sinyallerimi tanýmladým
x = [3,-2,4,-1,5];
h = [3,2,-2,1];
%------------------------------------------------------------------------------
%Sinyallerimin boyutlarýný bir deðiþkene atadým
x_len = 5;
h_len = 4;
%------------------------------------------------------------------------------
%Algoritma baþlangýcý
%Öncelikle içerideki for loop içerisinde asýl AFD iþlemini gerçekleþtiriyorum
%Dýþarýda for loop sayesinde ise istediðim k deðerlerini bu AFD lere verip
%X_k deðerlerini elde ediyorum.

x_k = 0; %AFD lerin tutulduðu deðiþken.
X_k(7) = 0; %Genliklerin tutulduðu array.

W7 = exp(-1i*2*pi/N); %W7 deðerimiz

for  k = 1:7 %Deðer loopu
    for n = 1:x_len %AFD loopu, Burada x_leni geçen deðerler zaten 0 olur.
        x_k = x_k + x(n)*W7^((n-1)*(k-1)); %AFD iþlemi gerçekleþiyor.
    end
    X_k(k) =  x_k; %Deðerleri her loopta arrayimize atýyorum.
    x_k = 0; %Her loop sonunda deðiþkeni sýfýrlýyorum.
end

%Grafiklerin çizdirildiði kýsým
figure
subplot(2,1,1)
grid on
title("Genlik Deðerleri (X_k)")
xlabel('k') 
ylabel ('Genlik')
hold on 
stem(abs(X_k))

subplot(2,1,2)
grid on
title("Faz Deðerleri (X_k)")
xlabel('k') 
ylabel ('Faz')
hold on 
stem(angle(X_k))

%------------------------------------------------------------------------------
%Yukarýda anlatýlan algoritmanýn aynýsý kullanýlmýþtýr.
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

%Grafiklerin çizdirildiði kýsým.
figure
subplot(2,1,1)
grid on
title("Genlik Deðerleri (H_k)")
xlabel('k') 
ylabel ('Genlik')
hold on 
stem(abs(H_k))

subplot(2,1,2)
grid on
title("Faz Deðerleri (H_k)")
xlabel('k') 
ylabel ('Faz')
hold on 
stem(angle(H_k))
%------------------------------------------------------------------------------
%Burada nokta çarpým kullanarak Y_k deðerlerimiz bulduk.
Y_k = X_k.*H_k;

%Grafiklerin çizdirildiði kýsým.
figure
subplot(2,1,1)
grid on
title("Genlik Deðerleri (Y_k)")
xlabel('k') 
ylabel ('Genlik')
hold on 
stem(abs(Y_k))

subplot(2,1,2)
grid on
title("Faz Deðerleri (Y_k)")
xlabel('k') 
ylabel ('Faz')
hold on 
stem(angle(Y_k))
%------------------------------------------------------------------------------
%Burada yine ayný algoritma kullanýlmýþtýr fakat burada ters dönüþüm
%alýndýðý için W7 deðerinde i nin iþareti + olmuþtur.
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

%Bulduðumuz Y_n deðerlerini Comamnd Windowda yazdýrýyoruz.
Y_n




