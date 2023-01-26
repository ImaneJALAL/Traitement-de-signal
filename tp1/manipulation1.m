clear all
close all
clc


fe = 1e4;
te = 1/fe;
N = 10000;

t = (0:N-1)*te;

 X= 1.2*cos(2*pi *440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
%  plot(t,X,'.')

 y = fft(X);

  f = (0:N-1)*fe/N;

%  plot(f,abs(y))





 fshift = (-N/2:(N/2)-1)*fe/N;
%   plot(fshift,fftshift(2*abs(y)/N))

 noise = randn(size(X));
%  plot(noise)

  Xnoise = X + noise;
  ynoise = fft(Xnoise);
 plot(fshift,fftshift(2*abs(ynoise)/N))


