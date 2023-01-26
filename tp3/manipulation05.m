clear all 
close all 
clc 

load("ecg.mat");

fe = 500 ;
te = 1/fe;
N = length(ecg);
t = (0:N-1)*te;
f = (0:N-1)*(fe/N);


% /"Suppression du bruit provoqué par les mouvements du corps"/


%le signal dans le domaine temporelle zomme sure une periode de 1 .
%  plot(t,ecg)
%  xlim([0.5 1.5]) 

transF = fft(ecg) ;
% plot(f,transF)

pass_haut = ones(size(ecg));
fc = 0.5;
index_fc = ceil((fc*N)/fe);
pass_haut(1:index_fc) = 0;
pass_haut(N-index_fc+1:N)=0;

% filtrage 
 
filtrage = pass_haut.*transF;
ecg1 = ifft(filtrage,"symmetric");

% apres le filtre pass_haut

%  plot(t,ecg1)
%  xlim([0.5 1.5])


% /"Suppression des interférences des lignes électriques 50Hz"/
%% notch filter 
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
%  plot(t,ecg-ecg2)
%   plot(t,ecg1)


% xlim([0.5 1.5])

% /"Amélioration du rapport signal sur bruit"/
%%  Filtrage pass-bas

filtre_bas = zeros(size(ecg));
fc3 = 37;
index_h3 = ceil(fc3*N/fe);
% pour appliquer la symétrie conjugué
filtre_bas(1:index_h3)=1;
filtre_bas(N-index_h3+1:N)=1;

ecg3_freq =  filtre_bas.*fft(ecg2);
ecg3 = ifft(ecg3_freq,"symmetric");

subplot(211)
plot(t,ecg)
xlim([0.5 1.5])
subplot(212)
plot(t,ecg3)
xlim([0.5 1.5])