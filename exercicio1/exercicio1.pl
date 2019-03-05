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

:- dynamic utente/4, servico/4, consulta/4.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado
:- include('state.pl').

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Registar utentes, serviços e consultas

idadeValida(I) :- I >= 0.
custoValido(C) :- C >= 0.

novoUtente(Id,N,I,C) :- nao(utente(Id,_,_,_)), idadeValida(I),
                        assert(utente(Id,N,I,C)).
novoUtente(Id,N,I,C) :- fail.

novoServico(Id,D,I,C) :- nao(servico(Id,_,_,_)), assert(servico(Id,D,I,C)).
novoServico(Id,D,I,C) :- fail.

novaConsulta(D,IdU,IdS,C) :- utente(IdU,_,_,_), servico(IdS,_,_,_),
                             custoValido(C), assert(consulta(D,IdU,IdS,C)).
novaConsulta(D,IdU,IdS,C) :- fail.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Remover utentes, serviços e consultas

removeUtente(Id) :- retract(utente(Id,_,_,_)),
                    retract(consulta(_,Id,_,_)).

removeServico(Id) :- retract(servico(Id,_,_,_)),
                     retract(consulta(_,_,Id,_)).

removeConsulta(IdU,IdS) :- retract(consulta(_,IdU,IdS,_)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares

nao(Q) :- Q,!,fail.
nao(Q).

saveUtente(Stream) :- utente(A,B,C,D),
        write(Stream, 'utente('),write(Stream, A),write(Stream, ','),
        write(Stream, B), write(Stream, ','), write(Stream, C),
        write(Stream, ','), write(Stream, D), write(Stream, ').\n'),
    fail; true.

saveServico(Stream) :- servico(A,B,C,D),
        write(Stream, 'servico('),write(Stream, A),write(Stream, ','),
        write(Stream, B), write(Stream, ','), write(Stream, C),
        write(Stream, ','), write(Stream, D), write(Stream, ').\n'),
    fail; true.

saveConsulta(Stream) :- consulta(A,B,C,D),
        write(Stream, 'consulta('),write(Stream, A),write(Stream, ','),
        write(Stream, B), write(Stream, ','), write(Stream, C),
        write(Stream, ','), write(Stream, D), write(Stream, ').\n'),
    fail; true.

saveState :-
    open('state.pl', write, Stream),
    saveUtente(Stream),
    saveServico(Stream),
    saveConsulta(Stream),
    close(Stream).
