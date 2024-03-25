tspan = [0 100];

% Solve the Lorenz system
[t, X] = RK4(tspan, [1; 1; 1], 0.01, @lorenz);

% Plot the solution
figure;
plot3(X(:,1), X(:,2), X(:,3));
title('Lorenz Attractor');
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;


tspan = [0 120];

% Solve the Lorenz system
[t, X] = RK4(tspan, [2.5; 2.6 ], 0.001, @vanderpol);

% Plot the solution
figure;
plot(X(:,1), X(:,2));
title('Van Der Pol Oscillator');
xlabel('X'); ylabel('Y'); 
grid on;

