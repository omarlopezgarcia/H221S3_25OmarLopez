-- DATOS PARA TABLA ESTUDIANTES
-- SOLO ANÁLISIS DE SISTEMAS
insert into student (names, last_name, document_type, document_number, career, semester, duty, amount, dates, payments) values
('Rosendo','Baena Cordoba','DNI','75165597','AS','I','Matricula 1','200.00','20-02-2023', 'C'),
('Claudia','Jurado Carpio','DNI','75162542','AS','I','Mensualidad 1','300.00','03-03-2023','D'),
('Ariel','Landa Garrido','DNI','76007178','AS','II','Mensualidad 2','400.00','03-04-2023', 'C'),
('Patricia','Cuenca Izaguirre','DNI','73830737','AS','II','Mensualidad 3','400.00','03-05-2023','C'),
('Tania','Alcaraz Bermudez','DNI','75165587','AS','II','Mensualidad 4','400.00','03-06-2023','C'),
('Itziar','Anglada Azorin','DNI','71997493','AS','II','Mensualidad 5','350.00','03-07-2023','D'),
('Pascual','Zabaleta Lombardi','DNI','72893577','AS','III','Matricula 2','150.00','01-08-2023','D'),
('Silvio','Verdejo Campusano','DNI','70145327','AS','III','Mensualidad 1','300.00','15-08-2023','D'),
('Ezequiel','Noriega Marques','DNI','75261202','AS','III','Mensualidad 2','200.00','15-09-2023','D'),
('Adelardo','del Novoa Carrión','DNI','70905459','AS','III','Mensualidad 3','380.00','15-10-2023','D'),
('Celestino','Aguila Nicolas','DNI','72308430','AS','III','Mensualidad 4','300.00','15-11-2023','D'),
('Mariana','Cifuentes Frutos','DNI','76787956','AS','III','Mensualidad 5','400.00','15-10-2023','C');
-- SOLO PRODUCCIÓN AGRARIA
insert into student (names, last_name, document_type, document_number, career, semester, duty, amount, dates, payments) values
('Claudia','Bravo Reyna','DNI','85142536','PA','I','Matricula 1','180.00','20-02-2023', 'D'),
('Marcos','Palomino Saavedra','DNI','85412578','PA','I','Mensualidad 1','300.00','03-03-2023','D'),
('Rosa','Rodriguez Ovidio','DNI','15359575','PA','II','Mensualidad 2','200.00','03-04-2023', 'D'),
('Camilo','Mata Campos','DNI','15665544','PA','II','Mensualidad 3','400.00','03-05-2023','C'),
('Manuel','Del Prado Vidal','DNI','11223369','PA','II','Mensualidad 4','400.00','03-06-2023','C'),
('Carolina','Manrique de la Cruz','DNI','88552214','PA','II','Mensualidad 5','400.00','03-07-2023','C'),
('Ezequiel','Santana Pique','DNI','11447756','PA','III','Matricula 2','150.00','01-08-2023','D'),
('Martin','Tejada Farfan','DNI','99661147','PA','III','Mensualidad 1','400.00','15-08-2023','C'),
('Gregoria','Alvarado Carmen','DNI','88554412','PA','III','Mensualidad 2','400.00','15-09-2023','C'),
('Luis','Gamarra Solorzano','DNI','33221169','PA','III','Mensualidad 3','380.00','15-10-2023','D'),
('Emilio','Arenas Torres','DNI','22551147','PA','III','Mensualidad 4','300.00','15-11-2023','D'),
('Maria Franchesca','Tenorio Fernandez','DNI','88224413','PA','III','Mensualidad 5','400.00','15-10-2023','C');
-- DERECHOS
insert into duty (title, amount, dates) values
('Matricula 1', '200.00', '20-02-2023'),
('Mensualidad 1', '400.00', '03-03-2023'),
('Mensualidad 2', '400.00', '03-04-2023'),
('Mensualidad 3', '400.00', '03-05-2023'),
('Mensualidad 4', '400.00', '03-06-2023'),
('Mensualidad 5', '400.00', '03-07-2023'),
('Matricula 2', '200.00', '01-08-2023'),
('Mensualidad 1', '400.00', '15-08-2023'),
('Mensualidad 2', '400.00', '15-09-2023'),
('Mensualidad 3', '400.00', '15-10-2023'),
('Mensualidad 4', '400.00', '15-11-2023'),
('Mensualidad 5', '400.00', '15-12-2023');