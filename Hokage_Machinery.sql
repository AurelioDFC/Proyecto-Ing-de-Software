create database Hokage_Machinery;

use Hokage_Machinery;

create table usuario(
	id_usuario int primary key identity(1,1) not null,
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	e_mail varchar(100) not null,
	contraseña varchar(100) not null,
	telefono varchar(25) not null
);

create table usuario_dueño(
	id_udueño int primary key identity(1,1) not null,
	id_usuario int foreign key references usuario(id_usuario)	
);

create table usuario_rentador(
	id_urentador int primary key identity(1,1) not null,
	id_usuario int foreign key references usuario(id_usuario)	
);

create table ubicacion(
	id_ubicacion int primary key identity(1,1) not null,
	departamento varchar(50) not null,
	municipio varchar(50) not null
);

create table maquinaria(
	id_maquinaria int primary key identity(1,1) not null,
	marca varchar(50) not null,
	modelo varchar(50),
	tipo varchar(50) not null,
	estado bit not null,
	id_udueño int foreign key references usuario_dueño(id_udueño),
	id_ubicacion int foreign key references ubicacion(id_ubicacion)
);

create table renta(
	id_renta int primary key identity(1,1) not null,
	hora_renta int not null,
	fecha_inicio date not null,
	fecha_final date not null,
	id_urentador int foreign key references usuario_rentador(id_urentador),
	id_maquinaria int foreign key references maquinaria(id_maquinaria)
);