%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar as instituições prestadoras de serviços

identificaInstituicoes(R) :- solucoes(I, servico(_,_,I,_), Tmp),
                             eliminaRepetidos(Tmp, R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar utentes/serviços/consultas por critérios de seleção;

%--------- Utentes
utenteID(Id, R) :- solucoes(utente(Id,N,I,G,F,C), utente(Id,N,I,G,F,C), R).

utenteNome(N, R) :- solucoes(utente(Id,N,I,G,F,C), utente(Id,N,I,G,F,C), R).

utenteIdade(I, R) :- solucoes(utente(Id,N,I,G,F,C), utente(Id,N,I,G,F,C), R).

utenteCidade(C, R) :- solucoes(utente(Id,N,I,G,F,C), utente(Id,N,I,G,F,C), R).

utenteGenero(G, R) :- solucoes(utente(Id,N,I,G,F,C), utente(Id,N,I,G,F,C), R).

utenteFamilia(F, R) :- solucoes(utente(Id,N,I,G,F,C), utente(Id,N,I,G,F,C), R).


%--------- Serviços
servicoID(Id,R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoDescricao(D, R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoInstituicao(I, R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoCidade(C, R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

%--------- Consultas
consultaData(D,R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaIdUtente(IdU, R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaIdServico(IdS, R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaCusto(C, R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar os utentes de um serviço/instituição

utentesServico(IdS,R) :-
    findall(IdU, consulta(D,IdU,IdS,C), I1),
    eliminaRepetidos(I1,I2),
    idUtenteParaUtente(I2,R).

idUtenteParaUtente([],[]).
idUtenteParaUtente([X|XS], [U|I]) :- idUtenteParaUtente(XS, I), utenteID(X,[U]).


utentesInstituicao(Inst,R) :-
    servicoInstituicao(Inst, I),
    servicosParaUtentesServicos(I, R).

servicosParaUtentesServicos([],[]).
servicosParaUtentesServicos([servico(Id,D,Ins,C)|XS], R) :-
    servicosParaUtentesServicos(XS, I1),
    utentesServico(Id,I2),
    concat(I1, I2, I3),
    eliminaRepetidos(I3, R).
