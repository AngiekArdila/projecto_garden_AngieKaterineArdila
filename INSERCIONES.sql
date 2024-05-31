-- Inserting data into gama_producto
INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES 
('Gama1', 'Descripción texto 1', 'Descripción HTML 1', 'imagen1.jpg'),
('Gama2', 'Descripción texto 2', 'Descripción HTML 2', 'imagen2.jpg'),
('Gama3', 'Descripción texto 3', 'Descripción HTML 3', 'imagen3.jpg'),
('Gama4', 'Descripción texto 4', 'Descripción HTML 4', 'imagen4.jpg'),
('Gama5', 'Descripción texto 5', 'Descripción HTML 5', 'imagen5.jpg'),
('Gama6', 'Descripción texto 6', 'Descripción HTML 6', 'imagen6.jpg'),
('Gama7', 'Descripción texto 7', 'Descripción HTML 7', 'imagen7.jpg'),
('Gama8', 'Descripción texto 8', 'Descripción HTML 8', 'imagen8.jpg'),
('Gama9', 'Descripción texto 9', 'Descripción HTML 9', 'imagen9.jpg'),
('Gama10', 'Descripción texto 10', 'Descripción HTML 10', 'imagen10.jpg');

-- Inserting data into estado_pedido
INSERT INTO estado_pedido (id_estado_pedido, estado) VALUES 
(1, 'Pendiente'),
(2, 'En proceso'),
(3, 'Enviado'),
(4, 'Entregado'),
(5, 'Cancelado'),
(6, 'Devuelto'),
(7, 'Reembolsado'),
(8, 'En espera'),
(9, 'Completado'),
(10, 'Fallido');

-- Inserting data into forma_pago
INSERT INTO forma_pago (id_forma_pago, tipo) VALUES 
(1, 'Tarjeta de crédito'),
(2, 'PayPal'),
(3, 'Transferencia bancaria'),
(4, 'Efectivo'),
(5, 'Cheque'),
(6, 'Apple Pay'),
(7, 'Google Pay'),
(8, 'Bitcoin'),
(9, 'Ethereum'),
(10, 'Ripple');


-- Inserting data into pais
INSERT INTO pais (id_pais, nombre) VALUES 
(1, 'Estados Unidos'),
(2, 'Canadá'),
(3, 'México'),
(4, 'Brasil'),
(5, 'Argentina'),
(6, 'Reino Unido'),
(7, 'Francia'),
(8, 'Alemania'),
(9, 'Italia'),
(10, 'España');

-- Inserting data into region
INSERT INTO region (id_region, nombre, id_pais) VALUES 
(1, 'California', 1),
(2, 'Ontario', 2),
(3, 'Yucatán', 3),
(4, 'São Paulo', 4),
(5, 'Buenos Aires', 5),
(6, 'Londres', 6),
(7, 'Île-de-France', 7),
(8, 'Baviera', 8),
(9, 'Lombardía', 9),
(10, 'Cataluña', 10);

-- Inserting data into ciudad
INSERT INTO ciudad (id_ciudad, nombre, id_pais, id_region) VALUES 
(1, 'Los Ángeles', 1, 1),
(2, 'Toronto', 2, 2),
(3, 'Mérida', 3, 3),
(4, 'São Paulo', 4, 4),
(5, 'Buenos Aires', 5, 5),
(6, 'Londres', 6, 6),
(7, 'París', 7, 7),
(8, 'Múnich', 8, 8),
(9, 'Milán', 9, 9),
(10, 'Barcelona', 10, 10);

-- Inserting data into producto
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES 
('P001', 'Producto 1', 'Gama1', '10x10x10', 'Proveedor 1', 'Descripción del producto 1', 100, 10.00, 5.00),
('P002', 'Producto 2', 'Gama2', '20x20x20', 'Proveedor 2', 'Descripción del producto 2', 200, 20.00, 10.00),
('P003', 'Producto 3', 'Gama3', '30x30x30', 'Proveedor 3', 'Descripción del producto 3', 300, 30.00, 15.00),
('P004', 'Producto 4', 'Gama4', '40x40x40', 'Proveedor 4', 'Descripción del producto 4', 400, 40.00, 20.00),
('P005', 'Producto 5', 'Gama5', '50x50x50', 'Proveedor 5', 'Descripción del producto 5', 500, 50.00, 25.00),
('P006', 'Producto 6', 'Gama6', '60x60x60', 'Proveedor 6', 'Descripción del producto 6', 600, 60.00, 30.00),
('P007', 'Producto 7', 'Gama7', '70x70x70', 'Proveedor 7', 'Descripción del producto 7', 700, 70.00, 35.00),
('P008', 'Producto 8', 'Gama8', '80x80x80', 'Proveedor 8', 'Descripción del producto 8', 800, 80.00, 40.00),
('P009', 'Producto 9', 'Gama9', '90x90x90', 'Proveedor 9', 'Descripción del producto 9', 900, 90.00, 45.00),
('P010', 'Producto 10', 'Gama10', '100x100x100', 'Proveedor 10', 'Descripción del producto 10', 1000, 100.00, 50.00);

-- Inserting data into oficina
INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, linea_direccion1, linea_direccion2) VALUES 
('OFC1', 1, 1, 1, '90001', 'Dirección 1', 'Dirección 2'),
('OFC2', 2, 2, 2, 'M5H 2N2', 'Dirección 3', 'Dirección 4'),
('OFC3', 3, 3, 3, '97000', 'Dirección 5', 'Dirección 6'),
('OFC4', 4, 4, 4, '01000-000', 'Dirección 7', 'Dirección 8'),
('OFC5', 5, 5, 5, '1000', 'Dirección 9', 'Dirección 10'),
('OFC6', 6, 6, 6, 'EC1A 1BB', 'Dirección 11', 'Dirección 12'),
('OFC7', 7, 7, 7, '75000', 'Dirección 13', 'Dirección 14'),
('OFC8', 8, 8, 8, '80331', 'Dirección 15', 'Dirección 16'),
('OFC9', 9, 9, 9, '20100', 'Dirección 17', 'Dirección 18'),
('OFC10', 10, 10, 10, '08001', 'Dirección 19', 'Dirección 20');

-- Inserting data into empleado
INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto, id_telefonoempleado) VALUES 
(1, 'John', 'Doe', 'Smith', 'EXT1', 'john.doe@example.com', 'OFC1', NULL, 'Manager', 1),
(2, 'Jane', 'Roe', 'Smith', 'EXT2', 'jane.roe@example.com', 'OFC2', 1, 'Sales', 2),
(3, 'Alice', 'Johnson', 'Brown', 'EXT3', 'alice.johnson@example.com', 'OFC3', 1, 'Support', 3),
(4, 'Bob', 'Smith', 'Jones', 'EXT4', 'bob.smith@example.com', 'OFC4', 2, 'Developer', 4),
(5, 'Charlie', 'Brown', 'Taylor', 'EXT5', 'charlie.brown@example.com', 'OFC5', 2, 'Designer', 5),
(6, 'Dave', 'Wilson', 'Davies', 'EXT6', 'dave.wilson@example.com', 'OFC6', 3, 'Analyst', 6),
(7, 'Eve', 'White', 'Evans', 'EXT7', 'eve.white@example.com', 'OFC7', 3, 'Consultant', 7),
(8, 'Frank', 'Taylor', 'Thomas', 'EXT8', 'frank.taylor@example.com', 'OFC8', 4, 'Engineer', 8),
(9, 'Grace', 'Lewis', 'Walker', 'EXT9', 'grace.lewis@example.com', 'OFC9', 4, 'HR', 9),
(10, 'Hank', 'Martin', 'Harris', 'EXT10', 'hank.martin@example.com', 'OFC10', 5, 'Marketing', 10);

-- Inserting data into telefonoempleado
INSERT INTO telefonoempleado (id_telefonoempleado, nombre, apellido1, apellido2, celular1, celular2, telefonofijo, codigo_empleado) VALUES 
(1, 'John', 'Doe', 'Smith', '1234567890', '0987654321', '1122334455', 1),
(2, 'Jane', 'Roe', 'Smith', '2234567890', '1987654321', '2122334455', 2),
(3, 'Alice', 'Johnson', 'Brown', '3234567890', '2987654321', '3122334455', 3),
(4, 'Bob', 'Smith', 'Jones', '4234567890', '3987654321', '4122334455', 4),
(5, 'Charlie', 'Brown', 'Taylor', '5234567890', '4987654321', '5122334455', 5),
(6, 'Dave', 'Wilson', 'Davies', '6234567890', '5987654321', '6122334455', 6),
(7, 'Eve', 'White', 'Evans', '7234567890', '6987654321', '7122334455', 7),
(8, 'Frank', 'Taylor', 'Thomas', '8234567890', '7987654321', '8122334455', 8),
(9, 'Grace', 'Lewis', 'Walker', '9234567890', '8987654321', '9122334455', 9),
(10, 'Hank', 'Martin', 'Harris', '1234567890', '9987654321', '1022334455', 10);

-- Inserting data into cliente
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES 
(1, 'Cliente 1', 'Contacto 1', 'Apellido 1', '5551111', 'Dirección 1', 'Dirección 2', 1, 1, 1, '90001', 1, 10000.00),
(2, 'Cliente 2', 'Contacto 2', 'Apellido 2', '5552222', 'Dirección 3', 'Dirección 4', 2, 2, 2, 'M5H 2N2', 2, 20000.00),
(3, 'Cliente 3', 'Contacto 3', 'Apellido 3', '5553333', 'Dirección 5', 'Dirección 6', 3, 3, 3, '97000', 3, 30000.00),
(4, 'Cliente 4', 'Contacto 4', 'Apellido 4', '5554444', 'Dirección 7', 'Dirección 8', 4, 4, 4, '01000-000', 4, 40000.00),
(5, 'Cliente 5', 'Contacto 5', 'Apellido 5', '5555555', 'Dirección 9', 'Dirección 10', 5, 5, 5, '1000', 5, 50000.00),
(6, 'Cliente 6', 'Contacto 6', 'Apellido 6', '5556666', 'Dirección 11', 'Dirección 12', 6, 6, 6, 'EC1A 1BB', 6, 60000.00),
(7, 'Cliente 7', 'Contacto 7', 'Apellido 7', '5557777', 'Dirección 13', 'Dirección 14', 7, 7, 7, '75000', 7, 70000.00),
(8, 'Cliente 8', 'Contacto 8', 'Apellido 8', '5558888', 'Dirección 15', 'Dirección 16', 8, 8, 8, '80331', 8, 80000.00),
(9, 'Cliente 9', 'Contacto 9', 'Apellido 9', '5559999', 'Dirección 17', 'Dirección 18', 9, 9, 9, '20100', 9, 90000.00),
(10, 'Cliente 10', 'Contacto 10', 'Apellido 10', '5550000', 'Dirección 19', 'Dirección 20', 10, 10, 10, '08001', 10, 100000.00);

-- Inserting data into pago
INSERT INTO pago (id_transaccion, codigo_cliente, forma_pago, fecha_pago, total) VALUES 
('T001', 1, 1, '2024-05-01', 100.00),
('T002', 2, 2, '2024-05-02', 200.00),
('T003', 3, 3, '2024-05-03', 300.00),
('T004', 4, 4, '2024-05-04', 400.00),
('T005', 5, 5, '2024-05-05', 500.00),
('T006', 6, 6, '2024-05-06', 600.00),
('T007', 7, 7, '2024-05-07', 700.00),
('T008', 8, 8, '2024-05-08', 800.00),
('T009', 9, 9, '2024-05-09', 900.00),
('T010', 10, 10, '2024-05-10', 1000.00);

-- Inserting data into pedido
INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_entrega, estado, comentario, codigo_cliente) VALUES 
(1, '2024-05-01', '2024-05-10', 1, 'Comentario 1', 1),
(2, '2024-05-02', '2024-05-11', 2, 'Comentario 2', 2),
(3, '2024-05-03', '2024-05-12', 3, 'Comentario 3', 3),
(4, '2024-05-04', '2024-05-13', 4, 'Comentario 4', 4),
(5, '2024-05-05', '2024-05-14', 5, 'Comentario 5', 5),
(6, '2024-05-06', '2024-05-15', 6, 'Comentario 6', 6),
(7, '2024-05-07', '2024-05-16', 7, 'Comentario 7', 7),
(8, '2024-05-08', '2024-05-17', 8, 'Comentario 8', 8),
(9, '2024-05-09', '2024-05-18', 9, 'Comentario 9', 9),
(10, '2024-05-10', '2024-05-19', 10, 'Comentario 10', 10);

-- Inserting data into detalle_pedido
INSERT INTO detalle_pedido (detalle_pedido, codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES 
(1, 1, 'P001', 10, 10.00, 1),
(2, 2, 'P002', 20, 20.00, 2),
(3, 3, 'P003', 30, 30.00, 3),
(4, 4, 'P004', 40, 40.00, 4),
(5, 5, 'P005', 50, 50.00, 5),
(6, 6, 'P006', 60, 60.00, 6),
(7, 7, 'P007', 70, 70.00, 7),
(8, 8, 'P008', 80, 80.00, 8),
(9, 9, 'P009', 90, 90.00, 9),
(10, 10, 'P010', 100, 100.00, 10);

-- Inserting data into proveedor
INSERT INTO proveedor (id_proveedor, nombre, apellido1, apellido2, email, codigo_oficina, codigo_producto) VALUES 
('PRV1', 'Proveedor 1', 'Apellido1', 'Apellido2', 'proveedor1@example.com', 'OFC1', 'P001'),
('PRV2', 'Proveedor 2', 'Apellido1', 'Apellido2', 'proveedor2@example.com', 'OFC2', 'P002'),
('PRV3', 'Proveedor 3', 'Apellido1', 'Apellido2', 'proveedor3@example.com', 'OFC3', 'P003'),
('PRV4', 'Proveedor 4', 'Apellido1', 'Apellido2', 'proveedor4@example.com', 'OFC4', 'P004'),
('PRV5', 'Proveedor 5', 'Apellido1', 'Apellido2', 'proveedor5@example.com', 'OFC5', 'P005'),
('PRV6', 'Proveedor 6', 'Apellido1', 'Apellido2', 'proveedor6@example.com', 'OFC6', 'P006'),
('PRV7', 'Proveedor 7', 'Apellido1', 'Apellido2', 'proveedor7@example.com', 'OFC7', 'P007'),
('PRV8', 'Proveedor 8', 'Apellido1', 'Apellido2', 'proveedor8@example.com', 'OFC8', 'P008'),
('PRV9', 'Proveedor 9', 'Apellido1', 'Apellido2', 'proveedor9@example.com', 'OFC9', 'P009'),
('PRV10', 'Proveedor 10', 'Apellido1', 'Apellido2', 'proveedor10@example.com', 'OFC10', 'P010');

-- Inserting data into jefe


-- Inserting data into telefonojefe
INSERT INTO telefonojefe (codigo_jefe, nombre, apellido1, apellido2, celular1, celular2, telefonofijo) VALUES 
(1, 'Jefe 1', 'Apellido1', 'Apellido2', '1234567890', '0987654321', '1122334455'),
(2, 'Jefe 2', 'Apellido1', 'Apellido2', '2234567890', '1987654321', '2122334455'),
(3, 'Jefe 3', 'Apellido1', 'Apellido2', '3234567890', '2987654321', '3122334455'),
(4, 'Jefe 4', 'Apellido1', 'Apellido2', '4234567890', '3987654321', '4122334455'),
(5, 'Jefe 5', 'Apellido1', 'Apellido2', '5234567890', '4987654321', '5122334455'),
(6, 'Jefe 6', 'Apellido1', 'Apellido2', '6234567890', '5987654321', '6122334455'),
(7, 'Jefe 7', 'Apellido1', 'Apellido2', '7234567890', '6987654321', '7122334455'),
(8, 'Jefe 8', 'Apellido1', 'Apellido2', '8234567890', '7987654321', '8122334455'),
(9, 'Jefe 9', 'Apellido1', 'Apellido2', '9234567890', '8987654321', '9122334455'),
(10, 'Jefe 10', 'Apellido1', 'Apellido2', '1234567890', '9987654321', '1022334455');

-- Inserting data into telefonocliente
INSERT INTO telefonocliente (id_telefonocliente, nombre, apellido1, apellido2, celular1, celular2, telefonofijo, codigo_cliente) VALUES 
(1, 'Cliente 1', 'Apellido1', 'Apellido2', '1234567890', '0987654321', '1122334455', 1),
(2, 'Cliente 2', 'Apellido1', 'Apellido2', '2234567890', '1987654321', '2122334455', 2),
(3, 'Cliente 3', 'Apellido1', 'Apellido2', '3234567890', '2987654321', '3122334455', 3),
(4, 'Cliente 4', 'Apellido1', 'Apellido2', '4234567890', '3987654321', '4122334455', 4),
(5, 'Cliente 5', 'Apellido1', 'Apellido2', '5234567890', '4987654321', '5122334455', 5),
(6, 'Cliente 6', 'Apellido1', 'Apellido2', '6234567890', '5987654321', '6122334455', 6),
(7, 'Cliente 7', 'Apellido1', 'Apellido2', '7234567890', '6987654321', '7122334455', 7),
(8, 'Cliente 8', 'Apellido1', 'Apellido2', '8234567890', '7987654321', '8122334455', 8),
(9, 'Cliente 9', 'Apellido1', 'Apellido2', '9234567890', '8987654321', '9122334455', 9),
(10, 'Cliente 10', 'Apellido1', 'Apellido2', '1234567890', '9987654321', '1022334455', 10);

-- Inserting data into telefonooficina
INSERT INTO telefonooficina (telefono, nombre, apellido1, apellido2, celular1, celular2, telefonofijo, codigo_oficina) VALUES 
(1, 'Oficina 1', 'Apellido1', 'Apellido2', '1234567890', '0987654321', '1122334455', 'OFC1'),
(2, 'Oficina 2', 'Apellido1', 'Apellido2', '2234567890', '1987654321', '2122334455', 'OFC2'),
(3, 'Oficina 3', 'Apellido1', 'Apellido2', '3234567890', '2987654321', '3122334455', 'OFC3'),
(4, 'Oficina 4', 'Apellido1', 'Apellido2', '4234567890', '3987654321', '4122334455', 'OFC4'),
(5, 'Oficina 5', 'Apellido1', 'Apellido2', '5234567890', '4987654321', '5122334455', 'OFC5'),
(6, 'Oficina 6', 'Apellido1', 'Apellido2', '6234567890', '5987654321', '6122334455', 'OFC6'),
(7, 'Oficina 7', 'Apellido1', 'Apellido2', '7234567890', '6987654321', '7122334455', 'OFC7'),
(8, 'Oficina 8', 'Apellido1', 'Apellido2', '8234567890', '7987654321', '8122334455', 'OFC8'),
(9, 'Oficina 9', 'Apellido1', 'Apellido2', '9234567890', '8987654321', '9122334455', 'OFC9'),
(10, 'Oficina 10', 'Apellido1', 'Apellido2', '1234567890', '9987654321', '1022334455', 'OFC10');
