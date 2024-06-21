DROP DATABASE IF EXISTS ModistaDB;
CREATE DATABASE IF NOT EXISTS ModistaDB;

USE ModistaDB;

CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATE,
    fecha_entrega DATE,
    estado_pedido VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(12, 3)
);

CREATE TABLE Detalle_Pedido (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(12, 3),
    senha DECIMAL(12, 3),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

CREATE TABLE Medidas (
    medida_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_medicion DATE,
    contorno_pecho DECIMAL(12, 1),
    cintura DECIMAL(12, 1),
    cadera DECIMAL(12, 1),
    largo_remera DECIMAL(12, 1),
    largo_pantalon DECIMAL(12, 1),
    largo_manga DECIMAL(12, 1),
    largo_vestido DECIMAL(12, 1),
    talle_delantero DECIMAL(12, 1),
    sisa DECIMAL(12, 1),
    tiro DECIMAL(12, 1),
    hombro DECIMAL(12, 1),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

INSERT INTO Clientes (nombre, apellido, telefono)
VALUES 
    ('Sofia', 'Ramirez', '2239842653'),
	('Ana', 'Gómez', '2234891816'),
	('Luis', 'Martínez', '2234654900'),
	('María', 'López', '2235194675'),
    ('Flor ', 'Einstein', '2234972895'),
    ('Ivana', 'Rios', '2234972896'),
    ('Daniela', 'Santamaria', '2236830633'),
    ('Eugenia', 'Bersano', '2235182311'),
    ('Marina', 'paso', '2235188522'),
    ('federico', 'Dalessandro', '2236156379');
    
    
INSERT INTO Pedidos (cliente_id, fecha_pedido, fecha_entrega, estado_pedido)
VALUES 
	(1, '2024-01-01', '2024-01-15', 'Entregado'),
	(2, '2024-02-15', '2024-02-29', 'Entregado'),
	(3, '2024-03-20', '2024-03-30', 'Entregado'),
	(4, '2024-04-10', '2024-04-20', 'Entregado'),
    (5, '2024-04-20', '2024-05-10', 'Entregado'),
    (6, '2024-04-21', '2024-05-15', 'Entregado'),
    (7, '2024-04-22', '2024-05-12', 'Entregado'),
    (8, '2024-05-07', '2024-05-20', 'Entregado'),
    (9, '2024-05-15', '2024-05-30', 'Pendiente'),
    (10,'2024-05-19', '2024-06-10', 'Pendiente');
  
    


INSERT INTO Productos (nombre, descripcion, precio)
VALUES 
	('Camisa', 'Camisa en percal', 25.000),
	('Joguins deportivo', 'Tela friza azul', 10.000),
	('Vestido', 'Vestido largo con manga 3/4', 40.000),
	('Falda', 'Falda plisada negra y blanco', 20.000),
    ('Disfraz Tortu Ninja', 'En color naranja', 15.000),
    ('Disfraz cenincienta', 'Disfraz en raso y Acetato', 13.000),
    ('Disfraz Power Ranger', 'Disfraz en color rosa', 15.000),
    ('Disfraz Pirata', 'Disfraz de Santiago Of The Seas para 2 años', 15.000),
    ('Disfraz Sonic', 'para 5 años, Hacerlo con 2 mascaras- una estampada y la otra en 3D', 18.000),
	('Disfraz Vampirina', 'para 5 años', 12.000);
    


INSERT INTO Detalle_Pedido (pedido_id, producto_id, cantidad, precio_unitario, senha)
VALUES 
	
	(1, 1, 1, 25.000, 15.000),
	(2, 2, 1, 10.000, 5.000),
	(3, 3, 1, 40.000, 20.000),
	(4, 4, 1, 20.000, 10.000),
    (5, 5, 1, 15.000, 7.500),
    (6, 6, 1, 13.000, 6.500), 
    (7, 7, 1, 15.000, 7.500), 
	(8, 8, 1, 15.000, 7.500),
	(9, 9, 1, 18.000, 9.000),
    (10, 10, 1, 12.000, 6.000);
    
INSERT INTO Medidas (cliente_id, fecha_medicion, contorno_pecho, cintura, cadera, largo_remera, largo_pantalon, 
largo_manga, largo_vestido, talle_delantero, sisa, tiro, hombro) VALUES 
(1, '2024-01-01', 90.0, 70.5, 95.0, 65.0, 100.0, 60.0, 90.0, 40.0, 20.0, 25.0, 15.0),
(2, '2024-02-18', 85.0, 65.0, 90.0, 60.0, 95.0, 55.0, 85.0, 38.0, 19.0, 24.0, 14.0),
(3, '2024-03-20', 95.0, 75.0, 100.0, 70.0, 105.0, 65.0, 95.0, 42.0, 21.0, 26.0, 16.0),
(4, '2024-04-12', 88.0, 68.0, 93.0, 63.0, 98.0, 58.0, 88.0, 39.0, 19.5, 24.5, 14.5),
(5, '2024-04-20', 55.0, 52.0, 55.0, 40.0, 52.0, 38.0, 0.0, 0.0, 30.0, 23.0, 6.0),
(6, '2024-04-21', 57.0, 59.0, 63.0, 0.0, 0.0, 14.0, 57.0, 24.0, 30.0, 0.0, 6.0),
(7, '2024-04-25', 60.0, 53.0, 58.0, 40.0, 55.0, 39.0, 0.0, 45.0, 31.0, 23.0, 6.0),
(8, '2024-05-08', 57.0, 52.0, 55.0, 24.0, 42.0, 24.0, 0.0, 0.0, 25.0, 20.0, 5.0),
(9, '2024-05-17', 60.0, 55.0, 60.0, 38.0, 50.0, 38.0, 0.0, 0.0, 30.0, 23.0, 6.0),
(10,'2024-05-20', 64.0, 0.0, 00.0, 00.0, 00.0, 00.0, 14.0, 53.0, 00.0, 0.0, 6.0);

select * from Clientes;
select * from Pedidos;
select * from Productos;
select * from Medidas;



/* ##################################
           VISTAS
######################################*/

-- 1 clientes
DROP VIEW IF EXISTS Clientes_Pedidos;
CREATE VIEW Clientes_Pedidos AS
SELECT C.cliente_id, CONCAT(C.nombre,' ', C.apellido) AS "Nombre y Apellido", C.telefono, 
P.fecha_pedido AS "Fecha del pedido", Pr.nombre as "Nombre del Producto"
FROM Clientes C
JOIN Pedidos P ON C.cliente_id = P.cliente_id 
JOIN Productos Pr on P.cliente_id = producto_id;

SELECT * FROM Clientes_Pedidos;


-- 2 detalle de los productos

DROP VIEW IF EXISTS  Detalle_Productos;
CREATE VIEW Detalle_Productos AS
SELECT C.cliente_id, CONCAT(C.nombre,' ', C.apellido) as "Nombre y Apellido", P.fecha_entrega AS "Fecha de entrega", 
Pr.nombre AS "Nombre del Producto", Pr.descripcion AS "Descripcion del producto", D.cantidad
FROM Clientes C
JOIN Pedidos P ON C.cliente_id = P.cliente_id
JOIN Detalle_Pedido D ON P.pedido_id = D.pedido_id
JOIN Productos Pr ON D.producto_id = Pr.producto_id;

SELECT * FROM Detalle_Productos;



-- 3: Obtener las medidas de los clientes

DROP VIEW IF EXISTS Clientes_Medidas;
CREATE VIEW Clientes_Medidas AS
SELECT CONCAT(C.nombre,' ', C.apellido) as "Nombre y Apellido", 
M.fecha_medicion, M.contorno_pecho, M.cintura, M.cadera, M.largo_remera, 
M.largo_pantalon, M.largo_manga, M.largo_vestido, M.talle_delantero, M.sisa, M.tiro, M.hombro
FROM Medidas M
JOIN Clientes C ON M.cliente_id = C.cliente_id;

SELECT * FROM Clientes_Medidas;



-- 4: obtener el estado de los pedidos

DROP VIEW IF EXISTS Estado_Pedidos;
CREATE VIEW Estado_Pedidos AS
SELECT CONCAT(C.nombre,' ', C.apellido) as "Nombre y Apellido", p.fecha_entrega, p.estado_pedido AS "Estado del pedido"
FROM Clientes c
INNER JOIN Pedidos p ON c.cliente_id = p.cliente_id;

SELECT * FROM Estado_Pedidos;



/* ##################################
           FUNCION 
######################################*/

-- 1ra funcion(obtener el precio final de cada producto, teniendo en cuenta la seña que se pago)
DROP FUNCTION IF EXISTS calcularPrecioFinal;
DELIMITER //
CREATE FUNCTION calcularPrecioFinal(pedidoId INT, productoId INT) 
RETURNS DECIMAL(12, 3)
DETERMINISTIC
BEGIN
    DECLARE precioFinal DECIMAL(12, 3);
    DECLARE precioTotal DECIMAL(12, 3);
    DECLARE seña DECIMAL(12, 3);

    SELECT (cantidad * precio_unitario), senha INTO precioTotal, seña
    FROM Detalle_Pedido
    WHERE pedido_id = pedidoId AND producto_id = productoid;

    SET precioFinal = precioTotal - seña;
    RETURN precioFinal; 
END //
DELIMITER ;

-- SELECT calcularPrecioFinal(2,2) AS "Precio Final a Pagar";
SELECT p.nombre AS producto,dp.senha AS Seña, dp.precio_unitario,calcularPrecioFinal(3,3) AS "Precio Final a Pagar"
FROM Detalle_Pedido dp
JOIN Productos p ON dp.producto_id = p.producto_id
WHERE dp.pedido_id = 3;
-- -------------------------------------------------

-- 2DA fUNCION
DROP FUNCTION IF EXISTS esPedidoPendiente;
DELIMITER //
CREATE FUNCTION esPedidoPendiente(pedidoId INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE esPendiente BOOLEAN;

    SELECT IF(estado_pedido = 'Pendiente', 1, 0) INTO esPendiente
    FROM Pedidos
    WHERE pedido_id = pedidoId;

    RETURN esPendiente; 
END //

DELIMITER ;
SELECT * FROM pedidos;
SELECT esPedidoPendiente(8);-- devuelve 0 si es falso 
-- ------------------------------------------------------


-- 3RA FUNCION(obtener el nombre completo del cliente + el nombre del prodcuto)
DROP FUNCTION IF EXISTS obtenerNombreCliente;
DELIMITER //
CREATE FUNCTION obtenerNombreCliente(clienteId INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE nombreCompleto VARCHAR(101);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombreCompleto
    FROM Clientes
    WHERE cliente_id = clienteId;

    RETURN nombreCompleto; 
END //
DELIMITER ;

SELECT obtenerNombreCliente(11) AS "Nombre Completo" ;



/* ##################################
          PROCEDIMIENTOS
######################################*/

-- 1er SP (Actualizar número de contacto del cliente)
DELIMITER //
CREATE PROCEDURE actualizarContactoCliente(IN clienteId INT, IN nuevoTelefono VARCHAR(15))
BEGIN
    UPDATE Clientes
    SET telefono = nuevoTelefono
    WHERE cliente_id = clienteId;
END //
DELIMITER ;
SELECT * FROM clientes;
CALL actualizarContactoCliente(3, 2231252144);
-- --------------------------------------------

-- 2do SP (Actualizar el estado de un pedido)
DROP PROCEDURE IF EXISTS actualizarEstadoPedido;
DELIMITER //
CREATE PROCEDURE actualizarEstadoPedido (IN p_pedidoId INT,IN p_estadoPedido VARCHAR(50))
BEGIN
    UPDATE Pedidos
    SET estado_pedido = p_estadoPedido
    WHERE pedido_id = p_pedidoId;
END//
DELIMITER ;

SELECT * FROM pedidos;
CALL actualizarEstadoPedido(9,"Entregado");
-- ------------------------------------------

-- 3er SP (agregar un cliente)

DROP PROCEDURE IF EXISTS agregarCliente;
DELIMITER //
CREATE PROCEDURE agregarCliente (IN c_nombre VARCHAR(50),IN c_apellido VARCHAR(50),IN c_telefono VARCHAR(15))
BEGIN
    INSERT INTO Clientes (nombre, apellido, telefono)
    VALUES (c_nombre, c_apellido, c_telefono);
END //
DELIMITER ;

 CALL agregarCliente("Gloria","Apaza", 2233540555);
SELECT *FROM clientes;


/*
DROP PROCEDURE IF EXISTS agregarPedido;
DELIMITER //
CREATE PROCEDURE agregarPedido(IN clienteId INT,IN fechaPedido DATE,IN fechaEntrega DATE,IN estadoPedido VARCHAR(50))
BEGIN
    INSERT INTO Pedidos (cliente_id, fecha_pedido, fecha_entrega, estado_pedido)
    VALUES (clienteId, fechaPedido, fechaEntrega, estadoPedido);
END //
DELIMITER ;

CALL agregarPedido();
-- -------------------------

-- Agregar producto
DROP PROCEDURE IF EXISTS agregarProducto;
DELIMITER //
CREATE PROCEDURE agregarProducto(IN nombre VARCHAR(100),IN descripcion TEXT,IN precio DECIMAL(12, 3))
BEGIN
    INSERT INTO Productos (nombre, descripcion, precio)
    VALUES (nombre, descripcion, precio);
END //
DELIMITER ;
CALL agregarProducto();
-- -----------------------------------------------------

-- Agregar detalle_pedido
DROP PROCEDURE IF EXISTS agregarDetallePedido;
DELIMITER //
CREATE PROCEDURE agregarDetallePedido(IN pedidoId INT,IN productoId INT,IN cantidad INT,
    IN precioUnitario DECIMAL(12, 3),IN seña DECIMAL(12, 3)
)
BEGIN
    INSERT INTO Detalle_Pedido (pedido_id, producto_id, cantidad, precio_unitario, senha)
    VALUES (pedidoId, productoId, cantidad, precioUnitario, seña);
    CALL actualizarTotalPedido(pedidoId);
END //
DELIMITER ;
CALL agregarDetallePedido();
*/
-- -------------------------------------------------------------

-- Agregar medidas
DROP PROCEDURE IF EXISTS agregarMedidasCliente;
DELIMITER //
CREATE PROCEDURE agregarMedidasCliente(IN clienteId INT,IN fechaMedicion DATE,IN contornoPecho DECIMAL(12, 1),IN cintura DECIMAL(12, 1),
    IN cadera DECIMAL(12, 1),IN largoRemera DECIMAL(12, 1),IN largoPantalon DECIMAL(12, 1),IN largoManga DECIMAL(12, 1),
    IN largoVestido DECIMAL(12, 1),IN talleDelantero DECIMAL(12, 1),IN sisa DECIMAL(12, 1),IN tiro DECIMAL(12, 1),
    IN hombro DECIMAL(12, 1))
    
BEGIN
    INSERT INTO Medidas (cliente_id, fecha_medicion, contorno_pecho, cintura, cadera, largo_remera, largo_pantalon, 
				largo_manga, largo_vestido, talle_delantero, sisa, tiro, hombro) 
	VALUES (clienteId, fechaMedicion, contornoPecho, cintura, cadera, largoRemera, largoPantalon, largoManga, 
			largoVestido, talleDelantero, sisa, tiro, hombro);
END //
DELIMITER ;
-- -------------------------------------------------------------





/* ##################################
           TRIGGERS
######################################*/

-- 1er Trigger 
DROP TRIGGER IF EXISTS evitarEliminacionCliente;
DELIMITER // 
CREATE TRIGGER evitarEliminacionCliente
BEFORE DELETE ON Clientes
FOR EACH ROW
BEGIN
    DECLARE num_pedidos INT;
    SELECT COUNT(*) INTO num_pedidos
    FROM Pedidos
    WHERE cliente_id = OLD.cliente_id AND estado_pedido = 'Pendiente';
    IF num_pedidos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el cliente porque tiene pedidos pendientes.';
    END IF;
END//
DELIMITER ;

/*
SELECT * FROM pedidos;
DELETE FROM Clientes
WHERE cliente_id = 10;
-- -----------------------------
*/


-- 2DO Tigger

CREATE TABLE HistoricoClientes (
    historico_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_registro DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


DROP TRIGGER IF EXISTS registroNuevosClientes;
DELIMITER //
CREATE TRIGGER registroNuevosClientes
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO HistoricoClientes (cliente_id, fecha_registro)
    VALUES (NEW.cliente_id, NOW());
END//
DELIMITER ;

CALL agregarCliente("Edgar","Cisneros", 2232598731);
SELECT * FROM HistoricoClientes;



-- 3er Trigger (es para no introducir datos negativos)
DROP TRIGGER IF EXISTS validacionMedidas;
DELIMITER //
CREATE TRIGGER validacionMedidas
BEFORE INSERT ON Medidas
FOR EACH ROW
BEGIN
    IF NEW.contorno_pecho < 0 OR NEW.cintura < 0 OR NEW.cadera < 0 OR NEW.largo_remera < 0 OR NEW.largo_pantalon < 0 OR NEW.largo_manga 
    < 0 OR NEW.largo_vestido < 0 OR NEW.talle_delantero < 0 OR NEW.sisa < 0 OR NEW.tiro  < 0 OR NEW.hombro  < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Las medidas no pueden ser negativas';
    END IF;
END//
DELIMITER ;

select * from Medidas;
CALL agregarMedidasCliente(12, '2024-06-19', -100.5, 70.0, 95.0, 65.0, 100.0, 60.0, 130.0, 40.0, 20.0, 25.0, 45.0);


