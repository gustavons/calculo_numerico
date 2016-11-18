clear all;
close all;
clc;

A = [3,2,4;
     0,1/3,2/3;
     0,0,-8];
B = [1,5/3,0];

n = length(A);

X(n) = B(n)/A(n,n);

soma = 0;

for i = n-1: -1 : 1
    for j = i+1:n
       soma = soma + A(i,j) * X(j);
    end;
    X(i) = (B(i)-soma)/A(i,i);
end;
X()