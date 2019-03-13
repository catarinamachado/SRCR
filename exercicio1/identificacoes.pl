%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar as instituições prestadoras de serviços

identificaInstituicoes(R) :- findall(I, servico(_,_,I,_), Tmp),
                             eliminaRepetidos(Tmp, R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar utentes/serviços/consultas por critérios de seleção;

% Utentes
utenteID(Id, R) :- findall(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteNome(N, R) :- findall(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteIdade(I, R) :- findall(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteCidade(C, R) :- findall(utente(Id,N,I,C), utente(Id,N,I,C), R).

% Serviços
servicoID(Id,R) :- findall(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoDescricao(D, R) :- findall(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoInstituicao(I, R) :- findall(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoCidade(C, R) :- findall(servico(Id,D,I,C), servico(Id,D,I,C), R).

% Consultas
consultaData(D,R) :- findall(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaIdUtente(IdU, R) :- findall(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaIdServico(IdS, R) :- findall(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaCusto(C, R) :- findall(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).


% Identificar os utentes de um serviço/instituição;

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
