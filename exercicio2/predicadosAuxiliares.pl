%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicados Auxiliares

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado não: Q -> {V,F}
% Devolve o valor de verdade contrário a Q

nao( Q ) :- Q, !, fail.
nao( Q ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado si: Q,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }
% capaz de responder a uma única questão

si( Q,verdadeiro ) :-
    Q.
si( Q,falso ) :-
    -Q.
si( Q,desconhecido ) :-
    nao( Q ),
    nao( -Q ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicado soluções: X,XS,R -> {V,F}
% Encontra todas as soluções

solucoes( X,XS,R ) :- XS, assert(tmp(X)), fail.
solucoes( X,XS,R ) :- solucoesAux([], R).

solucoesAux( L,R ) :- retract(tmp(X)), !, solucoesAux( [X|L],R ).
solucoesAux( R,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicado comprimento: X,R -> {V,F}
% Devolve o comprimento de uma lista

comprimento( [],0 ).
comprimento( [_|XS],R ) :- comprimento( XS,S ), R is 1 + S.
