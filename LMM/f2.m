function dy=f2(t,y) 
nu=25;
dy=zeros(2,1);
dy(2)=cos(10*t)-nu*y(2)-sin(y(1));
dy(1)=y(2);