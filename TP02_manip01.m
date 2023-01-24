clear all
close all
clc

%Question 1:

[x,fe]=audioread("maphrase.m4a");

%tracage du signal et l'ecouter

%sound(x,fe)
%plot(x)

%Donald duck
%sound(x,fe*2)

%Terminator
%sound(x,fe/2)

%Normale
%sound(x,fe)




%1025 j'usqu'à 2.05e05: Rien ne sert de 
stem(x)


%Segmenter le 1er mot 


riennesertde=x(1025:(2.05e05));
%stem(riennesertde)
%sound(riennesertde,fe)

%Segmenter tout la phrase

courir_Mot=x((2.239e+05):(2.642e+05));
%sound(courir_Mot,fe)

ilfaut_Mot=x((2.987e+05):(3.81e+05));
%sound(ilfaut_Mot,fe)

partirapoint_Mot=x((4e+05):(5.28e+05));
%sound(partirapoint_Mot,fe)



%Rearranger le vecteur 
parole=[riennesertde ,partirapoint_Mot ,ilfaut_Mot,courir_Mot];
%sound(parole,fe)




