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

-- Unica tabla maestra
-- Table: student
CREATE TABLE student (
    identifier int IDENTITY(1,1) NOT NULL,
    names varchar(160)  NOT NULL,
    last_name varchar(200) NOT NULL,
    document_type char(3) check(document_type = 'DNI' or document_type = 'CNE')  NOT NULL,
    document_number char(9) unique check(document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR 
			document_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    career char(2) check(career = 'AS' or career = 'PA') NOT NULL,
    semester char(3) check(semester = 'I' OR
						semester = 'II' OR
						semester = 'III' OR
						semester = 'IV' OR
						semester = 'V') NOT NULL,
    duty varchar(20) NOT NULL,
	amount decimal(8,2) NOT NULL,
	dates date NOT NULL,
    payments char(1) check(payments = 'D' or payments = 'C') NOT NULL,
    active char(1) check(active = 'A' or active = 'I') DEFAULT('A') NOT NULL,
	duty_identifier int NULL,
    CONSTRAINT student_pk PRIMARY KEY (identifier)
);
------------------------------------------------------------------------------------------------------------------------
-- Table: duty
CREATE TABLE duty (
    identifier int IDENTITY(1,1) NOT NULL,
    title varchar(20)  NOT NULL,
    amount decimal(8,2)  NOT NULL,
    dates date  NOT NULL,
    CONSTRAINT duty_pk PRIMARY KEY  (identifier)
);
-- foreign keys
-- Reference: student_duty (table: student)
ALTER TABLE student ADD CONSTRAINT student_duty
    FOREIGN KEY (duty_identifier)
    REFERENCES duty (identifier);

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
-----------------------------------------------ANÁLISIS DE SISTEMAS-----------------------------------------------------
-- INSERCIÓN
-- INSERCIÓN AS
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

-------------------------------------------------------------------------------------------------------------------
-- VISTAS ANÁLISIS DE SISTEMAS
-- SELECT ACTIVE
CREATE VIEW studentAS_active
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		active
	FROM student WHERE career='AS' and  active='A'
GO
-- SELECT INACTIVE
CREATE VIEW studentAS_inactive
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		active
	FROM student WHERE career='AS' and active='I'
GO
---------------------------------------------------
-- STUDENTS PAGOS
-- SELECT DEUDAS
CREATE VIEW studentAS_deudas
	AS
	SELECT
		identifier,
		names,
		last_name,
		career,
		semester,
		duty,
		amount,
		dates,
		payments
	FROM student WHERE career='AS' and payments='D'
GO

-- SELECT CANCELADOS
CREATE VIEW studentAS_cancelados
	AS
	SELECT
		identifier,
		names,
		last_name,
		career,
		semester,
		duty,
		amount,
		dates,
		payments
	FROM student WHERE career='AS' and payments='C'
GO

-----------------------------------------------PRODUCCIÓN AGRARIA-----------------------------------------------------
-- INSERCIÓN
-- INSERCIÓN PA
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
-------------------------------------------------------------------------------------------------------------------
-- VISTAS PRODUCCIÓN AGRARIA
-- SELECT ACTIVE
CREATE VIEW studentPA_active
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		active
	FROM student WHERE career='PA' and  active='A'
GO
-- SELECT INACTIVE
CREATE VIEW studentPA_inactive
	AS
	SELECT
		identifier,
		names,
		last_name,
		document_type,
		document_number,
		career,
		semester,
		active
	FROM student WHERE career='PA' and active='I'
GO
---------------------------------------------------
-- STUDENTS PAGOS
-- SELECT DEUDAS
CREATE VIEW studentPA_deudas
	AS
	SELECT
		identifier,
		names,
		last_name,
		career,
		semester,
		duty,
		amount,
		dates,
		payments
	FROM student WHERE career='PA' and payments='D'
GO

-- SELECT CANCELADOS
CREATE VIEW studentPA_cancelados
	AS
	SELECT
		identifier,
		names,
		last_name,
		career,
		semester,
		duty,
		amount,
		dates,
		payments
	FROM student WHERE career='PA' and payments='C'
GO