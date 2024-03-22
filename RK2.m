function [t,y]=RK2(int,y0,h,a)

t(1)=int(1); y(1)=y0;
n=round((int(2)-int(1))/h);
for i=1:n
    t(i+1)=t(i)+h;
    k1=ydot(t(i),y(i),a);
    k2=ydot(t(i+1),y(i)+h*k1,a);
    y(i+1)=y(i)+h/2*(k1+k2);
end