%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

% Sistema de Representação de conhecimento e raciocínio com capacidade
% para caracterizar um universo de discurso na área da prestação de
% cuidados de saúde

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op(900,xfy,'::').
:- dynamic utente/4.
:- dynamic servico/4.
:- dynamic consulta/4.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado
:- include('state.pl').

:- include('funcoesAuxiliares.pl').
:- include('identificacoes.pl').
:- include('stateControl.pl').
:- include('calculoDeCustos.pl').

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais

%--------- Utentes
% Garantir que o id de cada utente é único
+utente(Id,N,I,C) :: (solucoes(Id, utente(Id,_,_,_), R),
                      comprimento(R, 1)).

% Garantir que utentes com ids diferentes têm diferente informação
+utente(Id,N,I,C) :: (solucoes((N,I,C), utente(_,N,I,C), R),
                      comprimento(R, 1)).

% Garantir que a idade do utente é válida (>= 0)
+utente(_,_,I,_) :: idadeValida(I).


%--------- Serviços
% Garantir que o id de cada serviço é único
+servico(Id,D,I,C) :: (solucoes(Id, servico(Id,D,I,C), R),
                      comprimento(R, 1)).

% Garantir que serviços com ids diferentes têm diferente informação
+servico(Id,D,I,C) :: (solucoes((D,I,C), servico(_,D,I,C), R),
                      comprimento(R, 1)).


%--------- Consultas
% Garantir que o id do utente associado à consulta existe
+consulta(_,IdU,_,_) :: (solucoes(IdU, utente(IdU,_,_,_), R),
                           comprimento(R, 1)).

% Garantir que o id do serviço associado à consulta existe
+consulta(_,_,IdS,_) :: (solucoes(IdS, servico(IdS,_,_,_), R),
                           comprimento(R, 1)).

% Garantir que o custo de cada consulta é válido (>= 0)
+consulta(_,_,_,C) :: custoValido(C).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Registar utentes, serviços e consultas

idadeValida(I) :- I >= 0.
custoValido(C) :- C >= 0.

novoUtente(Id,N,I,C) :- evolucao(utente(Id,N,I,C)).

novoServico(Id,D,I,C) :- evolucao(servico(Id,D,I,C)).

novaConsulta(D,IdU,IdS,C) :- evolucao(consulta(D,IdU,IdS,C)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Remover utentes, serviços e consultas

removeUtente(Id) :- retract(utente(Id,_,_,_)),
                    retract(consulta(_,Id,_,_)).

removeServico(Id) :- retract(servico(Id,_,_,_)),
                     retract(consulta(_,_,Id,_)).

removeConsulta(IdU,IdS) :- retract(consulta(_,IdU,IdS,_)).

