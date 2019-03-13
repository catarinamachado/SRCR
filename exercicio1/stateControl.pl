saveUtente(Stream) :- utente(A,B,C,D,E,F),
        write(Stream, 'utente('),write(Stream, A),write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\','),
        write(Stream, E), write(Stream, ',\''),
        write(Stream, F), write(Stream, '\').\n'),
    fail; true.

saveServico(Stream) :- servico(A,B,C,D),
        write(Stream, 'servico('),write(Stream, A),write(Stream, ',\''),
        write(Stream, B), write(Stream, '\',\''), write(Stream, C),
        write(Stream, '\',\''), write(Stream, D), write(Stream, '\').\n'),
    fail; true.

saveConsulta(Stream) :- consulta(A,B,C,D),
        write(Stream, 'consulta(\''),write(Stream, A), write(Stream, '\','),
        write(Stream, B), write(Stream, ','), write(Stream, C),
        write(Stream, ','), write(Stream, D), write(Stream, ').\n'),
    fail; true.

saveMedico(Stream) :- medico(A,B,C,D,E),
        write(Stream, 'medico('),write(Stream, A),write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\','),
        write(Stream, E), write(Stream, ').\n'),
    fail; true.

saveEnfermeiro(Stream) :- enfermeiro(A,B,C,D,E),
        write(Stream, 'enfermeiro('),write(Stream, A),write(Stream, ',\''),
        write(Stream, B), write(Stream, '\','), write(Stream, C),
        write(Stream, ',\''), write(Stream, D), write(Stream, '\','),
        write(Stream, E), write(Stream, ').\n'),
    fail; true.


saveState :-
    open('state.pl', write, Stream),
    write(Stream, '% utente: #IdUt,Nome,Idade,Genero,#IdFamilia,Cidade -> {V,F}\n'),
    saveUtente(Stream),
    write(Stream, '\n% serviço: #IdServ,Descrição,Instituição,Cidade -> {V,F}\n'),
    saveServico(Stream),
    write(Stream, '\n% consulta: Data,#IdUt,#IdServ,Custo -> {V,F}\n'),
    saveConsulta(Stream),
    write(Stream, '\n% medico: #IdMedico,Nome,Idade,Sexo,#IdServ -> {V,F}\n'),
    saveMedico(Stream),
    write(Stream, '\n% enfermeiro: #IdEnfermeiro,Nome,Idade,Sexo,#IdServ -> {V,F}\n'),
    saveEnfermeiro(Stream),
    close(Stream).
