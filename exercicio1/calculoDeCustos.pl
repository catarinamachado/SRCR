%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calcular o custo total dos cuidados de saúde por utente/serviço/instituição/data

totalUtente(IdUtente, Total) :-
    solucoes(Custo, consulta(_,IdUtente,_,Custo), Lista),
    soma(Lista, Total).


totalServico(IdServ, Total) :-
    solucoes(Custo, consulta(_,_,IdServ,Custo), Lista),
    soma(Lista, Total).


somaServicos([], 0).
somaServicos([X|XS], Total) :-
    somaServicos(XS, Acumulada),
    totalServico(X, TotalServico),
    Total is TotalServico + Acumulada.

totalInstituicao(NomeInstituicao, Total) :-
    solucoes(IdServico, servico(IdServico,_,NomeInstituicao,_), Lista),
    somaServicos(Lista, Total).


totalData(Data, Total) :-
    solucoes(Custo, consulta(Data,_,_,Custo), Lista),
    soma(Lista, Total).
