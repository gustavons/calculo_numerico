#!/usr/bin/env python
# -*- coding: utf-8 -*-


if __name__=="__main__":
    # intervalos iniciais
    inicial = 0 # inicial
    final = 1 # final
   
    f = lambda x: 1*(x**3)-9*x+3  #expressão definida aqui

    # quantidade de numero depois da virgula
    casas = 3

    # precisão, ponto de parada
    precisao = round(2*10**-3, casas)
    # numero maximo de interações, ponto de parada
    maxima_interacao = 15

    # função que calcula a media
    media = lambda i,f: (float(i)+f)/2

    # lista para armazenar as interações
    lista_interacao = []
    # armazenar solução
    solucao = []


    for interacao in range(1, maxima_interacao):
        #calcula o centro
        centro = media(inicial, final)

        # ordem na lista
        #localização:  |     [0]      |  [1]  | [2] | [3]  |   [4]   |   [5]  | [6]    |     [7]           |  [8]
        # organização: [num_interação, inicio,final,centro,f(inicio),f(final),f(centro),f(inicio)*f(centro),f(final)*f(centro)]
        lista_temporaria = []

        # armazenando valores na lista_temporaria
        lista_temporaria.append(interacao)
        lista_temporaria.append(inicial)
        lista_temporaria.append(final)
        lista_temporaria.append(centro)
        lista_temporaria.append(f(inicial))
        lista_temporaria.append(f(final))
        lista_temporaria.append(f(centro))
        lista_temporaria.append(f(inicial)*f(centro))
        lista_temporaria.append(f(final)*f(centro))

        # armarzenado valores na lista final de interações
        lista_interacao.append(lista_temporaria)

        # condicionais para operações
        if (lista_temporaria[7] < 0):
            final = centro
        elif(lista_temporaria[8]< 0):
            inicial = centro

        # Verificar se o ponto de parada foi atingido
        if (abs(round(lista_temporaria[6],casas)) <= precisao ):
            solucao = lista_temporaria[3]
            print 'Solução: ', lista_temporaria[3],' Interação: ', lista_temporaria[0]
            break

        # limpa a lista temporaria
        lista_temporaria = []

    # verifica se o metodo convergiu
    if (solucao == []):
        print 'Método não convergiu'
    else:

        # retorno do processamento realizado
        print 'Processamento: '
        for percorre_lista in range(0, len(lista_interacao)):

            # print 'i | ini | fin| cen| f(ini)| f(fin) | f(cen) |f(ini)*f(cen)|f(fin)f(cen)'
            iden = ['I: ' ,'A: ', 'B: ', 'X: ',  'f(A): ',
                    'f(B): ' ,'f(X): ', 'f(A)*f(X): ', 'f(B)f(X): ']
            conca = ''
            for percorre_lista_secundaria in range(0,len(lista_interacao[percorre_lista])):
                conca +=  iden[percorre_lista_secundaria]+ '  '+str(lista_interacao[percorre_lista][percorre_lista_secundaria])+' || '

            print conca
            conca = ''
            iden = ['interação: ', 'inicio: ', 'fim: ', 'centro: ', 'f(inicio): ',
                    'f(fim): ', 'f(centro): ', 'f(inicio)*f(centro): ', 'f(fim)f(centro): ']

