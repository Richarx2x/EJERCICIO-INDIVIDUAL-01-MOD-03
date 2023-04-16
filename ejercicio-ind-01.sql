-- Seleccionamos la base de datos a la cual queremos visualizar todos sus registros
USE world;
SELECT * FROM countrylanguage;

-- Contamos la cantiadad de registros disponibles en la tabla city
SELECT COUNT(*) 
FROM city;

-- Contamos la cantidad de ciudades desde la tabla city
SELECT COUNT(Name) 
FROM city;

-- Contamos todas las ciudades de los paises de sudamérica, de la tabla country
SELECT SUM(Capital) AS TotalCiudades
FROM country
WHERE Continent = 'South America';

-- Contamos la cantidad de idiomas pertenecientes a los paises de sudamérica, de la tabla countrylanguge
SELECT COUNT(DISTINCT Language) as num_languages
FROM countrylanguage
WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'South America');

-- Creando una base de datos
CREATE DATABASE myproyectogo;
USE myproyectogo;

-- Agregando 3 tablas a la base de datos
CREATE TABLE OPERADORES (
  RUN VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  direccion VARCHAR(100),
  correo_electronico VARCHAR(100)
);
CREATE TABLE USUARIOS (
  id_coder INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  correo_electronico VARCHAR(100),
  telefono VARCHAR(20)
);
CREATE TABLE CAPACITACIÓN (
  codigo_curso INT PRIMARY KEY,
  nombre VARCHAR(100),
  horario VARCHAR(50)
);

-- Insertando datos a la base de datos
-- OPERADORES:
INSERT INTO OPERADORES (RUN, nombre, apellido, direccion, correo_electronico) VALUES 
('23476321-2', 'Juan', 'Marín', 'Av. Los Conquistadores 7000, Providencia', 'juan.marin@gmail.com'),
('14348907-3', 'Alberto', 'Ponce', 'Los Caracoles 345, Viña del Mar', 'a_ponce54@gmail.com'),
('12556789-1', 'Pedro', 'Masterco', 'Av. Peñablanca 560, Algarrobo', 'pedromas556@gmail.com'),
('10756709-4', 'Ana', 'Rodríguez', 'Av. Vicuña Mackenna 5678, Macul', 'ana.rodriguez@gmail.com'),
('15674223-5', 'Jorge', 'López', 'Calle San Diego 901, Santiago', 'jorge.lopez@gmail.com'),
('12343457-9', 'Carla', 'Torres', 'Av. Matta 1234, Santiago', 'carla.torres@hotmail.com'),
('11343565-9', 'José', 'Fernández', 'Av. Libertador Bernardo O’Higgins 246, Santiago', 'jose.fernandez@gmail.com'),
('17677451-8', 'Lucía', 'Gómez', 'Av. Kennedy 123, Vitacura', 'lucia.gomez45@gmail.com'),
('12321499-8', 'Manuel', 'Martínez', 'Calle Los Nogales 789, Providencia', 'manuel.martinez@gmail.com'),
('13988789-4', 'Sofía', 'Sánchez', 'Av. Tobalaba 456, Providencia', 's_sanchez34@yahoo.com');

-- USUARIOS:
INSERT INTO USUARIOS (id_coder, nombre, apellido, correo_electronico, telefono) VALUES
(1, 'Marcelo', 'González', 'marcelo.gonzalez@gmail.com', '+56987654321'),
(2, 'Fabiola', 'Muñoz', 'fabiola.munoz@gmail.com', '+56912345678'),
(3, 'Pablo', 'Martínez', 'pablo.martinez@gmail.com', '+56923456789'),
(4, 'Mónica', 'Pérez', 'monica.perez@gmail.com', '+56934567890'),
(5, 'Diego', 'Vargas', 'diego.vargas@hotmail.com', '+56945678901'),
(6, 'Valentina', 'Hernández', 'valentina.hernandez@gmail.com', '+56956789012'),
(7, 'Matías', 'Gómez', 'matias.gomez@gmail.com', '+56967890123'),
(8, 'Isabel', 'Fernández', 'isabel.fernandez@gmail.com', '+56978901234'),
(9, 'Andrés', 'Silva', 'andres.silva@hotmail.com', '+56989012345'),
(10, 'Camila', 'García', 'camila.garcia@gmail.com', '+56990123456');

-- CAPACITACIÓN
INSERT INTO CAPACITACIÓN (codigo_curso, nombre, horario) VALUES
('01', 'Programación Básica', 'Lunes y Miércoles de 18:00 a 20:00 hrs.'),
('02', 'Diseño Gráfico', 'Martes y Jueves de 09:00 a 11:00 hrs.'),
('03', 'Inglés técnico para aplicaciones', 'Lunes y Miércoles de 10:00 a 12:00 hrs.'),
('04', 'Gestión de Proyectos', 'Martes y Jueves de 16:00 a 18:00 hrs.'),
('05', 'Marketing Digital', 'Miércoles y Viernes de 14:00 a 16:00 hrs.'),
('06', 'Análisis de Datos', 'Lunes y Miércoles de 14:00 a 16:00 hrs.'),
('07', 'Diseño Web', 'Martes y Jueves de 18:00 a 20:00 hrs.'),
('08', 'Redes Sociales', 'Miércoles y Viernes de 10:00 a 12:00 hrs.'),
('09', 'Programación nivel medio', 'Lunes y Miércoles de 16:00 a 18:00 hrs.'),
('10', 'Programación avanzada', 'Martes y Jueves de 12:00 a 14:00 hrs.');

-- Test myproyectogo
SELECT * FROM OPERADORES;

-- Usando la base de datos "sakila"
USE sakila;
SELECT * FROM inventory;

-- CONTANDO LA CANTIDAD DE PELICULAS DE LA BASE DE DATOS:
SELECT COUNT(*) 
FROM film;

-- CONTANDO LA CANTIDAD DE CLIENTES DE LA BASE DE DATOS:
SELECT COUNT(*) 
FROM customer;

-- BUSCANDO LA PELÍCULA MÁS ARRENDADA
SELECT f.title, COUNT(*) as rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY rentals DESC;