%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar as instituições prestadoras de serviços

identificaInstituicoes(R) :- solucoes(I, servico(_,_,I,_), Tmp),
                             eliminaRepetidos(Tmp, R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar utentes/serviços/consultas por critérios de seleção

%--------- Utentes
utenteID(Id, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteNome(N, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteIdade(I, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteCidade(C, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

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

%--------- Médicos
medicoID(Id, R) :- solucoes(medico(Id,N,I,G,IdS), medico(Id,N,I,G,IdS), R).

medicoNome(N, R) :- solucoes(medico(Id,N,I,G,IdS), medico(Id,N,I,G,IdS), R).

medicoIdade(I, R) :- solucoes(medico(Id,N,I,G,IdS), medico(Id,N,I,G,IdS), R).

medicoGenero(G, R) :- solucoes(medico(Id,N,I,G,IdS), medico(Id,N,I,G,IdS), R).

medicoIdServico(IdS, R) :- solucoes(medico(Id,N,I,G,IdS), medico(Id,N,I,G,IdS), R).

%--------- Enfermeiros
enfermeiroID(Id, R) :- solucoes(enfermeiro(Id,N,I,G,IdS), enfermeiro(Id,N,I,G,IdS), R).

enfermeiroNome(N, R) :- solucoes(enfermeiro(Id,N,I,G,IdS), enfermeiro(Id,N,I,G,IdS), R).

enfermeiroIdade(I, R) :- solucoes(enfermeiro(Id,N,I,G,IdS), enfermeiro(Id,N,I,G,IdS), R).

enfermeiroGenero(G, R) :- solucoes(enfermeiro(Id,N,I,G,IdS), enfermeiro(Id,N,I,G,IdS), R).

enfermeiroIdServico(IdS, R) :- solucoes(enfermeiro(Id,N,I,G,IdS), enfermeiro(Id,N,I,G,IdS), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar os utentes de um serviço/instituição

utentesServico(IdS,R) :-
    solucoes(IdU, consulta(D,IdU,IdS,C), I1),
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

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar serviços realizados por utente/instituição/cidade;

servicosPorUtente(IdUtente, R) :-
    solucoes(IdS, consulta(D,IdUtente,IdS,C), I1),
    eliminaRepetidos(I1, I2),
    idServicoParaServico(I2, R).

idServicoParaServico([],[]).
idServicoParaServico([X|XS], [U|I]) :- idServicoParaServico(XS, I), servicoID(X,[U]).

servicosPorInstituicao(IdI, R) :-
    solucoes(servico(IdS,D,IdI,C), servico(IdS,D,IdI,C), R).

servicosPorCidade(Cidade, R) :-
    solucoes(servico(IdS,D,IdI,Cidade), servico(IdS,D,IdI,Cidade), R).
