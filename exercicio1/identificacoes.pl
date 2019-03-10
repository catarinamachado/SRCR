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
