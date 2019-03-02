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

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informação sobre utentes, serviços e consultas

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utente:
%                    #IdUt,Nome,Idade,Cidade -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado serviço:
%                    #IdServ,Descrição,Instituição,Cidade -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado consulta:
%                    Data,#IdUt,#IdServ,Custo -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Registar utentes, serviços e consultas


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
