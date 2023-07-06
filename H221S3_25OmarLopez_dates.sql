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
insert into asstudent (names, last_name, document_type, document_number, semester) values
('Rosendo','Baena Cordoba','DNI','75165597','I'),
('Claudia','Jurado Carpio','DNI','75162542','I'),
('Ariel','Landa Garrido','DNI','76007178','II'),
('Patricia','Cuenca Izaguirre','DNI','73830737','II'),
('Tania','Alcaraz Bermudez','DNI','75165587','II'),
('Itziar','Anglada Azorin','DNI','71997493','II'),
('Pascual','Zabaleta Lombardi','DNI','72893577','III'),
('Silvio','Verdejo Campusano','DNI','70145327','III'),
('Ezequiel','Noriega Marques','DNI','75261202','III'),
('Adelardo','del Novoa Carrión','DNI','70905459','III'),
('Celestino','Aguila Nicolas','DNI','72308430','III'),
('Mariana','Cifuentes Frutos','DNI','76787956','III');

---- ESTUDIANTES PA
insert into pastudent (names, last_name, document_type, document_number, semester) values
('Claudia','Bravo Reyna','DNI','85142536','I'),
('Marcos','Palomino Saavedra','DNI','85412578','I'),
('Rosa','Rodriguez Ovidio','DNI','15359575','II'),
('Camilo','Mata Campos','DNI','15665544','II'),
('Manuel','Del Prado Vidal','DNI','11223369','II'),
('Carolina','Manrique de la Cruz','DNI','88552214','II'),
('Ezequiel','Santana Pique','DNI','11447756','III'),
('Martin','Tejada Farfan','DNI','99661147','III'),
('Gregoria','Alvarado Carmen','DNI','88554412','III'),
('Luis','Gamarra Solorzano','DNI','33221169','III'),
('Emilio','Arenas Torres','DNI','22551147','III'),
('Maria Franchesca','Tenorio Fernandez','DNI','88224413','III');

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
