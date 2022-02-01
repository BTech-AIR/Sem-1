%To find the area of the regions enclosed by curves and
%visualize it.
clc
clear all
format compact
syms x y real
y1=input('Enter the first(f) curve: ')
y2=input('Enter the second(g) curve: ')
fg=figure;
ax=axes;
t=solve(y1-y2)
TVALUES=double(t)
n=length(TVALUES)
m1=min(TVALUES)
m2=max(TVALUES)
ez1=ezplot(y1,[m1-1,m2+1])
hold on
TA=0;
ez2=ezplot(y2,[m1-1,m2+1])
if n>2
 for i=1:n-1
 A = int(y1-y2,t(i),t(i+1))
 TA = TA+abs(A)
 x1 = linspace(TVALUES(i),TVALUES(i+1))
 yy1= subs(y1,x,x1)
 yy2= subs(y2,x,x1)
 x1 = [x1,flipr(x1)]
 yy = [yy1,fliplr(yy2)]
 fill(x1,yy,'g')
 grid on
 end
else
 A = int(y1-y2,t(1),t(2))
 TA = abs(A)
 x1 = linspace(TVALUES(1),TVALUES(2))
 yy1= subs(y1,x,x1)
 yy2= subs(y2,x,x1)
 x1 = [x1,fliplr(x1)]
 yy = [yy1,fliplr(yy2)]
 fill(x1,yy,'g')
end
