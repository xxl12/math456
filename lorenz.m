function f = lorenz(t, y)
    % LORENZ defines the Lorenz system of differential equations
    % Input arguments:
    % t      - Time variable: not used in the calculation, as the system is time-independent
    % x      - Current state of the system [x; y; z]
    % sigma  - Prandtl number
    % rho    - Rayleigh number
    % beta   - Geometric factor
    
   sigma = 10;
   rho = 28;
   beta = 8/3;

    f = zeros(3,1); % Preallocate the derivative vector
    f(1) = sigma * (y(2) - y(1));
    f(2) = y(1) * (rho - y(3)) - y(2);
    f(3) = y(1) * y(2) - beta * y(3);
end