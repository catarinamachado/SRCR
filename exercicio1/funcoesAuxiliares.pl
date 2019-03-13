%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares

% Insucesso
insucesso :- !, fail.

% Calcula o valor de verdade contrário à resposta à questão
nao(Q) :- Q, insucesso.
nao(Q).

% Encontra todas as soluções
solucoes(X, XS, R) :- XS, assert(tmp(X)), fail.
solucoes(X, XS, R) :- construir([], R).

construir(L, R) :- retract(tmp(X)), !, construir([X|L], R).
construir(R, R).

% Comprimento de uma lista
comprimento([], 0).
comprimento([_|XS], R) :- comprimento(XS, S), R is 1 + S.

% Inserção de conhecimento
insercao(Q) :- assert(Q).
insercao(Q) :- retract(Q), insucesso.

% Testa se todos os meta-predicados são verdadeiros
teste([]).
teste([I|L]) :- I, teste(L).

% Insere novo conhecimento na base de conhecimento
evolucao(T) :- solucoes(I, +T::I, Linv),
               insercao(T),
               teste(Linv).

% Averigua se elemento pertence a uma lista
pertence(A,[A|XS]).
pertence(A,[X|XS]) :- pertence(A,XS).

% Elimina os elementos repetidos numa lista
eliminaRepetidos(X, R) :- eliminaRepAux(X,[],R).

eliminaRepAux([],Acc,Acc).
eliminaRepAux([X|XS],Acc,R) :- pertence(X,Acc), eliminaRepAux(XS,Acc,R).
eliminaRepAux([X|XS],Acc,R) :- eliminaRepAux(XS,[X|Acc],R).

% Somatório
soma([],0).
soma([X|XS],Total) :- soma(XS, Acumulado), Total is X + Acumulado.

% Concatenar 2 listas
concat([], R, R).
concat([X|XS1], R, [X|XS2]) :- concat(XS1, R, XS2).
