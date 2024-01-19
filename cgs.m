function [Q R]= cgs(A)

%
% classical Gram-Schmidt algorithm
%

[m n]=size(A);
Q=A*0;
R=zeros(n,n);

for j=1:n
    y=A(:,j);
    for i=1:j-1
        R(i,j)=dot(Q(:,i),A(:,j));
        y=y - R(i,j)*Q(:,i);
    end
    R(j,j)=norm(y);
    Q(:,j)=y/R(j,j);
end


end