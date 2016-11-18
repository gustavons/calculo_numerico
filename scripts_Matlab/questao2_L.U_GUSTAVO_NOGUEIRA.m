clear all;
close all;
clc;
format rat;

U = [3,2,4;
     1,1,2;
     4,3,-2];
     
B = [1,2,3];




% Captura o tamanho da matrix
n = length(U); 

% Cria a matrix L de tamanho n com zeros
L = zeros(n);
% preenche com 1 na diagonal da esquerda para direita
for l = 1: n
  L(l,l) = 1;
end 

%Laço para executar a quantidade de vezes necessarias para transformar
% o sistema em um sistema triangular superior U e formara a matrix L
for vezes = 1: n-1
  
  
  %Laço para pecorrer todas as linhas do sistema
  for l = vezes+1: n
        
    m(l) = U(l,vezes)/U(vezes, vezes);%Calculo do multiplicando
       
    %Laço para pecorrer todas as linhas do sistema e encontrar a matrix U
    for c = vezes: n
      %Calculo e substituçao do elemento no sistema    
      U(l,c) = U(l,c) -m(l) * U(vezes, c);
     
    end
    
    % Formando a matrix L com os multiplicando
    L(l,vezes) = m(l);
  end
end




Y(3) = zeros;% Matrix de Y com zeros

Y(1) = B(1)/L(1,1)% Clacula o valor do Y1

soma = 0; %Variavel para armazenar a soma de valores de cada espresao 

%Laço para pecorrer todas as linhas restantes no sistema
for i = 2:n
    soma = 0;% Zerar a variavel soma
    
    %Laço para pecorrer todas as colunas do sistema
    for j = 1:i-1
      % Multiplicando os valores de cada linha e somando com os outros na 
%      variavel soma
       soma = soma + L(i,j) * Y(j);
    end;
    Y(i) = (B(i)-soma)/L(i,i);%Calculo do Y(i) 
end;




X(n) = Y(n)/U(n,n);% Clacula o valor do X3

soma = 0; %Variavel para armazenar a soma de valores de cada espresao 

%Laço para pecorrer todas as linhas restantes no sistema
for i = n-1:-1 : 1
    %Laço para pecorrer todas as colunas do sistema
    for j = i+1:n
      % Multiplicando os valores de cada linha e somando com os outros na 
%      variavel soma
       soma = soma + U(i,j) * X(j);
    end;
    X(i) = (Y(i)-soma)/U(i,i);%Calculo do X(i) 
end;
