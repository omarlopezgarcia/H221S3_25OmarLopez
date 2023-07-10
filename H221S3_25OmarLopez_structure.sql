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
SET LANGUAGE 'Spanish';

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
	dates date NOT NULL,
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
	dates date NOT NULL,
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
		CONCAT(
        DATEPART(DAY, dates), 
        ' ',
        DATENAME(MONTH, dates), 
        ' ',
        DATEPART(YEAR, dates)
		) dates,
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
		CONCAT(
        DATEPART(DAY, dates), 
        ' ',
        DATENAME(MONTH, dates), 
        ' ',
        DATEPART(YEAR, dates)
		) dates,
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
		CONCAT(
        DATEPART(DAY, dates), 
        ' ',
        DATENAME(MONTH, dates), 
        ' ',
        DATEPART(YEAR, dates)
		) dates,
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
		CONCAT(
        DATEPART(DAY, dates), 
        ' ',
        DATENAME(MONTH, dates), 
        ' ',
        DATEPART(YEAR, dates)
		) dates,
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
		CONCAT(
        DATEPART(DAY, dates), 
        ' ',
        DATENAME(MONTH, dates)
		) dates,
		amount,
		active
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
INSERT INTO asstudent (names, last_name, document_type, document_number, career, semester, title, amount, dates, active) VALUES
('Rosendo', 'Baena Cordoba', 'DNI', '75165597', 'AS', '1', 'Matricula 1', '100.00','10-07-2023', 'D'),
('Marina', 'Soto Garcia', 'DNI', '48291673', 'AS', '4', 'Mensualidad Marzo', '400.00','10-07-2023', 'C'),
('Cristian', 'Paredes Silva', 'DNI', '62834017', 'AS', '3', 'Mensualidad Abril', '200.00','10-07-2023', 'D'),
('Lucia', 'Molina Rojas', 'DNI', '71459280', 'AS', '5', 'Mensualidad Mayo', '400.00','10-07-2023', 'C'),
('Pedro', 'Gomez Reyes', 'DNI', '87654321', 'AS', '2', 'Mensualidad Junio', '300.00','10-07-2023', 'D'),
('Carla', 'Herrera Santos', 'DNI', '91572834', 'AS', '1', 'Mensualidad Julio', '400.00','10-07-2023', 'C'),
('Luis', 'Lopez Perez', 'DNI', '51927843', 'AS', '3', 'Matricula 2', '120.00','10-07-2023', 'D'),
('Laura', 'Cortes Fernandez', 'DNI', '43258961', 'AS', '4', 'Mensualidad Agosto', '400.00','10-07-2023', 'C'),
('Diego', 'Ramirez Torres', 'DNI', '76123459', 'AS', '5', 'Mensualidad Setiembre', '200.00','10-07-2023', 'D'),
('Javier', 'Garcia Jimenez', 'DNI', '89762145', 'AS', '2', 'Mensualidad Octubre', '400.00','10-07-2023', 'C'),
('Ana', 'Martinez Ruiz', 'DNI', '63159724', 'AS', '1', 'Mensualidad Noviembre', '200.00','10-07-2023', 'D'),
('Miguel', 'Sanchez Herrera', 'DNI', '95731286', 'AS', '3', 'Mensualidad Diciembre', '400.00','10-07-2023', 'C'),
('Pablo', 'Gutierrez Castro', 'DNI', '28456319', 'AS', '4', 'Matricula 1', '100.00','10-07-2023', 'D'),
('Isabel', 'Vargas Miranda', 'DNI', '76845123', 'AS', '5', 'Mensualidad Marzo', '400.00','10-07-2023', 'C'),
('Sergio', 'Rios Delgado', 'DNI', '91567234', 'AS', '2', 'Mensualidad Abril', '300.00','10-07-2023', 'D'),
('Diana', 'Ortega Silva', 'DNI', '52781394', 'AS', '1', 'Mensualidad Mayo', '400.00','10-07-2023', 'C'),
('Roberto', 'Luna Castro', 'DNI', '64217839', 'AS', '3', 'Mensualidad Junio', '200.00','10-07-2023', 'D'),
('Fernanda', 'Perez Montes', 'DNI', '89654321', 'AS', '4', 'Mensualidad Julio', '400.00','10-07-2023', 'C'),
('Andres', 'Herrera Rojas', 'DNI', '71984623', 'AS', '5', 'Matricula 2', '200.00','10-07-2023', 'C'),
('Carolina', 'Gomez Torres', 'DNI', '43195627', 'AS', '2', 'Mensualidad Agosto', '400.00','10-07-2023', 'C'),
('Raul', 'Santos Fernandez', 'DNI', '67241359', 'AS', '1', 'Mensualidad Setiembre', '200.00','10-07-2023', 'D'),
('Camila', 'Ramirez Castro', 'DNI', '91736285', 'AS', '3', 'Mensualidad Octubre', '400.00','10-07-2023', 'C'),
('Manuel', 'Garcia Delgado', 'DNI', '52639714', 'AS', '4', 'Mensualidad Noviembre', '300.00','10-07-2023', 'D'),
('Valeria', 'Lopez Herrera', 'DNI', '64875123', 'AS', '5', 'Mensualidad Diciembre', '400.00','10-07-2023', 'C'),
('Felipe', 'Martinez Ruiz', 'DNI', '91364782', 'AS', '2', 'Matricula 1', '200.00','10-07-2023', 'C'),
('Sofia', 'Sanchez Vargas', 'DNI', '57921634', 'AS', '1', 'Mensualidad Marzo', '400.00','10-07-2023', 'C'),
('Daniel', 'Rios Delgado', 'DNI', '71462937', 'AS', '3', 'Mensualidad Abril', '200.00','10-07-2023', 'D'),
('Elena', 'Ortega Silva', 'DNI', '52147983', 'AS', '4', 'Mensualidad Mayo', '400.00','10-07-2023', 'C'),
('Julian', 'Luna Castro', 'DNI', '93752814', 'AS', '5', 'Mensualidad Junio', '200.00','10-07-2023', 'D'),
('Mariana', 'Perez Montes', 'DNI', '67951238', 'AS', '2', 'Mensualidad Julio', '400.00','10-07-2023', 'C');

---- ESTUDIANTES PA
INSERT INTO pastudent (names, last_name, document_type, document_number, career, semester, title, amount, dates, active) VALUES
('Javier', 'Gomez Santos', 'DNI', '12345678', 'PA', '1', 'Matricula 1', '100.00','10-07-2023', 'D'),
('Marina', 'Lopez Torres', 'DNI', '23456789', 'PA', '4', 'Mensualidad Marzo', '400.00','10-07-2023', 'C'),
('Carolina', 'Perez Ruiz', 'DNI', '34567890', 'PA', '3', 'Mensualidad Abril', '300.00','10-07-2023', 'D'),
('Andres', 'Herrera Castro', 'DNI', '45678901', 'PA', '5', 'Mensualidad Mayo', '400.00','10-07-2023', 'C'),
('Felipe', 'Ramirez Silva', 'DNI', '56789012', 'PA', '2', 'Mensualidad Junio', '300.00','10-07-2023', 'D'),
('Sofia', 'Garcia Vargas', 'DNI', '67890123', 'PA', '1', 'Mensualidad Julio', '400.00','10-07-2023', 'C'),
('Laura', 'Lopez Santos', 'DNI', '78901234', 'PA', '3', 'Matricula 2', '200.00','10-07-2023', 'C'),
('Camila', 'Perez Fernandez', 'DNI', '89012345', 'PA', '4', 'Mensualidad Agosto', '400.00','10-07-2023', 'C'),
('Roberto', 'Herrera Torres', 'DNI', '90123456', 'PA', '5', 'Mensualidad Setiembre', '300.00','10-07-2023', 'D'),
('Diego', 'Ramirez Castro', 'DNI', '98765432', 'PA', '2', 'Mensualidad Octubre', '400.00','10-07-2023', 'C'),
('Luis', 'Gomez Santos', 'DNI', '87654321', 'PA', '1', 'Mensualidad Noviembre', '300.00','10-07-2023', 'D'),
('Carla', 'Lopez Torres', 'DNI', '76543210', 'PA', '3', 'Mensualidad Diciembre', '400.00','10-07-2023', 'C'),
('Mariana', 'Perez Ruiz', 'DNI', '65432109', 'PA', '4', 'Matricula 1', '100.00','10-07-2023', 'D'),
('Daniel', 'Herrera Castro', 'DNI', '54321098', 'PA', '5', 'Mensualidad Marzo', '400.00','10-07-2023', 'C'),
('Lucia', 'Ramirez Silva', 'DNI', '43210987', 'PA', '2', 'Mensualidad Abril', '300.00','10-07-2023', 'D'),
('Pedro', 'Garcia Vargas', 'DNI', '32109876', 'PA', '1', 'Mensualidad Mayo', '400.00','10-07-2023', 'C'),
('Ana', 'Lopez Santos', 'DNI', '21098765', 'PA', '3', 'Mensualidad Junio', '300.00','10-07-2023', 'D'),
('Cristian', 'Perez Fernandez', 'DNI', '10987654', 'PA', '4', 'Mensualidad Julio', '400.00','10-07-2023', 'C'),
('Isabel', 'Herrera Torres', 'DNI', '09876543', 'PA', '5', 'Matricula 2', '140.00','10-07-2023', 'D'),
('Manuel', 'Ramirez Castro', 'DNI', '98765098', 'PA', '2', 'Mensualidad Agosto', '400.00','10-07-2023', 'C'),
('Valeria', 'Gomez Santos', 'DNI', '87654987', 'PA', '1', 'Mensualidad Setiembre', '300.00','10-07-2023', 'D'),
('Pablo', 'Lopez Torres', 'DNI', '76543987', 'PA', '3', 'Mensualidad Octubre', '400.00','10-07-2023', 'C'),
('Diana', 'Perez Ruiz', 'DNI', '65437892', 'PA', '4', 'Mensualidad Noviembre', '300.00','10-07-2023', 'D'),
('Raul', 'Herrera Castro', 'DNI', '54329876', 'PA', '5', 'Mensualidad Diciembre', '400.00','10-07-2023', 'C'),
('Julian', 'Ramirez Silva', 'DNI', '43217865', 'PA', '2', 'Matricula 1', '250.00','10-07-2023', 'D'),
('Elena', 'Garcia Vargas', 'DNI', '32108765', 'PA', '1', 'Mensualidad Marzo', '400.00','10-07-2023', 'C'),
('Miguel', 'Lopez Santos', 'DNI', '21087654', 'PA', '3', 'Mensualidad Abril', '300.00','10-07-2023', 'D'),
('Sergio', 'Perez Fernandez', 'DNI', '10986543', 'PA', '4', 'Mensualidad Mayo', '400.00','10-07-2023', 'C'),
('Fernanda', 'Herrera Torres', 'DNI', '09875432', 'PA', '5', 'Mensualidad Junio', '140.00','10-07-2023', 'D'),
('Valentina', 'Ramirez Castro', 'DNI', '98765430', 'PA', '2', 'Mensualidad Julio', '400.00','10-07-2023', 'C');

select * from asstudent_debt;
select * from asstudent_cancelled;
select * from pastudent_debt;
select * from pastudent_cancelled;
select * from duty_date;

