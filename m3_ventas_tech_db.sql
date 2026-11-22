-- Sección 0: CREATE DATABASE
-- Creamos la base de datos y luego la seleccionamos
-- El código queda en formato comentario para que no dispare errores
-- CREATE DATABASE Ventas_Tech_DB;
-- USE Ventas_Tech_DB;


-- Sección 1: DROP TABLES
-- Eliminamos las tablas que vamos a crear en caso de que existan previamente
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS territorios;
DROP TABLE IF EXISTS canales;
DROP TABLE IF EXISTS medios;


-- Sección 2: CREATE TABLES
-- Creamos en orden las tablas: categorias, clientes, productos y ventas
CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY,
	nombre_categoria VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200)
);


CREATE TABLE territorios( -- Agregado para la pre-entrega del M5 en base al DER del M2
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50),
    pais VARCHAR(50),
    zona VARCHAR(50)
);


CREATE TABLE medios( -- mismo agregado
    id_medio_pago INT PRIMARY KEY,
    medio_pago VARCHAR(50)
);


CREATE TABLE canales( -- mismo agregado
    id_canal INT PRIMARY KEY,
    canal VARCHAR(50)
);


CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	ciudad VARCHAR(50),
	fecha_registro DATE NOT NULL,
    fecha_nacimiento DATE NOT NULL -- mismo agregado
);


CREATE TABLE productos(
    id_producto INT PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
	id_categoria INT 
        FOREIGN KEY REFERENCES categorias(id_categoria),
    costo DECIMAL(10,2), -- mismo agregado
	precio DECIMAL(10,2) NOT NULL,
	stock INT DEFAULT 0,
    descripcion TEXT, -- mismo agregado
	activo BIT DEFAULT 1
);


CREATE TABLE ventas(
    id_venta INT PRIMARY KEY,
	id_cliente INT 
        FOREIGN KEY REFERENCES clientes(id_cliente),
	id_producto INT 
        FOREIGN KEY REFERENCES productos(id_producto),
    id_territorio INT -- mismo agregado
        FOREIGN KEY REFERENCES territorios(id_territorio),
	id_canal INT -- ...
        FOREIGN KEY REFERENCES canales(id_canal),
    id_medio_pago INT -- ...
        FOREIGN KEY REFERENCES medios(id_medio_pago),
    cantidad INT NOT NULL,
	precio_unitario DECIMAL(10,2) NOT NULL,
	fecha_venta DATE NOT NULL
	);

-- Sección 3: INSERT DATA
-- Cargamos los registros en las tablas en orden: categorias, clientes, productos y ventas
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
    (1, 'Computación',    'Laptops, PCs y monitores'),
    (2, 'Accesorios',     'Periféricos y complementos'),
    (3, 'Audio',          'Auriculares y parlantes'),
    (4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO territorios (id_territorio, region, pais, zona) VALUES
    (1, 'Sudamérica', 'Argentina', 'Centro'),
    (2, 'Súdamérica', 'Argentina', 'Norte'),
    (3, 'Sudámerica', 'Brasil', 'Sur');

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro, fecha_nacimiento) VALUES
    (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05', '2000-01-01'),
    (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10', '1950-10-23'),
    (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01', '1970-02-07'),
    (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15', '1995-09-29'),
    (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01', '2005-06-26');

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, descripcion, activo) VALUES
    (1, 'Laptop Pro 15',      1, 1200.00, 15, 'Laptop de última generación',1),
    (2, 'Mouse Inalámbrico',  2,   28.00, 80, 'Modelo tipo gamer blanco con luces',1),
    (3, 'Monitor 4K 27',      1,  450.00, 12, 'Ultraliviano',1),
    (4, 'Auriculares BT Pro', 3,  120.00, 35, 'Calidad de sonido de alta gama',1),
    (5, 'SSD Externo 1TB',    4,  130.00, 18, 'Dispositivo de almacenamiento',1),
    (6, 'Teclado Mecánico',   2,   95.00, 40, 'Modelo clasico negro',1);

INSERT INTO ventas (id_venta, id_cliente, id_producto, id_territorio,cantidad, precio_unitario, fecha_venta) VALUES
    ( 1, 1, 1, 1, 2, 1200.00, '2024-03-05'),
    ( 2, 2, 2, 2, 5,   28.00, '2024-03-06'),
    ( 3, 3, 3, 3, 1,  450.00, '2024-03-07'),
    ( 4, 1, 4, 1, 2,  120.00, '2024-03-08'),
    ( 5, 4, 5, 1, 3,  130.00, '2024-03-10'),
    ( 6, 2, 6, 2, 4,   95.00, '2024-03-11'),
    ( 7, 5, 1, 3, 1, 1200.00, '2024-03-12'),
    ( 8, 3, 2, 3, 8,   28.00, '2024-03-13'),
    ( 9, 4, 4, 3, 1,  120.00, '2024-03-14'),
    (10, 5, 3, 3, 2,  450.00, '2024-03-15');


-- Sección 4: VALIDACIÓN
-- Verificamos que los registros se hayan cargado
SELECT * FROM categorias;   -- esperado: 4 filas
SELECT * FROM clientes;     -- esperado: 5 filas
SELECT * FROM productos;    -- esperado: 6 filas
SELECT * FROM ventas;       -- esperado: 10 filas
