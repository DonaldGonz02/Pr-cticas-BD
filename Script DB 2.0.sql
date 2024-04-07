-- Creaci�n de la base de datos mejorada
CREATE DATABASE Tienda_Electr�nica;
USE Tienda_Electr�nica;

-- Tabla de Clientes
CREATE TABLE Cliente (
	ID_Cliente INT PRIMARY KEY,
	Nombre_Cliente VARCHAR(50),
	Apellido_Cliente VARCHAR(50),
	ID_Direccion INT,
	FOREIGN KEY (ID_Direccion) REFERENCES Direccion(ID_Direccion)
);

-- Insertamos 10 registros
-- Insertar 10 registros de clientes
INSERT INTO Cliente (ID_Cliente, Nombre_Cliente, Apellido_Cliente, ID_Direccion)
VALUES
    (1, 'Juan', 'P�rez', 1),
    (2, 'Mar�a', 'Garc�a', 2),
    (3, 'Carlos', 'Rodr�guez', 3),
    (4, 'Ana', 'Mart�nez', 4),
    (5, 'Pedro', 'L�pez', 5),
    (6, 'Laura', 'Fern�ndez', 6),
    (7, 'Diego', 'G�mez', 7),
    (8, 'Sof�a', 'Hern�ndez', 8),
    (9, 'Andr�s', 'D�az', 9),
    (10, 'Valentina', 'Torres', 10);

SELECT *FROM Cliente

-- Tabla de Direccion
CREATE TABLE Direccion(
	ID_Direccion INT PRIMARY KEY,
	Ciudad VARCHAR(50),
	Provincia VARCHAR (50),
	CodigoPostal VARCHAR(50)
);

--Insertamos registros
INSERT INTO Direccion (ID_Direccion, Ciudad, Provincia, CodigoPostal)
VALUES
    (1, 'S�o Paulo', 'Brasil', '01234'),
    (2, 'Ciudad de M�xico', 'M�xico', '56789'),
    (3, 'Nueva York', 'Estados Unidos', '10001'),
    (4, 'Bogot�', 'Colombia', '12345'),
    (5, 'R�o de Janeiro', 'Brasil', '67890'),
    (6, 'Santiago', 'Chile', '23456'),
    (7, 'Los �ngeles', 'Estados Unidos', '34567'),
    (8, 'Buenos Aires', 'Argentina', '45678'),
    (9, 'Quito', 'Ecuador', '56789'),
    (10, 'Toronto', 'Canad�', '78901');

SELECT *FROM Direccion

-- Tabla de Productos
CREATE TABLE Producto (
	ID_Producto INT PRIMARY KEY,
	Nombre_Producto VARCHAR(50),
	Descripcion_Producto VARCHAR(100),
	Precio_Producto DECIMAL(10, 2),
	Cantidad_Producto INT
);

--Insertamos Datos

INSERT INTO Producto (ID_Producto, Nombre_Producto, Descripcion_Producto, Precio_Producto, Cantidad_Producto)
VALUES
    (1, 'Smartphone X', 'Tel�fono inteligente con c�mara de alta resoluci�n', 599.99, 50),
    (2, 'Tablet Y', 'Tableta con pantalla t�ctil de 10 pulgadas', 299.50, 30),
    (3, 'Laptop Z', 'Port�til ultradelgado con procesador i7', 1299.00, 20),
    (4, 'Smartwatch A', 'Reloj inteligente con seguimiento de actividad', 149.95, 100),
    (5, 'Auriculares B', 'Auriculares inal�mbricos con cancelaci�n de ruido', 199.99, 80),
    (6, 'C�mara C', 'C�mara digital con lente intercambiable', 799.00, 15),
    (7, 'Altavoz D', 'Altavoz Bluetooth resistente al agua', 79.99, 200),
    (8, 'Monitor E', 'Monitor de alta definici�n de 27 pulgadas', 349.50, 10),
    (9, 'Teclado F', 'Teclado mec�nico para jugadores', 129.95, 50),
    (10, 'Mouse G', 'Rat�n inal�mbrico ergon�mico', 49.99, 150);


-- Tabla de Ventas
CREATE TABLE Venta (
	ID_Venta INT PRIMARY KEY,
	ID_Cliente INT,
	ID_Producto INT,
	Cantidad_Venta INT,
	Fecha_Venta DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

--Insert Data
INSERT INTO Venta (ID_Venta, ID_Cliente, ID_Producto, Cantidad_Venta, Fecha_Venta)
VALUES
    (1, 2, 3, 10, '2024-04-07'),
    (2, 1, 5, 5, '2024-04-08'),
    (3, 3, 2, 8, '2024-04-09'),
    (4, 4, 1, 15, '2024-04-10'),
    (5, 5, 4, 3, '2024-04-11');

SELECT * FROM Venta