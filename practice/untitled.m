%clear all;

t = 0:0.01:5;
ft = 10*sin(2*pi*t).*stepfun(t,0);

num = 6;
den = [1,5,6];
sys = tf(num,den);

yt = lsim(sys,ft,t);
plot(t,yt);

