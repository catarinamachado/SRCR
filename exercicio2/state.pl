% utente: #IdUt,Nome,Idade,Género,Morada -> {V,F}
utente(1,'Carlos',2,'M','Porto').
utente(2,'Joao',20,'M','Braga').
utente(3,'Vilaca',20,'M','Braga').
utente(4,'Catarina',20,'F','Braga').
utente(5,'Eva',0,'F',3,'Braga').
utente(6,'Maria Jose',56,'F','Guimaraes').
utente(7,'Gustavo',28,'M','Lisboa').
utente(8,'Helena',25,'F','Lisboa').
utente(9,'Guilherme',58,'M','Porto').
utente(10,'Ana',34,'F','Guimaraes').

% prestador: #IdPrest,Nome,Idade,Género,Especialidade,Instituição -> {V,F}
prestador(1,'Josefa',47,'F','Pediatria','Hospital Santa Maria').
prestador(2,'Manuel',29,'M','Ortopedia','Hospital de Braga').
prestador(3,'Gaspar',38,'M',4,'Dermatologia','Hospital Santa Maria').
prestador(4,'Catia',43,'F','Otorrinolaringologia','Hospital Pulido Valente').
prestador(5,'Luisa',40,'F','Oftalmologia','Hospital de Braga').
prestador(6,'Marta',38,'F','Cirurgia Geral','Hospital Egas Moniz').
prestador(7,'Gonçalo',28,'M','Cardiologia','Hospital de Braga').
prestador(8,'Sara',35,'F','Estomatologia','Hospital Egas Moniz').
prestador(9,'Patricia',39,'F','Genetica Medica','Hospital Pulido Valente').

% cuidado: Data,#IdUt,#IdPrest,Descrição,Custo -> {V,F}
cuidado('01-01-2018',1,4,'Exame de Acufenometria',100).
cuidado('01-01-2018',4,5,'Avaliação dos Campos Visuais',10).
cuidado('23-05-2016',5,1,'Consulta de rotina',9).
cuidado('05-02-2019',3,6,'Teleconsulta de Cirurgia Geral',45).
cuidado('13-12-2018',8,9,'Consulta Pré-Concepcional',7).
cuidado('26-10-2016',2,2,'Consulta de Ortopedia - Joelho',30).
cuidado('29-02-2017',6,7,'Eletrocardiografia',50).
cuidado('10-03-2016',7,3,'Exame Biópsias da Pele e Mucosas',0).
cuidado('02-04-2017',10,8,'Exame às glândulas salivares',23).
cuidado('04-04-2017',5,9,'Consulta de Aconselhamento Genético',34).
cuidado('12-12-2017',3,6,'Manometria Anorretal',4).
cuidado('09-09-2017',9,2,'Consulta de Ortopedia - Coluna',20).
