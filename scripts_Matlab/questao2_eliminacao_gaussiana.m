clear all;
close all;
clc;
format rat;

A = [3,2,4;
     1,1,2;
     4,3,-2];
     
B = [1,2,3];

% Captura o tamanho da matrix
n = length(A); 

%Laço para executar a quantidade de vezes necessarias para transformar
% o sistema em um sistema triangular superior
for vezes = 1: n-1
  %Laço para pecorrer todas as linhas do sistema
  for l = vezes+1: n
        
       m(l) = A(l,vezes)/A(vezes, vezes);%Calculo do multiplicando
       
    %Laço para pecorrer todas as linhas do sistema
    for c = vezes: n
      %Calculo e substituçao do elemento no sistema    
     A(l,c) = A(l,c) -m(l) * A(vezes, c);
     
    end
    % Calculo e substituiçao dos valores de B
    B(l) = B(l) - m(l) * B(vezes);    
  end
end


X(n) = B(n)/A(n,n);% Clacula o valor do X3


soma = 0; %Variavel para armazenar a soma de valores de cada espresao 

%Laço para pecorrer todas as linhas do sistema
for i = n-1:-1 : 1
    %Laço para pecorrer todas as colunas do sistema
    for j = i+1:n
      % Multiplicando os valores de cada linha e somando com os outros na 
%      variavel soma
       soma = soma + A(i,j) * X(j);
    end;
    X(i) = (B(i)-soma)/A(i,i);%Calculo do X(i) 
end;
X()