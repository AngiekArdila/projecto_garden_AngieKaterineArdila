CREATE DATABASE garden1;
USE garden1;

CREATE TABLE gama_producto(
gama VARCHAR(50) NOT NULL,
descripcion_texto TEXT,
descripcion_html TEXT,
imagen VARCHAR(256),
PRIMARY KEY(gama)
);
 CREATE TABLE estado_pedido(
	 id_estado_pedido INT(11) NOT NULL,
	 estado VARCHAR(50),
	 PRIMARY KEY (id_estado_pedido)
 );
CREATE TABLE forma_pago(
	id_forma_pago INT(11) NOT NULL,
	tipo VARCHAR(50),
	PRIMARY KEY(id_forma_pago)
);
CREATE TABLE jefe(

	codigo_jefe INT(11),
	
	nombre VARCHAR(50),
	
	apellido1 VARCHAR(50),
	
	apellido2 VARCHAR(50),
	
	id_telefonojefe INT(11),
	
	PRIMARY KEY (codigo_jefe)

);
CREATE TABLE pais(
	id_pais INT(11) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (id_pais)
);

CREATE TABLE region(
	id_region INT(11) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	id_pais INT,

	PRIMARY KEY (id_region),
	CONSTRAINT FK_pais_region FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE ciudad(
	id_ciudad INT(11) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	id_pais INT,
	id_region INT,
	PRIMARY KEY(id_ciudad),
	
	CONSTRAINT FK_pais_cuidad FOREIGN KEY (id_pais) REFERENCES pais(id_pais),
	CONSTRAINT FK_region_ciudad FOREIGN KEY (id_region) REFERENCES region(id_region)
);


CREATE TABLE producto(
codigo_producto VARCHAR(15) NOT NULL,
nombre VARCHAR(70) NOT NULL,
gama VARCHAR(50) NOT NULL,
dimensiones VARCHAR(25),
proveedor VARCHAR(50),
descripcion TEXT,
cantidad_en_stock SMALLINT(6) NOT NULL,
precio_venta DECIMAL(15,2) NOT NULL,
precio_proveedor DECIMAL(15,2),
PRIMARY KEY(codigo_producto),
CONSTRAINT FKgamaproducto_producto FOREIGN KEY(gama) REFERENCES gama_producto(gama)
);
CREATE TABLE oficina(
codigo_oficina VARCHAR(10) NOT NULL,
ciudad INT,
pais INT,
region INT,
codigo_postal VARCHAR(10) NOT NULL,
linea_direccion1 VARCHAR(50) NOT NULL,
linea_direccion2 VARCHAR(50),
PRIMARY KEY(codigo_oficina),
FOREIGN KEY(pais) REFERENCES pais(id_pais),
FOREIGN KEY(ciudad) REFERENCES ciudad(id_ciudad),
FOREIGN KEY(region) REFERENCES region(id_region)

);

CREATE TABLE empleado(
codigo_empleado INT(11),
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
codigo_oficina VARCHAR(10),
codigo_jefe INT(11),
puesto VARCHAR(50),
id_telefonoempleado INT(11) NOT NULL,
PRIMARY KEY(codigo_empleado),
CONSTRAINT FK_oficina_empleado FOREIGN KEY(codigo_oficina) REFERENCES oficina(codigo_oficina),
FOREIGN KEY (codigo_jefe) REFERENCES jefe(codigo_jefe)

);



CREATE TABLE telefonoempleado(
id_telefonoempleado INT(11) NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NOT NULL,
celular1 VARCHAR(50) NOT NULL,
celular2 VARCHAR(50) ,
telefonofijo VARCHAR(50),
codigo_empleado INT(11),
PRIMARY KEY(id_telefonoempleado),
CONSTRAINT FK_empleado_telefonoempleado FOREIGN KEY(codigo_empleado) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE cliente(
    codigo_cliente INT(11) NOT NULL,
    nombre_cliente VARCHAR(50) NOT NULL,
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    fax VARCHAR(15) NOT NULL,
    linea_direccion1 VARCHAR(50) NOT NULL,
    linea_direccion2 VARCHAR(50),
    ciudad INT,
    region INT,
    pais INT,
    codigo_postal VARCHAR(10),
    codigo_empleado_rep_ventas INT(11),
    limite_credito DECIMAL(15,2),
    PRIMARY KEY (codigo_cliente),
    CONSTRAINT FK_ciudad_cliente FOREIGN KEY (ciudad) REFERENCES ciudad(id_ciudad),
    CONSTRAINT FK_region_cliente FOREIGN KEY (region) REFERENCES region(id_region),
    CONSTRAINT FK_pais_cliente FOREIGN KEY (pais) REFERENCES pais(id_pais),
    CONSTRAINT FK_empleado_cliente FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);


CREATE TABLE pago(
	id_transaccion VARCHAR(50) NOT NULL,
	codigo_cliente INT(11),
	forma_pago INT,
	fecha_pago DATE NOT NULL,
	total DECIMAL(15,2) NOT NULL,
	PRIMARY KEY(id_transaccion),
	FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
	FOREIGN KEY (forma_pago) REFERENCES forma_pago(id_forma_pago)
);

CREATE TABLE pedido(
	codigo_pedido INT(11) NOT NULL,
	fecha_pedido DATE NOT NULL,
	fecha_entrega DATE,
	estado INT,
	comentario TEXT,
	codigo_cliente INT(11),
	PRIMARY KEY(codigo_pedido),
	CONSTRAINT FK_cliente_pedido FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
	FOREIGN KEY(estado) REFERENCES estado_pedido(id_estado_pedido)
);

CREATE TABLE detalle_pedido(
detalle_pedido INT(11) NOT NULL,
codigo_pedido INT(11) NOT NULL,
codigo_producto VARCHAR(15),
cantidad INT(11) NOT NULL,
precio_unidad DECIMAL(15,2) NOT NULL,
numero_linea SMALLINT(6) NOT NULL,
PRIMARY KEY(detalle_pedido),
FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);




CREATE TABLE proveedor(
id_proveedor VARCHAR(15) NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NOT NULL,
email VARCHAR(100),
codigo_oficina VARCHAR(10),
codigo_producto VARCHAR(15),
PRIMARY KEY (id_proveedor),
CONSTRAINT FK_oficina_proveedor FOREIGN KEY(codigo_oficina) REFERENCES oficina(codigo_oficina),
CONSTRAINT FK_producto_proveedor FOREIGN KEY(codigo_producto) REFERENCES producto(codigo_producto)
);





CREATE TABLE telefonojefe(
codigo_jefe INT(11) NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NOT NULL,
celular1 VARCHAR(50) NOT NULL,
celular2 VARCHAR(50) ,
telefonofijo VARCHAR(50),
PRIMARY KEY(codigo_jefe),
FOREIGN KEY(codigo_jefe) REFERENCES jefe(codigo_jefe)
);






CREATE TABLE telefonocliente(
id_telefonocliente INT(11) NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NOT NULL,
celular1 VARCHAR(50) NOT NULL,
celular2 VARCHAR(50) ,
telefonofijo VARCHAR(50),
codigo_cliente INT(11),
PRIMARY KEY(id_telefonocliente),
FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo_cliente)
);


CREATE TABLE telefonooficina(
telefono INT(11) NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50) NOT NULL,
celular1 VARCHAR(50) NOT NULL,
celular2 VARCHAR(50) ,
telefonofijo VARCHAR(50),
codigo_oficina VARCHAR(10),
PRIMARY KEY(telefono),
CONSTRAINT FK_oficina_telefonooficina FOREIGN KEY(codigo_oficina) REFERENCES oficina(codigo_oficina)
);


