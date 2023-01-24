clear all
close all
clc


fe = 1e4;
te = 1/fe;
N = 10000;
t = (0:N-1)*te;

%génère un signal dans le domaine temporel qui est la somme de trois ondes cosinusoïdales de fréquences de 440Hz, 550Hz et 2500Hz 
 X= 1.2*cos(2*pi *440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
%  plot(t,X,'.')

%effectuer ensuite une transformée de Fourier rapide (FFT) sur le signal
 y = fft(X);
 f = (0:N-1)*fe/N;
 %plot(f,abs(y))


%déplace la FFT pour avoir la fréquence zéro au centre du graphique, puis tracer l'amplitude de la FFT
 fshift = (-N/2:(N/2)-1)*fe/N;
 plot(fshift,fftshift(2*abs(y)/N))

%génère un signal de bruit à l'aide de la fonction randn et de la taille du signal d'origine.
noise = randn(size(X));
%plot(noise)

%ajoute le bruit au signal d'origine et effectue une FFT sur le signal bruité
Xnoise = X + noise;
ynoise = fft(Xnoise);
plot(ynoise,fftshift(2*abs(y)/N))


