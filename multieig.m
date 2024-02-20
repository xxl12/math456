clear all

rng('default')


n= 5; m=5;

A=randn(5,5);
A=A+A';

eig(A)


X=randn(n,m);

[Q,~]= qr(X,0);

for k=1:60
    Y=A*Q;

    fprintf('Iteration %d:',k)  

    B=Q'*A*Q

    [Q,~] = qr(Y,0);
end
