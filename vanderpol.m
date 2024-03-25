function f = vanderpol(t, y)
    % vanDerPol Defines the Van der Pol oscillator system of equations
    % Input arguments:
    % t  - Time variable (not used here since the system is autonomous)
    % y  - Current state of the system [x; dx/dt]
    % mu - Nonlinearity parameter
    
    
    mu=5;

    f = zeros(2,1); % Initialize the output
    f(1) = y(2); % dx/dt
    f(2) = mu*(1 - y(1)^2)*y(2) - y(1); 
end