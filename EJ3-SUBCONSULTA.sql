CREATE DATABASE datos_cliente;
-- creo la base de datos 

USE datos_cliente;
-- solicito usar esta base de datos

CREATE TABLE usuarios(
id_usuario INT UNSIGNED AUTO_INCREMENT ,
dni VARCHAR(9) UNIQUE,
telefono INT UNSIGNED,
email VARCHAR(100) UNIQUE,
nombre VARCHAR (50),
apellido VARCHAR (50),
pais VARCHAR(100),
ciudad VARCHAR(100),
cp INT UNSIGNED,
direccion  VARCHAR(100),
PRIMARY KEY (id_usuario)
);
-- creo la primera tabla con todas las columnas necesarias segun datos

ALTER TABLE usuarios DROP COLUMN pais, DROP COLUMN ciudad, DROP COLUMN cp, DROP COLUMN direccion;
-- elimino las columnas relacionadas con la direccion

CREATE TABLE direcciones(
id_direccion INT UNSIGNED AUTO_INCREMENT,
pais VARCHAR(100),
ciudad VARCHAR(100),
cp INT UNSIGNED,
direccion  VARCHAR(100),
id_usuario INT UNSIGNED,
FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
PRIMARY KEY (id_direccion)
);
-- creo una tabla con las columnas para guardar los datos de las direcciones, y la enlazo con la primera tabla a por el id- de usuario

INSERT INTO usuarios (nombre, apellido, email, telefono, dni) VALUES
("Irvin","Lethem","ilethem0@google.com.au","993870144","27994894L"),
("Kylie","Mungan","kmungan1@howstuffworks.com","497494899","74855187R"),
("Yul","Dibbert","ydibbert2@businesswire.com","776631050","21564941E"),
("Tamra","Mc Gorley","tmcgorley3@studiopress.com","921948685","61706447T"),
("Elmira","Imbrey","eimbrey4@cpanel.net","304168000","17898896F");
-- meto datos en la tabla usuarios 

INSERT INTO direcciones (pais,cp, direccion, ciudad, id_usuario) VALUES
("Indonesia",83297,"98339 Loftsgordon Road","Babakanbandung",1),
("Philippines",44455,"74641 Dwight Avenue","Bilar", 2),
("Indonesia",62965,"9510 Milwaukee Street","Sumberejo", 3),
("Norway",54756,"8902 Doe Crossing Alley","Steinkjer", 4),
("United States",51471,"8616 Stephen Hill","Charleston",5);
-- meto datos en la tabla de direcciones, relacionandolos con los usuarios por su id 

SELECT nombre, apellido, telefono FROM usuarios ORDER BY apellido;
-- datos de usuarios ordenados por apellido 

SELECT pais, COUNT(DISTINCT id_usuario) AS "usuarios" FROM direcciones GROUP BY pais;
-- contamos los usuarios que hay por pais 

SELECT usuarios.id_usuario, usuarios.dni, usuarios.telefono, usuarios.email, usuarios.nombre, usuarios.apellido, direcciones.id_direccion, direcciones.pais, direcciones.ciudad, direcciones.cp, direcciones.direccion FROM usuarios CROSS JOIN direcciones;
-- hago el join de las dos tablas

ALTER TABLE usuarios ADD edad INT UNSIGNED;
-- añado columna edad

INSERT INTO usuarios (edad) VALUES (24), (32), (40), (29), (38);
-- añado las edades de los usuarios

SELECT nombre, edad FROM usuarios WHERE edad>35;