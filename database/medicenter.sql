CREATE DATABASE IF NOT EXISTS medicenter;
USE medicenter;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(20) NOT NULL
);

CREATE TABLE paciente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    usuario_id INT UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE medico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    usuario_id INT UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    usuario_id INT UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE consulta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'AGENDADA',
    observacao VARCHAR(255),
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id)
);

CREATE TABLE prontuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    anotacoes TEXT,
    diagnostico TEXT,
    prescricao TEXT,
    data_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    consulta_id INT NOT NULL UNIQUE,
    FOREIGN KEY (consulta_id) REFERENCES consulta(id)
);

spring.datasource.url=jdbc:mysql://localhost:3306/medicenter
spring.datasource.username=root
spring.datasource.password=

spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=true