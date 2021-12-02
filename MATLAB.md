# Matlab使用笔记

[^BY]: Lu

------

## 一些常用函数



### sinc(x)

#### 	description

​	抽样函数

#### 	example

​	no

------



### subplot（）

#### 	description

​	subplot是将多个图画到一个平面上的工具。其中，m表示是图排成m行，n表示图排成n列，也就是整个figure中有n个图是排成一行的，一共m行，如果m=2就是表示2行图。p表示图所在的位置，p=1表示从左到右从上到下的第一个位置

#### 	example

​	no

------

### axis(  )  

#### 	description

​	将坐标轴进行缩放

#### 	example

​	1、axis( [xmin xmax ymin ymax] ) 

​			 设置当前坐标轴 x轴 和 y轴的限制范围

​	2、axis( [xmin xmax ymin ymax zmin zmax cmin cmax] )

​			 设置 x,y,z轴的限制范围和色差范围。

​	3、axis off;	 

​			去掉坐标轴

​	4. axis tight

​			将坐标范围设定为被绘制的数据范围

​	5.axis on

​			打开所有的坐标轴标签、刻度、背景

------

### sawtooth(a*t,x)

#### 	description

​	生成周期为2pi/a , 峰值出现在x（0~1，0.5为中央）的周期三角波

#### 	example

​	f = sawtooth(4 * pi * t,0.5); 	周期为1/2,峰值出现在中央

​	f = sawtooth(4  * t,0); 	周期为1/2pi,峰值出现在最左侧

------

### help

#### 	description

​	在命令行查找函数用法

#### 	example

​	help display

------

### sym

#### 	description

​	定义变量名x,y等

#### 	example

​	x = sym('x');

------

### solve

#### 	description

​	解方程组

#### 	example

	a = sym('a');
	b = sym('b');
	x = sym('x');
	y = sym('y');
	
	[x,y] = solve(a*x-b*y-1,a*x+b*y-5,x,y);
------

### ezplot/fplot

#### 	description

​	用符号法画函数图像

#### 	example

```
x = sym('x');
y = x;
fplot(y,[-10,10]);	%这里y不必再定义变量
```

------

### abs()

#### 	description

​	取模或者取绝对值

#### 	example

```
ft = abs(2*exp(1i*(t+pi/6)));
```

------

### real()

#### 	description

​	取实部

#### 	example

```
ft = real(2*exp(1i*(t+pi/6)));
```

------

### imag()

#### 	description

​	取虚部

#### 	example

```
ft = imag(2*exp(1i*(t+pi/6)));
```

------

### angle()

#### 	description

​	求相位

#### 	example

```
ft = angle(2*exp(1i*(t+pi/6)));
```

------

### subs()

#### 	description

​	替换变量	subs(S,old,new)，在S表达式中用新变量替换旧变量，旧在前

#### 	example

```
y_tao = subs(f,t,tao)*subs(h,t,t-tao);
```

------

### int()

#### 	description

​	求定积分	int(y,x,a,b)求y关于x的定积分，x取a～b

#### 	example

```
y = int(y_tao,tao,0,t);
```

------



------



## 绘制函数图像

------



### 1 显式函数，即可以表示成Z=f(x,y);

例程：

**[x,y] = meshgrid(-2:0.1:2);**       

//产生X Y方向向量，meshgird(begin:分度值:end)
 **z = y.\*exp(-x.^2-y.^2);**

//输入Z=f(x,y);注意在运算符前要有“.”

mesh(x,y,z),xlabel('x'),ylabel('y'),zlabel('z')**

//绘制图像，第二句时为各坐标轴添加名称

![img](file:///C:/Users/Amor/AppData/Local/Temp/msohtmlclip1/01/clip_image002.jpg)

上图是mesh函数绘制的图像

也可使用surf函数绘制，语句为

**surf(x,y,z),xlabel('x'),ylabel('y'),zlabel('z')**

surf绘制的图像颜色与高度有关

![img](file:///C:/Users/Amor/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg)

将surf换为surfc会在XOY面产生投影

![img](file:///C:/Users/Amor/AppData/Local/Temp/msohtmlclip1/01/clip_image006.jpg)

后期修改润色

surfl(x,y,z),xlabel('x'),ylabel('y'),zlabel('z')
 shading interp;
 colormap(gray);

### 2限制坐标范围

限制坐标范围可使用axis([xmin xmax ymin ymax zmin zmax])

中间[]不要忘记，否则会报错

**axis([-1 1 -1 1 0 1])**

//x在-1至1，y在-1至1，z在0至1

### 3隐式 即求不出Z=f(x,y);

例程

**[x,y,z]=meshgrid(-1:0.1:1);**

//在三个范围一样时可以这么写，不一样时可以

//[x y z]=meshgrid(x1:dx:x2,y1:dy:y2,z1:dz:z2)

**f=x.^2+y.^2+z.^2-1;**

//这里要先化到方程右侧为零，即f(x,y,z)=0的形式，然后下面patch

//的第五个参数就填0即可，这里求的是x2+y2+z2=1的图像

**p = patch(isosurface(x,y,z,f,0));**

//可理解为绘图函数，最后一个参数填方程右侧的常数

//如x2+y2+z2-1=0，就填0；

//x2+y2+z2=1,就填1

**set(p,'FaceColor','r','EdgeColor','k');**

//上色函数

**daspect([1 1 1]);view(3);**

//daspect是每个轴的分度值，view(3)是三维视角展示

**axis tight;**

//返回当前坐标轴范围的值

**camlight ;**

**lighting gouraud;**

//光照照地

**grid on;**

//网格线开

**xlabel('x');ylabel('y');zlabel('z');**

//命名坐标轴

##  绘制信号图形（二维）

### 1.符号信号及阶跃信号

符号信号有专门函数 **sign(x)** 

```
t = -5:0.01:5;		//设置自变量取值范围

f_sign = sign(t);	//映射函数

subplot(1,2,1);		//subplot()函数

plot(t,f_sign);
title('符号函数');
axis([-5,5,-1.5,1.5]);//axis函数

f_u = 1/2*f_sign + 1/2;

subplot(1,2,2);

plot(t,f_u);
title('阶跃函数');
axis([-5,5,-1.5,1.5]);

```

阶跃信号也可以数值表示法来表示，所用函数为**stepfun(t,t0)**

**t表示一系列数值的向量，t0表示阶跃发生的时间**

for example

```
t = -1,0.1,1;
ut  = stepfun(t,0);
plot(t,ut);
```

阶跃信号也可以用符号表示法来表示，所用函数为 **heaviside(t)**

for example

```
t = sym('t');
ut = heaviside(t);
ezplot(ut,[-2,10]);
```



### 2.抽样信号

抽样信号函数sinc(x)

### 3.指数信号

指数信号函数exp(x)

### 4.正弦信号

正弦信号函数sin(x)

### 5.矩形脉冲信号

U(t)-U(t-ts)即可

ts为持续时间

```
t = -5:0.01:5;
f_sign = sign(t);

f_u = 1/2*f_sign + 1/2;

f_sign2 = sign(t-2);

f_u2 = 1/2*f_sign2 + 1/2;

f_wave = f_u - f_u2;

plot(t,f_wave);

axis([-3,3,-2,2]);

title('脉冲信号');
```

### 6.周期脉冲信号

有专用函数：**square（At，B）**，其中A是角频率，B是占空比；

```
t=-10:0.1:10；
y=square(pi./2*t,50)；
plot(t,y)；
axis([-10,10,-2,2])；
grid on；
```

### 7.三角波信号

用t与U(t)的组合即可

```
t = -2:0.01:2;
f_u1 = 0.5*sign(t) + 0.5;

f_u2 = 0.5*sign(-1*t)+0.5;

y = f_u2.*(t+2)+f_u1.*(-1*t+2);

plot(t,y);

axis([-3,3,0,3]);
title('三角波信号');
grid on;

```

### 8.周期三角波信号

sawtooth函数

生成周期为2pi/a , 峰值出现在x（0~1，0.5为中央）的三角波 

```
t = -2:0.01:2;
f = sawtooth(4*pi*t,0.5);
 
plot(t,f);
axis([-2,2,-2,2]);
title('周期三角波');
grid on;

```

output：

![image-20211112100615825](C:\Users\Amor\AppData\Roaming\Typora\typora-user-images\image-20211112100615825.png)

------

## 卷积积分的计算

### 1.符号法

先定义syms tao，写出两个函数表达式后用subs函数进行变量替换，最后求定积分即可；

```matlab
syms tao;
t = sym('t','positive');

f= exp(-t);
h = t^2*exp(-2*t);
y_tao = subs(f,t,tao)*subs(h,t,t-tao);
y = int(y_tao,tao,0,t);
fplot(y,[0,15]);
grid on;
```

### 2.数值法

先定义无穷小量delta = 0.01，然后表达出两式子，用conv 函数画卷积，再用n=length确定卷积的长度，然后（0:n-1）*delta+t_start确定时间轴的起始与长度,注意这里t_start是仿真运算中自己定义的信号的起始的和

```matlab
delta = 0.01;
t = 0:delta:15;
%算卷积
f_t = exp(-t);
h_t = t.*t.*exp(-2*t);
y = conv(f_t,h_t);
%确定时间轴起始位置和长度
n = length(y);
t_y = (0:n-1)*delta;

plot(t_y,y)
axis([0,15,-0.01,10])
grid on;
```

------

## 傅里叶变换

### 1.傅里叶变换数值法流程

1. 设出Δ（用delta表示）
2. 设定t的取值范围，delta间距
3. 设定w（用w代替ω）的取值范围，delta间距
4. 代入所给表达式，表示出ft
5. 代入Fw = delta* ft * exp（- j* t * w）
6. 幅度谱abs，相位谱angle



