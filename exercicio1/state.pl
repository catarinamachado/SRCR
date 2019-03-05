% utente: #IdUt,Nome,Idade,Cidade -> {V,F}
utente(1,'Carlos',2,'Porto').
utente(2,'Joao',20,'Braga').
utente(3,'Vilaca',20,'Braga').
utente(4,'Catarina',20,'Braga').

% serviço: #IdServ,Descrição,Instituição,Cidade -> {V,F}
servico(1,'Pediatria','Hospital Santa Maria','Porto').
servico(2,'Ortopedia','Hospital de Braga','Braga').

% consulta: Data,#IdUt,#IdServ,Custo -> {V,F}
consulta('01-01-2010',1,1,10).
consulta('01-02-2010',4,2,20).
consulta('01-03-2010',2,2,40).
