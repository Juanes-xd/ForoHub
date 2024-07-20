CREATE DATABASE foroHub;

CREATE TABLE cursos (
    cursos_id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULl,
);

CREATE TABLE perfiles (
    perfil_id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
);

CREATE TABLE respuestas (
    respuesta_id serial PRIMARY KEY,
    mensaje VARCHAR(100) NOT NULL,
    topico_id INT NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL,
    usuario_id INT NOT NULL,
    solucion VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);


CREATE TABLE usuarios (
    usuario_id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL
    perfil_id INT NOT NULL
    FOREIGN KEY (perfil_id) REFERENCES perfiles(perfil_id)
);

CREATE TABLE topicos (
    topico_id serial PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    mensaje VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL,
    estado VARCHAR(6) NOT NULL,
    usuario_id INT NOT NULL,
    cursos_id INT NOT NULL,
    respuesta_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (cursos_id) REFERENCES cursos(cursos_id),
    FOREIGN KEY (respuesta_id) REFERENCES respuestas(respuesta_id)
);