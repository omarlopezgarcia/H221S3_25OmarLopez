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
    career char(2) check(career = 'AS' or career = 'PA') NOT NULL,
    semester char(3) check(semester = 'I' OR
						semester = 'II' OR
						semester = 'III' OR
						semester = 'IV' OR
						semester = 'V') NOT NULL,
    active char(1) check(active = 'A' or active = 'I') DEFAULT('A') NOT NULL,
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
    career char(2) check(career = 'AS' or career = 'PA') NOT NULL,
    semester char(3) check(semester = 'I' OR
						semester = 'II' OR
						semester = 'III' OR
						semester = 'IV' OR
						semester = 'V') NOT NULL,
    active char(1) check(active = 'A' or active = 'I') DEFAULT('A') NOT NULL,
    CONSTRAINT pastudent_pk PRIMARY KEY  (identifier)
);

-- Table: duty
CREATE TABLE duty (
    identifier int IDENTITY(1,1) NOT NULL,
    title varchar(20)  NOT NULL,
    dates date  NOT NULL,
    CONSTRAINT duty_pk PRIMARY KEY  (identifier)
);

-- Table: asstudentpay
CREATE TABLE asstudentpay (
    identifier int IDENTITY(1,1) NOT NULL,
	amount decimal(8,2)  NOT NULL,
    payment char(1) check(payment = 'D' or payment = 'C') NOT NULL,
    asstudent_identifier int  NOT NULL,
    duty_identifier int  NOT NULL,
    CONSTRAINT asstudentpay_pk PRIMARY KEY  (identifier)
);

-- Table: pastudentpay
CREATE TABLE pastudentpay (
    identifier int IDENTITY(1,1) NOT NULL,
    amount decimal(8,2)  NOT NULL,
    payment char(1) check(payment = 'D' or payment = 'C') NOT NULL,
    pastudent_identifier int  NOT NULL,
    duty_identifier int  NOT NULL,
    CONSTRAINT pastudentpay_pk PRIMARY KEY  (identifier)
);
--------------------------------------------------------------------------
-- foreign keys
-- Reference: asstudentdebt_asstudent (table: asstudentpay)
ALTER TABLE asstudentpay ADD CONSTRAINT asstudentdebt_asstudent
    FOREIGN KEY (asstudent_identifier)
    REFERENCES asstudent (identifier);

-- Reference: asstudentdebt_duty (table: asstudentpay)
ALTER TABLE asstudentpay ADD CONSTRAINT asstudentdebt_duty
    FOREIGN KEY (duty_identifier)
    REFERENCES duty (identifier);

-- Reference: pastudentpay_duty (table: pastudentpay)
ALTER TABLE pastudentpay ADD CONSTRAINT pastudentpay_duty
    FOREIGN KEY (duty_identifier)
    REFERENCES duty (identifier);

-- Reference: pastudentpay_pastudent (table: pastudentpay)
ALTER TABLE pastudentpay ADD CONSTRAINT pastudentpay_pastudent
    FOREIGN KEY (pastudent_identifier)
    REFERENCES pastudent (identifier);
--------------------------------------------------------------------------------
----- TABLA VISTA Y CADA UNA CON SU INSERCIÓN
-- VISTA AS STUDENT ACTIVE
CREATE VIEW asstudent_active
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
	FROM asstudent
	WHERE active='A'
GO
-- VISTA AS STUDENT INACTIVE
CREATE VIEW asstudent_inactive
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
	FROM asstudent
	WHERE active='I'
GO

-- VISTA PA STUDENT ACTIVE
CREATE VIEW pastudent_active
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
	FROM asstudent
	WHERE active='A'
GO
-- VISTA PA STUDENT INACTIVE
CREATE VIEW pastudent_inactive
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
	FROM asstudent
	WHERE active='I'
GO
----------------------------------
-- VISTA AS STUDENT DEBT
CREATE VIEW asstudentpay_debt
	AS
	SELECT
		p.identifier,
		CONCAT(a.names,' ',UPPER(a.last_name)) AS 'alumnoAS',
		a.career,
		a.semester,
		d.title AS 'derecho',
		p.amount,
		p.payment
	FROM asstudentpay AS p
	INNER JOIN asstudent AS a ON p.asstudent_identifier = a.identifier
	INNER JOIN duty AS d ON p.duty_identifier = d.identifier
	WHERE payment='D'
GO
-- VISTA AS STUDENT CANCELLED
CREATE VIEW asstudentpay_cancelled
	AS
	SELECT
		p.identifier,
		CONCAT(a.names,' ',UPPER(a.last_name)) AS 'alumnoAS',
		a.career,
		a.semester,
		d.title AS 'derecho',
		p.amount,
		p.payment
	FROM asstudentpay AS p
	INNER JOIN asstudent AS a ON p.asstudent_identifier = a.identifier
	INNER JOIN duty AS d ON p.duty_identifier = d.identifier
	WHERE payment='C'
GO
-- VISTA PA STUDENT DEBT
CREATE VIEW pastudentpay_debt
	AS
	SELECT
		p.identifier,
		CONCAT(pa.names,' ',UPPER(pa.last_name)) AS 'alumnoAS',
		pa.career,
		pa.semester,
		d.title AS 'derecho',
		p.amount,
		p.payment
	FROM asstudentpay AS p
	INNER JOIN pastudent AS pa ON p.asstudent_identifier = pa.identifier
	INNER JOIN duty AS d ON p.duty_identifier = d.identifier
	WHERE payment='D'
GO
-- VISTA PA STUDENT CANCELLED
CREATE VIEW pastudentpay_cancelled
	AS
	SELECT
		p.identifier,
		CONCAT(pa.names,' ',UPPER(pa.last_name)) AS 'alumnoAS',
		pa.career,
		pa.semester,
		d.title AS 'derecho',
		p.amount,
		p.payment
	FROM asstudentpay AS p
	INNER JOIN pastudent AS pa ON p.asstudent_identifier = pa.identifier
	INNER JOIN duty AS d ON p.duty_identifier = d.identifier
	WHERE payment='C'
GO