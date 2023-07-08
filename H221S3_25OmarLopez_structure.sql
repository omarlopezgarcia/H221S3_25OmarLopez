-- crear y recrear base de datos
USE master;
GO
DROP DATABASE IF EXISTS dbValleGrande;
GO
CREATE DATABASE dbValleGrande;
GO
USE dbValleGrande;
GO
-- Setear el formato day
SELECT sysdatetime() as 'Fecha y  hora'
GO
SET DATEFORMAT dmy
GO

----------------------------------------------------------------------------------------------------
-- tables
-- Table: asstudent MAESTRO 1
CREATE TABLE asstudent (
    identifier int IDENTITY(1,1) NOT NULL,
    names varchar(160)  NOT NULL,
    last_name varchar(200) NOT NULL,
    document_type char(3) check(document_type = 'DNI' or document_type = 'CNE')  NOT NULL,
    document_number char(9) unique check(document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    career char(2) check(career = 'AS') NOT NULL,
    semester char(1) check(semester = '1' OR
						semester = '2' OR
						semester = '3' OR
						semester = '4' OR
						semester = '5') NOT NULL,
	title varchar(26) NOT NULL,
	amount float NOT NULL,
    active char(1) check(active = 'D' or active = 'C') NOT NULL,
    CONSTRAINT asstudent_pk PRIMARY KEY  (identifier)
);

-- Table: pastudent MAESTRO 2
CREATE TABLE pastudent (
    identifier int IDENTITY(1,1) NOT NULL,
    names varchar(160)  NOT NULL,
    last_name varchar(200) NOT NULL,
    document_type char(3) check(document_type = 'DNI' or document_type = 'CNE')  NOT NULL,
    document_number char(9) unique check(document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    career char(2) check(career = 'PA') NOT NULL,
    semester char(1) check(semester = '1' OR
						semester = '2' OR
						semester = '3' OR
						semester = '4' OR
						semester = '5') NOT NULL,
	title varchar(26) NOT NULL,
	amount float NOT NULL,
    active char(1) check(active = 'D' or active = 'C') NOT NULL,
    CONSTRAINT pastudent_pk PRIMARY KEY  (identifier)
);

-- Table: duty
CREATE TABLE duty (
    identifier int IDENTITY(1,1) NOT NULL,
    title varchar(26)  NOT NULL,
    dates date  NOT NULL,
	amount float NOT NULL,
	active char(1) check(active = 'A' or active = 'I') DEFAULT('A') NOT NULL,
    CONSTRAINT duty_pk PRIMARY KEY  (identifier)
);

--------------------------------------------------------------------------------

----- TABLA VISTA Y CADA UNA CON SU INSERCIÓN
-- VISTA AS STUDENT ACTIVE
CREATE VIEW asstudent_debt
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		title,
		amount,
		active
	FROM asstudent
	WHERE active='D'
GO
-- VISTA AS STUDENT INACTIVE
CREATE VIEW asstudent_cancelled
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		title,
		amount,
		active
	FROM asstudent
	WHERE active='C'
GO

-- VISTA PA STUDENT ACTIVE
CREATE VIEW pastudent_debt
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		title,
		amount,
		active
	FROM pastudent
	WHERE active='D'
GO
-- VISTA PA STUDENT INACTIVE
CREATE VIEW pastudent_cancelled
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		title,
		amount,
		active
	FROM pastudent
	WHERE active='C'
GO

-- VISTA PARA DERECHOS
CREATE VIEW duty_date
	AS
	SELECT
		identifier,
		title,
		FORMAT(dates,'dd/MM') dates,
		amount
	FROM duty WHERE active='A'
GO
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

select * from asstudent_debt;
select * from asstudent_cancelled;
select * from pastudent_debt;
select * from pastudent_cancelled;
select * from duty_date;