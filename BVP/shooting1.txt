function [x u] = shooting1 ( RHS, a, b, n, alpha, beta, s )

%% shooting method for the BVP


%% preparation ...

u = zeros ( 2, n+1 );
x = linspace ( a, b, n+1 );
h = ( b - a ) / n;
s0 = s(1);
s1 = s(2);

u(:,1) = [alpha; s0];
u = RK4( RHS, x, h, u, n );
f0 = beta - u(1,n+1);

u(:,1) = [alpha; s1];
u = RK4( RHS, x, h, u, n );
f1 = beta - u(1,n+1);


%%   apply the Secant method 

fi=1; it=0;
while abs(fi)>1e-6 
    si = s1 - f1 * ( s1 - s0 ) / ( f1 - f0 );

    u(:,1) = [alpha; si];
    
	u = RK4 ( RHS, x, h, u, n );
    fi = beta -  u(1,n+1);

    s0 = s1;   s1 = si;
    f0 = f1;   f1 = fi;

end





function u = RK4( RHS, x, h, u, n ) 

for i = 1 : n
    k1(1) = h * u(2,i);
	k1(2) = h * feval ( RHS, x(i), u(1,i), u(2,i) );
	
	k2(1) = h * ( u(2,i) + 0.5 * k1(2) );
	k2(2) = h * feval ( RHS, x(i) + h/2, u(1,i) + 0.5 * k1(1), u(2,i) + 0.5 * k1(2) );
	
	k3(1) = h * ( u(2,i) + 0.5 * k2(2) );
	k3(2) = h * feval ( RHS, x(i) + h/2, u(1,i) + 0.5 * k2(1), u(2,i) + 0.5 * k2(2) );
		
	k4(1) = h * ( u(2,i) + k3(2) );
	k4(2) = h * feval ( RHS, x(i) + h, u(1,i) + k3(1), u(2,i) + k3(2) );
	
	u(1,i+1) = u(1,i) + ( k1(1) + 2*k2(1) + 2*k3(1) + k4(1) ) / 6;
	u(2,i+1) = u(2,i) + ( k1(2) + 2*k2(2) + 2*k3(2) + k4(2) ) / 6;
end;