saveUtente(Stream) :- utente(A,B,C,D,E),
        write(Stream, 'utente('),write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\',\''),
        write(Stream, E), write(Stream, '\').\n'),
    fail; true.

saveNUtente(Stream) :- -utente(A,B,C,D,E),
        write(Stream, '-utente('),write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\',\''),
        write(Stream, E), write(Stream, '\').\n'),
    fail; true.

savePrestador(Stream) :- prestador(A,B,C,D,E,F),
        write(Stream, 'prestador('), write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\',\''),
        write(Stream, E), write(Stream, '\',\''), write(Stream, F),
        write(Stream, '\').\n'),
    fail; true.

saveNPrestador(Stream) :- -prestador(A,B,C,D,E,F),
        write(Stream, '-prestador('), write(Stream, A), write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\',\''),
        write(Stream, E), write(Stream, '\',\''), write(Stream, F),
        write(Stream, '\').\n'),
    fail; true.

saveCuidado(Stream) :- cuidado(A,B,C,D,E),
        write(Stream, 'cuidado(\''), write(Stream, A),
        write(Stream, '\','), write(Stream, B), write(Stream, ','),
        write(Stream, C), write(Stream, ',\''), write(Stream, D),
        write(Stream, '\','), write(Stream, E), write(Stream, ').\n'),
    fail; true.

saveNCuidado(Stream) :- -cuidado(A,B,C,D,E),
        write(Stream, '-cuidado(\''), write(Stream, A),
        write(Stream, '\','), write(Stream, B), write(Stream, ','),
        write(Stream, C), write(Stream, ',\''), write(Stream, D),
        write(Stream, '\','), write(Stream, E), write(Stream, ').\n'),
    fail; true.

saveState :-
    open('state.pl', write, Stream),
    write(Stream, '% Extensão do predicado utente: #IdUt,Nome,Idade,Género,Morada -> {V,F,D}\n'),
    saveUtente(Stream),
    saveNUtente(Stream),
    write(Stream, '\n% Extensão do predicado prestador: #IdPrest,Nome,Idade,Género,Especialidade,Instituição -> {V,F,D}\n'),
    savePrestador(Stream),
    saveNPrestador(Stream),
    write(Stream, '\n% Extensão do predicado cuidado: Data,#IdUt,#IdPrest,Descrição,Custo -> {V,F,D}\n'),
    saveCuidado(Stream),
    saveNCuidado(Stream),
    close(Stream).
