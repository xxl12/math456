function [tout, yout] = ab2(FunFcn, tspan, y0, dt)

%
% the second order Adam-Bashforth method
%

t0=tspan(1);
for k=1:1
  tout(k+1) = t0 +k*dt;
  k = k + 1;

  k1 = feval(FunFcn, t, y);
  
  y = y + dt*k1;
  t = tout(k);
  yout(k,:) = y.';
end

fvals0= k1;

for k=2:N-1  
  tout(k+1) = t0 +k*dt;
  k = k + 1;
  
  fvals1=feval(FunFcn,t,y); 
  
  y=y+(dt/2)*(3*fvals1-fvals0);
  t = tout(k);
  yout(k,:) = y.';
  
  fvals0 = fvals1;
end