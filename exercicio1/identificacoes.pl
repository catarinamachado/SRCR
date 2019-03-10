%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar as instituições prestadoras de serviços

identificaInstituicoes(R) :- findall(I, servico(_,_,I,_), Tmp),
                             eliminaRepetidos(Tmp, R).


