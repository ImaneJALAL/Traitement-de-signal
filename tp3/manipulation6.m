clear all
close all
clc



te =5e-5;
fe = 1/te;

t = 0:te:5-te;
N = length(t);


x = sin(2*pi*500*t)+ sin(2*pi*400*t)+ sin(2*pi*50*t);

% % plot(t,x)
 
f = (0:N-1)*(fe/N);
fshift = (-N/2:N/2-1)*(fe/N);


specx = fft(x);
% plot(fshift,fftshift(2*abs(specx)/N))
W = 2*pi*f;
Wc = 2*pi*50;
Wc2 = 2*pi*1000;
Wc3 = 2*pi*10000;
k = 1 ;




 H = (k*j*W/Wc)./(1+j*W/Wc);
 H2 = (k*j*W/Wc2)./(1+j*W/Wc2);
 H3 = (k*j*W/Wc3)./(1+j*W/Wc3);

subplot(2,1,1)
 
semilogx(f,20*log(abs(H)),f,20*log(abs(H2)),f,20*log(abs(H3)))
grid on

 subplot(2,1,2)
 semilogx(f,angle(H),f,angle(H2),f,angle(H3))
 
 grid on

 [x,fe]=audioread("test.wav");
 chant = x;
  N2 = length(chant);
  t1 = (0:N2-1)*(10*te);
%  sound(chant,fe)
 plot(t1,chant)


