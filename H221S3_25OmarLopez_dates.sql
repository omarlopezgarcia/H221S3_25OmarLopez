-- DATOS PARA TABLA ESTUDIANTES
-------------------- INSERCIONES
---- DERECHOS
insert into duty (title, dates) values
('Matricula 1','20-02-2023'),
('Mensualidad 1','03-03-2023'),
('Mensualidad 2','03-04-2023'),
('Mensualidad 3','03-05-2023'),
('Mensualidad 4','03-06-2023'),
('Mensualidad 5','03-07-2023'),
('Matricula 2','01-08-2023'),
('Mensualidad 1','15-08-2023'),
('Mensualidad 2','15-09-2023'),
('Mensualidad 3','15-10-2023'),
('Mensualidad 4','15-11-2023'),
('Mensualidad 5','15-12-2023');

---- ESTUDIANTES AS
insert into asstudent (names, last_name, document_type, document_number, career, semester) values
('Rosendo','Baena Cordoba','DNI','75165597','AS','I'),
('Claudia','Jurado Carpio','DNI','75162542','AS','I'),
('Ariel','Landa Garrido','DNI','76007178','AS','II'),
('Patricia','Cuenca Izaguirre','DNI','73830737','AS','II'),
('Tania','Alcaraz Bermudez','DNI','75165587','AS','II'),
('Itziar','Anglada Azorin','DNI','71997493','AS','II'),
('Pascual','Zabaleta Lombardi','DNI','72893577','AS','III'),
('Silvio','Verdejo Campusano','DNI','70145327','AS','III'),
('Ezequiel','Noriega Marques','DNI','75261202','AS','III'),
('Adelardo','del Novoa Carrión','DNI','70905459','AS','III'),
('Celestino','Aguila Nicolas','DNI','72308430','AS','III'),
('Mariana','Cifuentes Frutos','DNI','76787956','AS','III');

---- ESTUDIANTES PA
insert into pastudent (names, last_name, document_type, document_number, career, semester) values
('Claudia','Bravo Reyna','DNI','85142536','PA','I'),
('Marcos','Palomino Saavedra','DNI','85412578','PA','I'),
('Rosa','Rodriguez Ovidio','DNI','15359575','PA','II'),
('Camilo','Mata Campos','DNI','15665544','PA','II'),
('Manuel','Del Prado Vidal','DNI','11223369','PA','II'),
('Carolina','Manrique de la Cruz','DNI','88552214','PA','II'),
('Ezequiel','Santana Pique','DNI','11447756','PA','III'),
('Martin','Tejada Farfan','DNI','99661147','PA','III'),
('Gregoria','Alvarado Carmen','DNI','88554412','PA','III'),
('Luis','Gamarra Solorzano','DNI','33221169','PA','III'),
('Emilio','Arenas Torres','DNI','22551147','PA','III'),
('Maria Franchesca','Tenorio Fernandez','DNI','88224413','PA','III');

---- PAGO ESTUDIANTES AS
insert into asstudentpay (amount, payment, asstudent_identifier, duty_identifier) values
('200.00','C',1,1),
('100.00','D',2,1),
('200.00','C',3,1),
('150.00','D',4,1),
('200.00','C',5,1),
('200.00','C',6,1),
('170.00','D',7,1),
('200.00','C',8,1),
('150.00','D',9,1),
('150.00','D',10,1),
('200.00','C',11,1),
('200.00','C',12,1);

---- PAGO ESTUDIANTES PA
insert into pastudentpay (amount, payment, pastudent_identifier, duty_identifier) values
('100.00','D',1,1),
('140.00','D',2,1),
('100.00','D',3,1),
('200.00','C',4,1),
('200.00','C',5,1),
('200.00','C',6,1),
('170.00','D',7,1),
('200.00','C',8,1),
('200.00','C',9,1),
('150.00','D',10,1),
('200.00','C',11,1),
('150.00','D',12,1);
