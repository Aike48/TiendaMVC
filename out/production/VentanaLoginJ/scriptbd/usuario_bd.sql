CREATE DATABASE IF NOT EXISTS `usuario_bd`;
USE `usuario_bd`;

-- Tabla de roles
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(2) AUTO_INCREMENTL,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insertar roles
INSERT INTO `rol` (nombre_rol) VALUES
('Administrador'),
('Secretaria'),
('Usuario Regular');

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS `usuario` (
  `documento` varchar(5) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `profesion` varchar(200) NOT NULL,
  `edad` int(3) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `rol` int(2) NOT NULL,
  `estado` ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`documento`),
  FOREIGN KEY (`rol`) REFERENCES `rol`(`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insertar usuarios
INSERT INTO `usuario` (documento, nombre, profesion, edad, direccion, telefono, rol, estado) VALUES
('admin', 'Administrador', '', 0, '', '', 1, 'activo'),
('12345', 'Carlos Perez', 'Ingeniero', 35, 'Calle 123', '3001234567', 3, 'activo'),
('23456', 'Ana Gomez', 'Doctora', 28, 'Carrera 45', '3007654321', 2, 'activo'),
('34567', 'Luis Mendoza', 'Contador', 40, 'Avenida 67', '3123456789', 3, 'activo'),
('45678', 'Paola Rodriguez', 'Abogada', 30, 'Calle 10', '3145678901', 2, 'activo'),
('56789', 'Sofia López', 'Programadora', 27, 'Carrera 12', '3109876543', 3, 'activo'),
('67890', 'Javier Torres', 'Diseñador', 33, 'Calle 11', '3201234567', 3, 'inactivo'),
('78901', 'Clara Martínez', 'Arquitecta', 29, 'Calle 22', '3007654322', 2, 'inactivo'),
('89012', 'Ricardo Gómez', 'Médico', 45, 'Carrera 34', '3009876543', 1, 'inactivo');

-- Tabla de productos
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10, 2) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insertar productos
INSERT INTO `producto` (nombre_producto, descripcion, precio, stock) VALUES
('Laptop Lenovo', 'Laptop de 14 pulgadas con 8GB RAM y 256GB SSD', 2000.00, 15),
('Mouse Logitech', 'Mouse inalámbrico óptico', 20.00, 100),
('Teclado Mecánico', 'Teclado mecánico RGB con switches rojos', 50.00, 50),
('Monitor Samsung', 'Monitor de 24 pulgadas Full HD', 150.00, 30),
('Auriculares Sony', 'Auriculares inalámbricos con cancelación de ruido', 100.00, 25),
('Impresora HP', 'Impresora multifunción con Wi-Fi', 180.00, 10),
('Silla Ergonómica', 'Silla de oficina ergonómica ajustable', 120.00, 20),
('Cámara Canon', 'Cámara DSLR con lente 18-55mm', 600.00, 8),
('Tablet Samsung', 'Tablet de 10 pulgadas con 64GB de almacenamiento', 300.00, 40),
('Disco Duro Externo', 'Disco duro externo de 1TB', 70.00, 60);

-- Tabla de compras
CREATE TABLE IF NOT EXISTS `compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `documento_usuario` varchar(5) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`),
  FOREIGN KEY (`documento_usuario`) REFERENCES `usuario`(`documento`) ON DELETE CASCADE,
  FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insertar compras
INSERT INTO `compra` (documento_usuario, id_producto, fecha_compra, cantidad) VALUES
('12345', 1, '2024-10-01', 1),
('23456', 2, '2024-10-02', 2),
('34567', 3, '2024-10-03', 1),
('45678', 4, '2024-10-04', 1),
('56789', 5, '2024-10-05', 1),
('12345', 6, '2024-10-06', 1),
('23456', 7, '2024-10-07', 1);
