%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar as instituições prestadoras de serviços

identificaInstituicoes(R) :- solucoes(I, servico(_,_,I,_), Tmp),
                             eliminaRepetidos(Tmp, R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar utentes/serviços/consultas por critérios de seleção;

% Utentes
utenteID(Id, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteNome(N, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteIdade(I, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

utenteCidade(C, R) :- solucoes(utente(Id,N,I,C), utente(Id,N,I,C), R).

% Serviços
servicoID(Id,R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoDescricao(D, R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoInstituicao(I, R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

servicoCidade(C, R) :- solucoes(servico(Id,D,I,C), servico(Id,D,I,C), R).

% Consultas
consultaData(D,R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaIdUtente(IdU, R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaIdServico(IdS, R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).

consultaCusto(C, R) :- solucoes(consulta(D,IdU,IdS,C), consulta(D,IdU,IdS,C), R).
