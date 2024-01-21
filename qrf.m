function [Q,R] = qrf(A)
% Compute the QR factorization of real A using Householder reflectors
% ** implementation designed for clarity, not efficiency **

[m,n] = size(A);
Q = eye(m);

for k=1:n
    ak = A(k:end,k); % vector to be zeroed out
    
    vk = ak + sign(ak(1))*norm(ak)*[1;zeros(m-k,1)]; % construct v_k 
    
    Hk = eye(m-k+1) - 2*vk*vk'/(vk'*vk); % unitary matrix
    
    Qk = [eye(k-1) zeros(k-1,m-k+1); zeros(m-k+1,k-1) Hk];

    A = Qk*A; % update A

    vk=vk/norm(vk);
    
    vk
    
    A
    
    Qk
    
    pause
    
    Q = Q*Qk;
end

R=A;