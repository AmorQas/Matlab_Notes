delta = 0.01;
t = -2:delta:3;

f1 = (stepfun(t,1) - stepfun(t,3)).*(t-1);
f2 = stepfun(t,-1) - 2*stepfun(t,2);

y = conv(f1,f2)*delta;

n = length(y);
t_y = (0:n-1)*delta-4;

subplot(3,1,1)
plot(t,f1);
axis([-3,5,0,5]);
title('f1')
grid on;

subplot(3,1,2)
plot(t,f2);
axis([-2,5,-3,5]);
title('f2')
grid on;

subplot(3,1,3)
plot(t_y,y);
axis([-3,10,-3,5]);
title('f1*f2')
grid on;
