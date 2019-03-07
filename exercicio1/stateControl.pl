saveUtente(Stream) :- utente(A,B,C,D),
        write(Stream, 'utente('),write(Stream, A),write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\').\n'),
    fail; true.

saveServico(Stream) :- servico(A,B,C,D),
        write(Stream, 'servico('),write(Stream, A),write(Stream, ',\''),
        write(Stream, B), write(Stream, '\',\''), write(Stream, C),
        write(Stream, '\',\''), write(Stream, D), write(Stream, '\').\n'),
    fail; true.

saveConsulta(Stream) :- consulta(A,B,C,D),
        write(Stream, 'consulta(\''),write(Stream, A),write(Stream, '\','),
        write(Stream, B), write(Stream, ','), write(Stream, C),
        write(Stream, ','), write(Stream, D), write(Stream, ').\n'),
    fail; true.

saveState :-
    open('state.pl', write, Stream),
    write(Stream, '% utente: #IdUt,Nome,Idade,Cidade -> {V,F}\n'),
    saveUtente(Stream),
    write(Stream, '\n% serviço: #IdServ,Descrição,Instituição,Cidade -> {V,F}\n'),
    saveServico(Stream),
    write(Stream, '\n% consulta: Data,#IdUt,#IdServ,Custo -> {V,F}\n'),
    saveConsulta(Stream),
    close(Stream).
