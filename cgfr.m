function x = cgfr(x0,fobj,tol)

%
% the conjugate gradient method by Fletcher and Reeves
% 

x=x0;
[f, g]=feval(fobj,x); p= -g;

while norm(g) > tol 
    
    % line search
    ddrv=dot(g,p);
    [x, alpha]=lnsearch(fobj, x0, p, f, ddrv, 1.0);

    s= dot(g,g);
    
    [f, g]= feval(fobj,x);
    
    s= dot(g,g)/s;
    
    p= -g + s*p;
    
    x0=x;
    
    disp(x');
    
end
