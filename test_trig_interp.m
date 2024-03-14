N=256; 

k = [0:N/2 -N/2+1:-1];
ik= 1i*k;

x=[0:N-1]*2*pi/N;

M=512;
X=[0:M-1]*2*pi/M;


% -------------- FUNCTION 0 ----------------

for n=1:N
    f(n)= func0(x(n));
end
beta=fft(f)/N;
for m=1:M
    F(m)= real( sum(beta.*exp(ik*X(m))) );
    fe(m)= func0(X(m));
end

figure

subplot(211);
plot(X,fe,'r',X,F,'b--','linewidth',2);
title('\bf function no. 0');

subplot(212);
plot(X,fe-F,'r');

pause

% -------------- FUNCTION 1 ----------------

for n=1:N
    f(n)= func1(x(n));
end
beta=fft(f)/N;
for m=1:M
    F(m)= real( sum(beta.*exp(ik*X(m))) );
    fe(m)= func1(X(m));
end

figure

subplot(211);
plot(X,fe,'r',X,F,'b--','linewidth',2);
title('\bf function no. 1');
subplot(212);
plot(X,fe-F,'r');

pause

% -------------- FUNCTION 2 ----------------

for n=1:N
    f(n)= func2(x(n));
end
beta=fft(f)/N;
for m=1:M
    F(m)= real( sum(beta.*exp(ik*X(m))) );
    fe(m)= func2(X(m));
end

figure

subplot(211);
plot(X,fe,'r',X,F,'b--','linewidth',2);
title('\bf function no. 2');
subplot(212);
plot(X,fe-F,'r');

pause

% -------------- FUNCTION 3 ----------------

for n=1:N
    f(n)= func3(x(n));
end
beta=fft(f)/N;
for m=1:M
    F(m)= real( sum(beta.*exp(ik*X(m))) );
    fe(m)= func3(X(m));
end

figure

subplot(211);
plot(X,fe,'r',X,F,'b--','linewidth',2);
title('\bf function no. 3');
subplot(212);
plot(X,fe-F,'r');

