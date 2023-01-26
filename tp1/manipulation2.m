clear all
close all
clc


fe = 1e4;
te = 1/fe;
N = 5000;


t = (0:N-1)*te;
x = 1.2*cos(2*pi*440*t+1.2)+ 3*cos(2*pi*550*t)+ cos(2*pi*2500*t);
x2 = 1.2*cos(2*pi*440*t+1.2)+ 3*cos(2*pi*550*t);


f = (0:N-1)*(fe/N);
fshift = (-N/2:N/2-1)*(fe/N);

specx = fft(x);
% plot(f,abs(specx))

% Conception du filtre 

pass_bas = zeros(size(x));
fc = 2000;
index_fc = ceil((fc*N)/fe);
 pass_bas(1:index_fc) = 1;
pass_bas(N-index_fc+1:N)=1;

% 
fshift = (-N/2:(N/2)-1)*fe/N;
%   hold on
%  plot(f,abs(specx))
%  plot(f,pass_bas,"linewidth",1.5)
%  hold off
% 
% 
% 
% % Filtrage
% 
 x_filter_freq = pass_bas.*specx;
 x_filter_tmp = ifft(x_filter_freq,"symmetric");
% 
% 
% plot(fshift, fftshift(abs(fft(x_filter_tmp))));
% 
% plot(t, x2-x_filter_tmp)



