CREATE DATABASE TiendaPractica;
GO

CREATE TABLE Clientes(

id_cliente int IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
ciudad VARCHAR(50) NOT NULL,
categoria VARCHAR(50) NOT NULL
);

GO

-- Creamos la tabla de Pedidos (Entidad débil, relacionada con Clientes mediante llave foránea)
CREATE TABLE Pedidos (
id_pedido INT IDENTITY(1,1) PRIMARY KEY,
id_cliente INT NOT NULL,
fecha DATE NOT NULL,
monto DECIMAL(10,2) NOT NULL,
CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (id_cliente)
REFERENCES Clientes(id_cliente)
);
GO
-- Insertamos registros en la tabla Clientes
INSERT INTO Clientes (nombre, ciudad, categoria) VALUES
('Juan Pérez', 'Hermosillo', 'VIP'),
('María López', 'Navojoa', 'Regular'),
('Carlos Mendoza', 'Hermosillo', 'Regular'),
('Ana Silva', 'Guaymas', 'VIP'),
('Luis Gómez', 'Navojoa', 'VIP');
GO
-- Insertamos registros en la tabla Pedidos (vinculados a los id_cliente del 1 al 5)
INSERT INTO Pedidos (id_cliente, fecha, monto) VALUES
(1, '2026-08-01', 1500.00),(1, '2026-08-05', 750.50),
(2, '2026-08-02', 2300.00),
(3, '2026-08-03', 450.00),
(4, '2026-08-04', 3100.20),
(5, '2026-08-06', 1200.00),
(2, '2026-08-07', 900.00);
GO

-- El asterisco (*) actúa como comodín para mostrar todas las columnas de la tabla.
SELECT *FROM Clientes;
GO

-- Consulta 1.2: Proyección específica (solo nombre y ciudad de cada cliente)
-- En el desarrollo real es mejor listar solo las columnas necesarias para optimizar memoria.
SELECT nombre, ciudad FROM Clientes;
GO

-- Consulta 2.1: Obtener clientes que vivan en 'Hermosillo'
SELECT nombre, ciudad, categoria
FROM Clientes
WHERE ciudad = 'Hermosillo';
GO
-- Consulta 2.2: Obtener pedidos cuyo monto sea mayor o igual a $1,000.00 pesos
SELECT id_pedido, monto
FROM Pedidos
WHERE monto >= 1000.00;
GO

-- Nota: La operación aritmética no altera ni modifica permanentemente los datos en la tabla.
SELECT id_pedido,
monto AS monto_original,
(monto * 0.16) AS iva_calculado,
(monto * 1.16) AS monto_total_con_iva
FROM Pedidos;
GO


-- Consulta 4.1: Mostrar los pedidos ordenados de mayor a menor monto (Descendente: DESC)
SELECT id_pedido, fecha, monto
FROM Pedidos
ORDER BY monto DESC;
GO
-- Consulta 4.2: Listar los clientes ordenados alfabéticamente por ciudad y luego por nombre
SELECT ciudad, nombre
FROM Clientes
ORDER BY ciudad ASC, nombre ASC;
GO

