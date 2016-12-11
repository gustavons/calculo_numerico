#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Este algorítimo realiza a interpolação polinomial através da Forma de Lagrange"""

if __name__ == "__main__":
    # valores de x e f(x)
    x = [-1, 0, 2]
    fx = [4, 1, -1]
    # numero de elementos
    numero_elementos = len(x)

    # valor a ser interpolado
    valor_interpolado = 1

    # formula para calcular os fatores de lagrange
    # a variavel valor é o valor interpolado, em L0 o xn = x0, xk = x1 ou x2
    l = lambda valor, xn, xk: float((valor - xk)) / (xn - xk)

    resultado = 0

    # Laço para percorrer n
    for n in range(0, numero_elementos):
        # armazena os valores do fator de lagrange n
        valor_l = 1
        # laço para percorrer k
        for k in range(0, numero_elementos):
            # condicional para verificar se k=n
            if k != n:
                valor_l = valor_l * l(valor_interpolado, x[n], x[k])

        # calcula o valor da expressão
        resultado += fx[n] * valor_l

    # mostra o resultado da interpolaçõa
    print resultado
