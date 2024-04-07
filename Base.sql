-- Creación de la base de datos "Base"
CREATE DATABASE Base;
USE Base;

-- Tabla "Empleados"
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Departamento VARCHAR(50)
);

INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Departamento)
VALUES
    (1, 'Juan', 'Pérez', 'Ventas'),
    (2, 'María', 'García', 'Ventas'),
    (3, 'Pedro', 'Rodríguez', 'Marketing'),
    (4, 'Ana', 'Martínez', 'Contabilidad'),
    (5, 'Luis', 'Gómez', 'Recursos Humanos');

-- Tabla "Proyectos"
CREATE TABLE Proyectos (
    ProyectoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion VARCHAR(100),
    Departamento VARCHAR(50)
);

INSERT INTO Proyectos (ProyectoID, Nombre, Descripcion, Departamento)
VALUES
    (1, 'Proyecto A', 'Campaña publicitaria', 'Marketing'),
    (2, 'Proyecto B', 'Rediseño de la página web', 'Marketing'),
    (3, 'Proyecto C', 'Nuevo plan de ventas', 'Ventas'),
    (4, 'Proyecto D', 'Actualización del sistema contable', 'Contabilidad');

-- Tabla "AsignacionesProyectos"
CREATE TABLE AsignacionesProyectos (
    AsignacionID INT PRIMARY KEY,
    EmpleadoID INT,
    ProyectoID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
);

INSERT INTO AsignacionesProyectos (AsignacionID, EmpleadoID, ProyectoID)
VALUES
    (1, 1, 3),
    (2, 2, 3),
    (3, 3, 1),
    (4, 3, 2),
    (5, 4, 4);