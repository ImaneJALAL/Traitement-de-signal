%  [x,fe]=audioread("test.wav");
%  chant = x;
%   N2 = length(chant);
%   t1 = (0:N2-1)*te;
%   f1 = (0:N2-1)*fe/N2;
%  
% %  sound(chant,fe)
% %  plot(t1,chant);
%  y = fft(chant);
%   plot(f1,abs(y))

[x, fe] = audioread("test.wav");
N = length(x);
f = (0:N-1)*(fe/N);
Wc = 2*pi*50;

X = fft(x);
H = (j*f/Wc)./(1+j*f/Wc);

% Duplicate the filter
H = [fliplr(H(2:end)), H];
H = H(1:N);
Y = H .* X;
y = ifft(Y);

audiowrite("test_filtered.wav", y, fe);
