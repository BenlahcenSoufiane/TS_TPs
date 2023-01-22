clear all
close all
clc


fe = 1e4;
te = 1/fe;
N = 5000;
t = (0:N-1)*te;

%génèrer deux signaux dans le domaine temporel, x et x2. Le signal x est la somme de trois 
%ondes cosinusoïdales de fréquences de 440Hz, 550Hz et 2500Hz respectivement
%le x2 et creer pour des raisons de comparaison
x = 1.2*cos(2*pi*440*t+1.2)+ 3*cos(2*pi*550*t)+ cos(2*pi*2500*t);
x2 = 1.2*cos(2*pi*440*t+1.2)+ 3*cos(2*pi*550*t);



%'f' pour représenter les valeurs de fréquence et une variable 'fshift' pour représenter les valeurs de fréquence décalées
f = (0:N-1)*(fe/N);
fshift = (-N/2:N/2-1)*(fe/N);
%effectuer une transformée de Fourier rapide (FFT) sur le signal x et attribue les valeurs de FFT à la variable 'specx'
specx = fft(x);


% Conception du filtre 
pass_bas = zeros(size(x));
fc = 2000;
index_fc = ceil((fc*N)/fe);
 pass_bas(1:index_fc) = 1;
pass_bas(N-index_fc+1:N)=1;

%tracage de filtre
plot(f,pass_bas,"linewidth",1.5)

%appliquer le filtre passe-bas au signal dans le domaine fréquentiel en multipliant le filtre avec la FFT du signal
 x_filter_freq = pass_bas.*specx;
 
 
 
%convertir le signal filtré en retour au domaine temporel en utilisant la FFT inverse
x_filter_tmp = ifft(x_filter_freq,"symmetric");
%  plot(fshift, fftshift(abs(fft(x_filter_tmp))));


% tracer la différence entre le signal original x2 et le signal filtré x_filter_tmp
plot(t, x2-x_filter_tmp)



