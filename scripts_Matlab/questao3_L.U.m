clear all;
close all;
clc;
format rat;

U = [2 1 7 4 -3 -1 4 4 7 0; 
     4 2 2 3 -2 0 3 3 4 1;
     3 4 4 2 1 -2 2 1 9 -3;
     9 3 5 1 0 5 6 -5 -1 4;
     2 0 7 0 -5 7 1 0 1 6; 
     1 9 8 0 3 9 9 0 0 5;
     4 1 9 0 4 3 7 -4 1 3;
     6 3 1 1 6 8 3 3 0 2;
     6 5 0 -7 7 -7 6 2 -6 1;
     1 6 3 4 8 3 -5 0 -6 0];
B = [86; 45; 52.5; 108; 66.5; 90.5; 139; 61; 43.5; 31];

% Captura o tamanho da matrix
n = length(U); 

% Cria a matrix L de tamanho n com zeros
L = zeros(n);
% preenche com 1 na diagonal da esquerda para direita
for l = 1: n
  L(l,l) = 1;
end 


%Laço para executar a quantidade de vezes necessarias para transformar
% o sistema em um sistema triangular superior
for vezes = 1: n-1
  %Laço para pecorrer todas as linhas do sistema
  if (U(vezes, vezes) == 0)
    
    %Laço para capturar os valores da linha
    for col = 1: n
      temp(col) = U(vezes, col);      
    end
    % Substituir elementos da matix U quando for dividir por zero
    U(vezes, :) = U(vezes+1, :);
    U(vezes+1, :) = temp;
    
    % Substituir elementos da matix B quando for dividir por zero
    tempB = B(vezes); % Salvar valor de B em uma variavel temporaria
    B(vezes) = B(vezes + 1); % Substituir pela variavel da linha seguinte
    B(vezes + 1) = tempB; % Substituir pela valor da variavel temporaria
  end
  
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
