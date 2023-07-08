-------------------------------------------------------------------------------------
-------------------- INSERCIONES
---- DERECHOS
insert into duty (title, dates, amount) values
('Matricula 1','20-02-2023', '200.00'),
('Mensualidad Marzo','03-03-2023', '400.00'),
('Mensualidad Abril','03-04-2023', '400.00'),
('Mensualidad Mayo','03-05-2023', '400.00'),
('Mensualidad Junio','03-06-2023', '400.00'),
('Mensualidad Julio','03-07-2023', '400.00'),
('Matricula 2','01-08-2023', '200.00'),
('Mensualidad Agosto','15-08-2023', '400.00'),
('Mensualidad Setiembre','15-09-2023', '400.00'),
('Mensualidad Octube','15-10-2023', '400.00'),
('Mensualidad Noviembre','15-11-2023', '400.00'),
('Mensualidad Diciembre','15-12-2023', '400.00');

---- ESTUDIANTES AS
insert into asstudent (names, last_name, document_type, document_number, career, semester, title, amount, active) values
('Rosendo','Baena Cordoba','DNI','75165597','AS','1', 'Matricula 1', '150.00', 'D'),
('Claudia','Jurado Carpio','DNI','75162542','AS','1', 'Matricula 1', '150.00', 'D'),
('Ariel','Landa Garrido','DNI','76007178','AS','2', 'Matricula 1', '150.00', 'D'),
('Patricia','Cuenca Izaguirre','DNI','73830737','AS','2', 'Matricula 1', '150.00', 'D'),
('Tania','Alcaraz Bermudez','DNI','75165587','AS','2', 'Matricula 1', '200.00', 'C'),
('Itziar','Anglada Azorin','DNI','71997493','AS','2', 'Matricula 1', '200.00', 'C'),
('Pascual','Zabaleta Lombardi','DNI','72893577','AS','3', 'Matricula 1', '200.00', 'D'),
('Silvio','Verdejo Campusano','DNI','70145327','AS','3', 'Matricula 1', '200.00', 'D'),
('Ezequiel','Noriega Marques','DNI','75261202','AS','3', 'Matricula 1', '200.00', 'C'),
('Adelardo','del Novoa Carrión','DNI','70905459','AS','4', 'Matricula 1', '200.00', 'D'),
('Celestino','Aguila Nicolas','DNI','72308430','AS','4', 'Matricula 1', '200.00', 'C'),
('Mariana','Cifuentes Frutos','DNI','76787956','AS','5', 'Matricula 2', '200.00', 'C');

---- ESTUDIANTES PA
insert into pastudent (names, last_name, document_type, document_number, career, semester, title, amount, active) values
('Claudia','Bravo Reyna','DNI','85142536','PA','1', 'Mensualidad Marzo', '400.00', 'C'),
('Marcos','Palomino Saavedra','DNI','85412578','PA','1', 'Mensualidad Marzo', '400.00', 'C'),
('Rosa','Rodriguez Ovidio','DNI','15359575','PA','2', 'Mensualidad Marzo', '300.00', 'D'),
('Camilo','Mata Campos','DNI','15665544','PA','2', 'Mensualidad Marzo', '300.00', 'D'),
('Manuel','Del Prado Vidal','DNI','11223369','PA','2', 'Mensualidad Marzo', '400.00', 'C'),
('Carolina','Manrique de la Cruz','DNI','88552214','PA','3', 'Mensualidad Marzo', '200.00', 'D'),
('Ezequiel','Santana Pique','DNI','11447756','PA','3', 'Mensualidad Marzo', '300.00', 'D'),
('Martin','Tejada Farfan','DNI','99661147','PA','3', 'Mensualidad Marzo', '300.00', 'D'),
('Gregoria','Alvarado Carmen','DNI','88554412','PA','4', 'Mensualidad Marzo', '300.00', 'D'),
('Luis','Gamarra Solorzano','DNI','33221169','PA','4', 'Mensualidad Marzo', '400.00', 'C'),
('Emilio','Arenas Torres','DNI','22551147','PA','5', 'Mensualidad Marzo', '100.00', 'D'),
('Maria Franchesca','Tenorio Fernandez','DNI','88224413','PA','5', 'Mensualidad Marzo', '400.00', 'C');
