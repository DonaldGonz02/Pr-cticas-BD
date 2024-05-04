--Creación de nuestra Base de Datos
CREATE DATABASE LoginTrans_DonaldGonz
USe LoginTrans_DonaldGonz

--Creación de Tablas, aplicando Normalización.

--TABLA CONDUCTORES
CREATE TABLE tbl_Conductor (
    Id_Conductor INT PRIMARY KEY,
    Nombre_Conductor VARCHAR(50),
    Disponibilidad_Conductor Bit
);
	--Data para tbl_Conductor
	INSERT INTO tbl_Conductor (ID_Conductor, Nombre_Conductor, Disponibilidad_Conductor)
		VALUES 
		(1, 'Conductor 1', 0),
		(2, 'Conductor 2', 0),
		(3, 'Conductor 3', 0),
		(4, 'Conductor 4', 0),
		(5, 'Conductor 5', 0),
		(6, 'Conductor 6', 0),
		(7, 'Conductor 7', 0),
		(8, 'Conductor 8', 0),
		(9, 'Conductor 9', 0),
		(10, 'Conductor 10', 0);

SELECT * FROM tbl_Conductor

--TABLA_VEHICULO
CREATE TABLE tbl_Vehiculo (
    Id_Vehiculo INT PRIMARY KEY,
    Tipo_Vehiculo VARCHAR(50),
    Capacidad_Vehiculo DECIMAL(10, 2),
	Disponibilidad_Vehiculo bit
);

	--DATA PARA tbl_Vehiculo
	INSERT INTO tbl_Vehiculo (ID_Vehiculo, Tipo_Vehiculo, Capacidad_Vehiculo, Disponibilidad_Vehiculo)
	VALUES 
	(1, 'Camión Pequeño', 1000.00,0),
	(2, 'Camión Grande', 2000.00,0),
	(3, 'Remolque', 3000.00,0),
	(4, 'Motocicleta', 100.00,0),
	(5, 'Camión Grande', 5000.00,0),
	(6, 'Remolque', 6000.00,0),
	(7, 'Camión Pequeño', 7000.00,0),
	(8, 'Camión Grande', 8000.00,0),
	(9, 'Remolque', 9000.00,0),
	(10, 'Camión Pequeño', 10000.00,0);

SELECT * FROM tbl_Vehiculo

--TABLA PAQUETE
CREATE TABLE tbl_Paquete (
    Id_Paquete INT PRIMARY KEY,
    Peso_Paquete DECIMAL(10, 2),
    Urgencia_Paquete VARCHAR(20)
);

	--DATA PARA tbl_Paquete
	INSERT INTO tbl_Paquete (ID_Paquete, Peso_Paquete, Urgencia_Paquete)
		VALUES 
		(1, 10.00, 'Baja'),
		(2, 20.00, 'Media'),
		(3, 30.00, 'Alta'),
		(4, 500.00, 'Baja'),
		(5, 50.00, 'Media'),
		(6, 60.00, 'Alta'),
		(7, 70.00, 'Baja'),
		(8, 80.00, 'Media'),
		(9, 90.00, 'Alta'),
		(10, 100.00, 'Baja');

	SELECT * FROM tbl_Paquete

--TABLA DE ASIGNACION
CREATE TABLE tbl_Asignacion (
    Id_Asignacion INT IDENTITY (1,1) PRIMARY KEY,
    Id_Conductor INT,
    Id_Vehiculo INT,
    Id_Paquete INT,
    Fecha_Asignación DATE,
    FOREIGN KEY (id_conductor) REFERENCES tbl_Conductor (id_conductor),
    FOREIGN KEY (id_vehiculo) REFERENCES tbl_Vehiculo (id_vehiculo),
    FOREIGN KEY (id_paquete) REFERENCES tbl_Paquete (id_paquete)
);
	--Modificacion en Fecha_Asignación
	ALTER TABLE tbl_Asignacion
		ALTER COLUMN Fecha_Asignación DATETIME;

	--Modificando el Nombre de la columna Fecha_Asignación
	EXEC sp_rename 'tbl_Asignacion.FechaAsignacion', 'Fecha_Asignacion', 'COLUMN';

	--DTA PARA tbl_Asignacion
	INSERT INTO tbl_Asignacion (Id_Conductor, ID_Vehiculo, ID_Paquete, Fecha_Asignacion)
		VALUES 
		(1, 1, 11, GETDATE());

SELECT * FROM tbl_Asignacion;