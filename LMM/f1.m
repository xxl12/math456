function dy=f1(t,y) 
nu=0;
dy=zeros(2,1);
dy(2)=cos(10*t)-nu*y(2)-sin(y(1));
dy(1)=y(2);

end