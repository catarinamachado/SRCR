% utente: #IdUt,Nome,Idade,Cidade -> {V,F}
utente(1,'Carlos',2,'Porto').
utente(2,'Joao',20,'Braga').
utente(3,'Vilaca',20,'Braga').
utente(4,'Catarina',20,'Braga').
utente(5,'Eva',0,'Braga').
utente(6,'Maria Jose',56,'Guimarães').
utente(7,'Gustavo',28,'Lisboa').
utente(8,'Helena',25,'Lisboa').

% serviço: #IdServ,Descrição,Instituição,Cidade -> {V,F}
servico(1,'Pediatria','Hospital Santa Maria','Porto').
servico(2,'Ortopedia','Hospital de Braga','Braga').
servico(3,'Oftomologia','Hospital Santa Maria','Porto').
servico(4,'Cardiologia','Hospital de Braga','Braga').
servico(5,'Cirurgia Geral','Hospital Egas Moniz','Lisboa').
servico(6,'Estomatologia','Hospital Egas Moniz','Lisboa').
servico(7,'Genética Médica','Hospital Pulido Valente','Lisboa').
servico(8,'Medicina Nuclear','Hospital Pulido Valente','Lisboa').

% consulta: Data,#IdUt,#IdServ,Custo -> {V,F}
consulta('01-01-2010',1,1,10).
consulta('01-01-2010',1,1,10).
consulta('01-01-2010',2,1,10).
consulta('01-01-2010',2,1,10).
consulta('01-01-2010',3,1,10).
consulta('01-01-2010',1,3,10).
consulta('01-01-2010',3,3,10).
consulta('01-02-2010',4,2,20).
consulta('01-03-2010',2,2,40).

% medico: #IdMedico,Nome,Idade,Sexo,#IdServ -> {V,F}
medico(1,'Josefa',47,'F',1).
medico(2,'Manuel',29,'M',6).
medico(3,'Gaspar',38,'M',4).
medico(4,'Catia',43,'F',8).
