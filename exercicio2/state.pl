% Extensão do predicado utente: #IdUt,Nome,Idade,Género,Morada -> {V,F,D}

%Conhecimento Perfeito Positivo
utente(1,'Carlos',2,'M','Porto').
utente(2,'Joao',20,'M','Braga').
utente(3,'Vilaca',20,'M','Braga').
utente(4,'Catarina',20,'F','Braga').
utente(5,'Eva',0,'F','Braga').
utente(6,'Maria Jose',56,'F','Guimaraes').
utente(7,'Gustavo',28,'M','Lisboa').
utente(8,'Helena',25,'F','Lisboa').

%Conhecimento Perfeito Negativo
-utente(9,'Guilherme',58,'M','Porto').
-utente(10,'Ana',34,'F','Guimaraes').

%Conhecimento Imperfeito Impreciso
%Não se sabe se o utente Edgar tem 31 ou 32 anos:
excecao(utente(11,'Edgar',31,'M','Coimbra')).
excecao(utente(11,'Edgar',32,'M','Coimbra')).

%Não se sabe se a utente Soraia é de Leiria ou de Setúbal:
excecao(utente(12,'Soraia',29,'F','Leiria')).
excecao(utente(12,'Soraia',29,'F','Setúbal')).

%Conhecimento Imperfeito Incerto
%Não se sabe a morada do Helder:
utente(13,'Helder',30,'M',morada_desconhecida).
excecao(utente(Id,N,I,G,M)) :- utente(Id,N,I,G,morada_desconhecida).

%Conhecimento Imperfeito Interdito
%É impossível saber a morada do Tobias
utente(14,'Tobias',50,'M',morada_impossivel).
excecao(utente(Id,N,I,G,M)) :- utente(Id,N,I,G,morada_impossivel).
nulointerdito(morada_impossivel).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado prestador: #IdPrest,Nome,Idade,Género,Especialidade,Instituição -> {V,F,D}

%Conhecimento Perfeito Positivo
prestador(1,'Josefa',47,'F','Pediatria','Hospital Santa Maria').
prestador(2,'Manuel',29,'M','Ortopedia','Hospital de Braga').
prestador(3,'Gaspar',38,'M','Dermatologia','Hospital Santa Maria').
prestador(4,'Catia',43,'F','Otorrinolaringologia','Hospital Pulido Valente').
prestador(5,'Marta',38,'F','Cirurgia Geral','Hospital Egas Moniz').
prestador(6,'Goncalo',28,'M','Cardiologia','Hospital de Braga').
prestador(7,'Patricia',39,'F','Genetica Medica','Hospital Pulido Valente').

%Conhecimento Perfeito Negativo
-prestador(8,'Luisa',40,'F','Oftalmologia','Hospital de Braga').
-prestador(9,'Sara',35,'F','Estomatologia','Hospital Egas Moniz').

%Conhecimento Imperfeito Impreciso
%Não se sabe se o prestador Rodrigo é especialista de Cardiologia ou Pediatria:
excecao(prestador(10,'Rodrigo',40,'M','Cardiologia','Hospital Santa Maria')).
excecao(prestador(10,'Rodrigo',40,'M','Pediatria','Hospital Santa Maria')).

%Não se sabe se o prestador se chama Flávio ou Fábio:
excecao(prestador(11,'Flávio',29,'M','Dermatologia','Hospital de Braga')).
excecao(prestador(11,'Fábio',29,'M','Dermatologia','Hospital de Braga')).

%Conhecimento Imperfeito Incerto
%Não se sabe a idade da prestadora Silvia:
prestador(12,'Silvia',idade_desconhecida,'F','Cirurgia Geral','Hospital de Braga').
excecao(prestador(Id,N,I,G,E,Inst)) :- prestador(Id,N,idade_desconhecida,G,E,Inst).

%Conhecimento Imperfeito Interdito
%É impossível saber a idade do prestador
prestador(13,'Maria Isabel',idade_impossivel,'F','Cardiologia','Hospital Egas Moniz').
excecao(prestador(Id,N,I,G,E,Inst)) :- prestador(Id,N,idade_impossivel,G,E,Inst).
nulointerdito(idade_impossivel).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensão do predicado cuidado: Data,#IdUt,#IdPrest,Descrição,Custo -> {V,F,D}

%Conhecimento Perfeito Positivo
cuidado('01-01-2018',1,4,'Exame de Acufenometria',100).
cuidado('23-05-2016',5,1,'Consulta de rotina',9).
cuidado('05-02-2019',3,5,'Teleconsulta de Cirurgia Geral',45).
cuidado('13-12-2018',8,7,'Consulta Pre-Concepcional',7).
cuidado('26-10-2016',2,2,'Consulta de Ortopedia - Joelho',30).
cuidado('10-03-2016',7,3,'Exame Biopsias da Pele e Mucosas',0).
cuidado('04-04-2017',5,7,'Consulta de Aconselhamento Genetico',34).
cuidado('12-12-2017',3,5,'Manometria Anorretal',4).
cuidado('09-09-2017',6,2,'Consulta de Ortopedia - Coluna',20).

%Conhecimento Perfeito Negativo
-cuidado('01-01-2018',4,8,'Avaliação dos Campos Visuais',10).
-cuidado('29-02-2017',6,6,'Eletrocardiografia',50).
-cuidado('02-04-2017',10,9,'Exame as glandulas salivares',23).

%Conhecimento Imperfeito Impreciso
%Não se sabe se o cuidado foi efetuado no dia 1 ou 2 de março de 2019:
excecao(cuidado('01-03-2019',5,1,'Consulta de rotina',9)).
excecao(cuidado('02-03-2019',5,1,'Consulta de rotina',9)).

%Conhecimento Imperfeito Incerto
%Não se sabe a descrição da consulta:
cuidado('02-04-2019',3,5,descricao_desconhecida,20).
excecao(cuidado(D,IdUt,IdPrest,Desc,C)) :- cuidado(D,IdUt,IdPrest,descricao_desconhecida,C).

%Conhecimento Imperfeito Interdito
%É impossível saber o custo do cuidado
cuidado('12-04-2019',2,2,'Consulta de Ortopedia - Joelho',custo_impossivel).
excecao(cuidado(D,IdUt,IdPrest,Desc,C)) :- cuidado(D,IdUt,IdPrest,Desc,custo_impossivel).
nulointerdito(custo_impossivel).
