clear all
close all
clc


%vecteur temps "t" avec un intervalle d'échantillonnage de 5e-5 et une durée de 5 secondes
te =5e-5;
fe = 1/te;
t = 0:te:5-te;
N = length(t);

%crée un signal "x" comme somme de trois ondes sinusoïdales avec des fréquences de 500, 400 et 50 Hz.
x = sin(2*pi*500*t)+ sin(2*pi*400*t)+ sin(2*pi*50*t);

plot(t,x)
f = (0:N-1)*(fe/N);
fshift = (-N/2:N/2-1)*(fe/N);
specx = fft(x);

%fonction de transfert H, H2 et H3 avec des fréquences de coupure différentes (Wc, Wc2 et Wc3)
% plot(fshift,fftshift(2*abs(specx)/N))
W = 2*pi*f;
Wc = 2*pi*50;
Wc2 = 2*pi*1000;
Wc3 = 2*pi*10000;
k = 1 ;
% H = (k*j*W/Wc)./(1+j*W/Wc);
% H2 = (k*j*W/Wc2)./(1+j*W/Wc2);
% H3 = (k*j*W/Wc3)./(1+j*W/Wc3);

% subplot(2,1,1)

% semilogx(f,20*log(abs(H)),f,20*log(abs(H2)),f,20*log(abs(H3)))
% grid on

% subplot(2,1,2)
% semilogx(f,angle(H),f,angle(H2),f,angle(H3))
% grid on

%on pose different pulsation s de coupure afin de choisir la convenable 

 


