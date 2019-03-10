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

