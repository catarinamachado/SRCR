%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

% Sistema de Representação de Conhecimento e Raciocínio com capacidade para
% caracterizar um universo de discurso na área da prestação de cuidados de
% saúde pela realização de serviços de atos médicos

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op( 900,xfy,'::' ).
:- op( 1100,xfy,'??' ).

:- dynamic '-'/1.
:- dynamic utente/5.
:- dynamic prestador/6.
:- dynamic cuidado/5.

:- dynamic excecao/1.
:- dynamic nulointerdito/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado

:- include('state.pl').

:- include('stateControl.pl').
:- include('predicadosAuxiliares.pl').


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Pressuposto do Mundo Fechado para o predicado utente

-utente(Id,N,I,G,M) :-
    nao(utente(Id,N,I,G,M)),
    nao(excecao(utente(Id,N,I,G,M))).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Utente


% ...


%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes sobre Conhecimento Imperfeito Interdito

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um utente com nome interdito (conhecimento imperfeito interdito).
+utente(Id,N,I,G,M) :: (solucoes((Id,Nint,I,G,M), (utente(Id,Nint,I,G,M), nao(nulointerdito(Nint))), R),
                        comprimento(R,0)).

+(-utente(Id,N,I,G,M)) :: (solucoes((Id,Nint,I,G,M), (utente(Id,Nint,I,G,M), nao(nulointerdito(Nint))), R),
                           comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um utente com idade interdita (conhecimento imperfeito interdito).
+utente(Id,N,I,G,M) :: (solucoes((Id,N,Iint,G,M), (utente(Id,N,Iint,G,M), nao(nulointerdito(Iint))), R),
                        comprimento(R,0)).

+(-utente(Id,N,I,G,M)) :: (solucoes((Id,N,Iint,G,M), (utente(Id,N,Iint,G,M), nao(nulointerdito(Iint))), R),
                           comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um utente com genero interdito (conhecimento imperfeito interdito).
+utente(Id,N,I,G,M) :: (solucoes((Id,N,I,Gint,M), (utente(Id,N,I,Gint,M), nao(nulointerdito(Gint))), R),
                        comprimento(R,0)).

+(-utente(Id,N,I,G,M)) :: (solucoes((Id,N,I,Gint,M), (utente(Id,N,I,Gint,M), nao(nulointerdito(Gint))), R),
                           comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um utente com morada interdita (conhecimento imperfeito interdito).
+utente(Id,N,I,G,M) :: (solucoes((Id,N,I,G,Mint), (utente(Id,N,I,G,Mint), nao(nulointerdito(Mint))), R),
                        comprimento(R,0)).

+(-utente(Id,N,I,G,M)) :: (solucoes((Id,N,I,G,Mint), (utente(Id,N,I,G,Mint), nao(nulointerdito(Mint))), R),
                           comprimento(R,0)).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Prestador


% ...

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes sobre Conhecimento Imperfeito Interdito

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um prestador com nome interdito (conhecimento imperfeito interdito).
+prestador(Id,N,I,G,E,Inst) :: (solucoes((Id,Nint,I,G,E,Inst), (prestador(Id,Nint,I,G,E,Inst), nao(nulointerdito(Nint))), R),
                                comprimento(R,0)).

+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes((Id,Nint,I,G,E,Inst), (prestador(Id,Nint,I,G,E,Inst), nao(nulointerdito(Nint))), R),
                                   comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um prestador com idade interdita (conhecimento imperfeito interdito).
+prestador(Id,N,I,G,E,Inst) :: (solucoes((Id,N,Iint,G,E,Inst), (prestador(Id,N,Iint,G,E,Inst), nao(nulointerdito(Iint))), R),
                                comprimento(R,0)).

+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes((Id,N,Iint,G,E,Inst), (prestador(Id,N,Iint,G,E,Inst), nao(nulointerdito(Iint))), R),
                                   comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um prestador com genero interdito (conhecimento imperfeito interdito).
+prestador(Id,N,I,G,E,Inst) :: (solucoes((Id,N,I,Gint,E,Inst), (prestador(Id,N,I,Gint,E,Inst), nao(nulointerdito(Gint))), R),
                                comprimento(R,0)).

+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes((Id,N,I,Gint,E,Inst), (prestador(Id,N,I,Gint,E,Inst), nao(nulointerdito(Gint))), R),
                                   comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um prestador com especialidade interdita (conhecimento imperfeito interdito).
+prestador(Id,N,I,G,E,Inst) :: (solucoes((Id,N,I,G,Eint,Inst), (prestador(Id,N,I,G,Eint,Inst), nao(nulointerdito(Eint))), R),
                                comprimento(R,0)).

+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes((Id,N,I,G,Eint,Inst), (prestador(Id,N,I,G,Eint,Inst), nao(nulointerdito(Eint))), R),
                                   comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um prestador com instituição interdita (conhecimento imperfeito interdito).
+prestador(Id,N,I,G,E,Inst) :: (solucoes((Id,N,I,G,E,InstInt), (prestador(Id,N,I,G,E,InstInt), nao(nulointerdito(InstInt))), R),
                                comprimento(R,0)).

+(-prestador(Id,N,I,G,E,Inst)) :: (solucoes((Id,N,I,G,E,InstInt), (prestador(Id,N,I,G,E,InstInt), nao(nulointerdito(InstInt))), R),
                                   comprimento(R,0)).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Cuidado


% ...

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes sobre Conhecimento Imperfeito Interdito

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um cuidado com data interdita (conhecimento imperfeito interdito).
+cuidado(D,IdUt,IdPrest,Desc,C) ::
        (solucoes((Dint,IdUt,IdPrest,Desc,C), (cuidado(Dint,IdUt,IdPrest,Desc,C), nao(nulointerdito(Dint))), R),
         comprimento(R,0)).

+(-cuidado(D,IdUt,IdPrest,Desc,C)) ::
        (solucoes((Dint,IdUt,IdPrest,Desc,C), (cuidado(Dint,IdUt,IdPrest,Desc,C), nao(nulointerdito(Dint))), R),
         comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um cuidado com id de utente interdito (conhecimento imperfeito interdito).
+cuidado(D,IdUt,IdPrest,Desc,C) ::
        (solucoes((D,IdUtInt,IdPrest,Desc,C), (cuidado(D,IdUtInt,IdPrest,Desc,C), nao(nulointerdito(IdUtInt))), R),
         comprimento(R,0)).

+(-cuidado(D,IdUt,IdPrest,Desc,C)) ::
        (solucoes((D,IdUtInt,IdPrest,Desc,C), (cuidado(D,IdUtInt,IdPrest,Desc,C), nao(nulointerdito(IdUtInt))), R),
         comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um cuidado com id de prestador interdito (conhecimento imperfeito interdito).
+cuidado(D,IdUt,IdPrest,Desc,C) ::
        (solucoes((D,IdUt,IdPrestInt,Desc,C), (cuidado(D,IdUt,IdPrestInt,Desc,C), nao(nulointerdito(IdPrestInt))), R),
         comprimento(R,0)).

+(-cuidado(D,IdUt,IdPrest,Desc,C)) ::
        (solucoes((D,IdUt,IdPrestInt,Desc,C), (cuidado(D,IdUt,IdPrestInt,Desc,C), nao(nulointerdito(IdPrestInt))), R),
         comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um cuidado com descrição interdita (conhecimento imperfeito interdito).
+cuidado(D,IdUt,IdPrest,Desc,C) ::
        (solucoes((D,IdUt,IdPrest,DescInt,C), (cuidado(D,IdUt,IdPrest,DescInt,C), nao(nulointerdito(DescInt))), R),
         comprimento(R,0)).

+(-cuidado(D,IdUt,IdPrest,Desc,C)) ::
        (solucoes((D,IdUt,IdPrest,DescInt,C), (cuidado(D,IdUt,IdPrest,DescInt,C), nao(nulointerdito(DescInt))), R),
         comprimento(R,0)).

% Invariante que impede a inserção de conhecimento perfeito positivo e negativo relativo
% a um cuidado com custo interdito (conhecimento imperfeito interdito).
+cuidado(D,IdUt,IdPrest,Desc,C) ::
        (solucoes((D,IdUt,IdPrest,Desc,Cint), (cuidado(D,IdUt,IdPrest,Desc,Cint), nao(nulointerdito(Cint))), R),
         comprimento(R,0)).

+(-cuidado(D,IdUt,IdPrest,Desc,C)) ::
        (solucoes((D,IdUt,IdPrest,Desc,Cint), (cuidado(D,IdUt,IdPrest,Desc,Cint), nao(nulointerdito(Cint))), R),
         comprimento(R,0)).
