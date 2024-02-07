function x_new=armijo(h, x_old, h_old, d, ddrv, t0)

% line search based on the basic armijo's rule

alp=1.d-4; fac=0.6;

t=t0;

x_new= x_old + t*d;
h_new= feval(h,x_new);


goal=h_old+alp*t*ddrv;
while h_new > goal
        
    t= t*fac;
    
    x_new=x_old+t*d;
    h_new=feval(h,x_new); 

    goal=h_old+alp*t*ddrv;
end
