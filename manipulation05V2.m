clear all 
close all 
clc 
% charge un signal ECG (électrocardiogramme) à partir du fichier "ecg.mat"
load("ecg.mat");

%définir la fréquence d'échantillonnage 'fe' et le pas de temps 'te'
fe = 500 ;
te = 1/fe;
N = length(ecg);
t = (0:N-1)*te;
f = (0:N-1)*(fe/N);


% applique un filtre passe-haut sur le signal pour supprimer le bruit causé par les mouvements du corps
%le signal dans le domaine temporelle zoomm sur une periode de 1 .
%  plot(t,ecg)
%  xlim([0.5 1.5])

%applique la transformée de Fourier rapide (FFT) sur le signal et l'attribue à la variable 'transF'
transF = fft(ecg) ;
% plot(f,transF)


%conception du filtre
pass_haut = ones(size(ecg));
%fc: Freq. de coupure
fc = 0.5;
index_fc = ceil((fc*N)/fe);
pass_haut(1:index_fc) = 0;
pass_haut(N-index_fc+1:N)=0;

% appliquer ce filtre au signal dans le domaine fréquentiel en multipliant le filtre avec la FFT du signal
filtrage = pass_haut.*transF;

%convertir le signal filtré en retour au domaine temporel en utilisant la FFT inverse
ecg1 = ifft(filtrage,"symmetric");

%Resultat apres le filtre pass_haut
%  plot(t,ecg1)
%  xlim([0.5 1.5])


% /"Suppression des interférences des lignes électriques 50Hz"/
%%  filtre notch pour supprimer les interférences des lignes électriques à 50 Hz
Notch_ideal = ones(size(ecg1));
fc_bande = 50 ; 
index_fc = ceil((fc_bande*N)/fe)+1;
Notch_ideal(index_fc) = 0 ;
Notch_ideal(N-index_fc+1) = 0 ;
tranFecg1 = fft(ecg1) ;
filter = Notch_ideal.*tranFecg1 ;
ecg2 = ifft(filter,"symmetric") ;
% hold on 
subplot(211)
plot(t,ecg2) 
subplot(212)
%plot(t,ecg-ecg2)
%plot(t,ecg1)
% xlim([0.5 1.5])


% /"Amélioration du rapport signal sur bruit"/
%%  appliquer un filtre passe-bas sur le signal pour améliorer le rapport signal sur bruit
%la plage de fréquences inférieures à 37 Hz qui correspond aux informations utiles du signal 
%laisser passer ces fréquences tout en rejetant le bruit
filtre_bas = zeros(size(ecg));
fc3 = 37;
index_h3 = ceil(fc3*N/fe);
% pour appliquer la symétrie conjugué
filtre_bas(1:index_h3)=1;
filtre_bas(N-index_h3+1:N)=1;

%pplique ensuite ce filtre au signal dans le domaine fréquentiel en multipliant le filtre 'filtre_bas' avec la FFT du signal 'ecg2' 
ecg3_freq =  filtre_bas.*fft(ecg2);
ecg3 = ifft(ecg3_freq,"symmetric");


%Le signal filtré dans le domaine temporel et tracer pour observer l'effet du filtre passe-bas sur le signal
subplot(211)
plot(t,ecg)
xlim([0.5 1.5])
subplot(212)
plot(t,ecg3)
xlim([0.5 1.5])