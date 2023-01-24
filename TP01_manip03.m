clear all 
close all
clc

%lire le fichier audio "bluewhale.au", et attribuer les données à la variable 'x' et la fréquence d'échantillonnage à 'fe'
[x,fe]=audioread("bluewhale.au");
%sound(x,fe);
%sélectionner une partie du signal audio entre 2.45e4 et 3.10e4 échantillons, et l'attribuer à la variable 'chant'
chant = x(2.45e4:3.10e4);
%sound(chant,fe)

%attribuer la longueur de 'chant' à la variable 'N' et etablir le pas de temps du signal
N = length(chant);
te = 1/fe;

%tracer le signal dans le domaine temporel
t = (0:N-1)*(10*te);
% plot(t,chant)

%applique le module de la transformée de Fourier rapide (FFT) sur le signal 'chant'
y = abs(fft(chant)).^2/N; 
f = (0:floor(N/2))*(fe/N)/10;

%tracer l'amplitude de la FFT du signal 'chant' en fonction des valeurs de fréquence 'f' 
plot(f,y(1:floor(N/2)+1))

%la fonction "floor" arrondit au nombre entier inférieur le plus proche