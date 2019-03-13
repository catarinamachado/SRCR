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
:- dynamic utente/6.
:- dynamic servico/4.
:- dynamic consulta/4.
:- dynamic medico/5.
:- dynamic enfermeiro/5.

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
+utente(Id,N,I,G,F,C) :: (solucoes(Id, utente(Id,_,_,_,_,_), R),
                         comprimento(R, 1)).

% Garantir que utentes com ids diferentes têm diferente informação
+utente(Id,N,I,G,F,C) :: (solucoes((N,I,G,F,C), utente(_,N,I,G,F,C), R),
                         comprimento(R, 1)).

% Garantir que a idade do utente é válida (>= 0)
+utente(_,_,I,_,_,_) :: idadeValida(I).

% Garantir que o género do utente é 'M' ou 'F'
+utente(_,_,_,G,_,_) :: generoValido(G).

% Garantir que não é possível remover um utente com consultas
-utente(Id,_,_,_,_,_) :: (solucoes(Id, consulta(_,Id,_,_), R),
                         comprimento(R, 0)).


%--------- Serviços
% Garantir que o id de cada serviço é único
+servico(Id,D,I,C) :: (solucoes(Id, servico(Id,D,I,C), R),
                      comprimento(R, 1)).

% Garantir que serviços com ids diferentes têm diferente informação
+servico(Id,D,I,C) :: (solucoes((D,I,C), servico(_,D,I,C), R),
                      comprimento(R, 1)).

% Garantir que não é possível remover um serviço associado a consultas
-servico(Id,_,_,_) :: (solucoes(Id, consulta(_,_,Id,_), R),
                       comprimento(R, 0)).

% Garantir que não é possível remover um serviço associado a um médico
-servico(Id,_,_,_) :: (solucoes(Id, medico(_,_,_,_,IdS), R),
                       comprimento(R, 0)).

% Garantir que não é possível remover um serviço associado a um enfermeiro
-servico(Id,_,_,_) :: (solucoes(Id, enfermeiro(_,_,_,_,IdS), R),
                       comprimento(R, 0)).


%--------- Consultas
% Garantir que o id do utente associado à consulta existe
+consulta(_,IdU,_,_) :: (solucoes(IdU, utente(IdU,_,_,_,_,_), R),
                           comprimento(R, 1)).

% Garantir que o id do serviço associado à consulta existe
+consulta(_,_,IdS,_) :: (solucoes(IdS, servico(IdS,_,_,_), R),
                           comprimento(R, 1)).

% Garantir que o custo de cada consulta é válido (>= 0)
+consulta(_,_,_,C) :: custoValido(C).


%--------- Médicos
% Garantir que o id de cada médico é único
+medico(Id,N,I,G,IdS) :: (solucoes(Id, medico(Id,_,_,_,_), R),
                         comprimento(R, 1)).

% Garantir que médicos com ids diferentes têm diferente informação
+medico(Id,N,I,G,IdS) :: (solucoes((N,I,G,IdS), medico(_,N,I,G,IdS), R),
                         comprimento(R, 1)).

% Garantir que a idade do médico é válida (>= 0)
+medico(_,_,I,_,_) :: idadeValida(I).

% Garantir que o género do médico é 'M' ou 'F'
+medico(_,_,_,G,_) :: generoValido(G).


%--------- Enfermeiros
% Garantir que o id de cada enfermeiro é único
+enfermeiro(Id,N,I,G,IdS) :: (solucoes(Id, enfermeiro(Id,_,_,_,_), R),
                             comprimento(R, 1)).

% Garantir que enfermeiro com ids diferentes têm diferente informação
+enfermeiro(Id,N,I,G,IdS) :: (solucoes((N,I,G,IdS), enfermeiro(_,N,I,G,IdS), R),
                             comprimento(R, 1)).

% Garantir que a idade do enfermeiro é válida (>= 0)
+enfermeiro(_,_,I,_,_) :: idadeValida(I).

% Garantir que o género do enfermeiro é 'M' ou 'F'
+enfermeiro(_,_,_,G,_) :: generoValido(G).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Registar utentes, serviços, consultas, médicos e enfermeiros

idadeValida(I) :- I >= 0.
custoValido(C) :- C >= 0.
generoValido('M').
generoValido('F').

novoUtente(Id,N,I,G,F,C) :- evolucao(utente(Id,N,I,G,F,C)).

novoServico(Id,D,I,C) :- evolucao(servico(Id,D,I,C)).

novaConsulta(D,IdU,IdS,C) :- evolucao(consulta(D,IdU,IdS,C)).

novoMedico(Id,N,I,G,IdS) :- evolucao(medico(Id,N,I,G,IdS)).

novoEnfermeiro(Id,N,I,G,IdS) :- evolucao(enfermeiro(Id,N,I,G,IdS)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Remover utentes, serviços, consultas e médicos

removeUtente(Id) :- utenteID(Id,[X|_]), involucao(X).

removeServico(Id) :- servicoID(Id,[X|_]), involucao(X).

removeConsulta(D,IdU,IdS,C) :- involucao(consulta(D,IdU,IdS,C)).

removeMedico(Id) :- medicoID(Id,[X|_]), involucao(X).
