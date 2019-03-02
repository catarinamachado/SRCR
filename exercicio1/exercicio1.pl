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
% Base de Conhecimento com informação sobre utentes, serviços e consultas

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utente:
%                    #IdUt,Nome,Idade,Cidade -> {V,F}

utente(1,carlos,31,porto).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado serviço:
%                    #IdServ,Descrição,Instituição,Cidade -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado consulta:
%                    Data,#IdUt,#IdServ,Custo -> {V,F}

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



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares

nao(Q) :- Q,!,fail.
nao(Q).
