CREATE DATABASE transilvania_hotel;
USE transilvania_hotel;

CREATE TABLE proprietario(
proprietario_id VARCHAR(255) PRIMARY KEY,
nome VARCHAR(255),
cpf_cnpj VARCHAR(20),
contato VARCHAR(255)
);

CREATE TABLE cliente(
cliente_id VARCHAR(255) PRIMARY KEY,
nome VARCHAR(255),
cpf VARCHAR(14),
contato VARCHAR(255)
);

CREATE TABLE enderecos(
endereco_id VARCHAR(255) PRIMARY KEY,
rua VARCHAR(255),
numero INT,
bairro VARCHAR(255),
cidade VARCHAR(255),
estado VARCHAR(2),
cep VARCHAR(10)
);

CREATE TABLE hospedagens(
hospedagem_id VARCHAR(255) PRIMARY KEY,
tipo VARCHAR(50),
endereco_id VARCHAR(255),
proprietario_id VARCHAR(255),
ativo BOOL,
FOREIGN KEY (endereco_id) REFERENCES enderecos(endereco_id),
FOREIGN KEY (proprietario_id) REFERENCES proprietario(proprietario_id)
);