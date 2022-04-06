--Criação do banco de dados
CREATE DATABASE minimalpad;
\c minimalpad

--Criação da tabela de Usuários
CREATE TABLE usuario (
  email VARCHAR(70) NOT NULL,
  nome_real VARCHAR(100) NOT NULL,
  nome_usuario VARCHAR(50) NOT NULL,
  senha VARCHAR(30) NOT NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (email)
);
\d usuario

--Criação da tabela de Anotações
CREATE TABLE anotacoes (
  id INTEGER NOT NULL,
  texto TEXT NOT NULL,
  CONSTRAINT pk_anotacoes PRIMARY KEY (id)
);
\d anotacoes

--Criação da relação/tabela "Escrever"
CREATE TABLE escrever (
  email VARCHAR(70) NOT NULL,
  id INTEGER NOT NULL,
  CONSTRAINT fk_usuario FOREIGN KEY (email) REFERENCES usuario(email),
  CONSTRAINT fk_id_texto FOREIGN KEY (id) REFERENCES anotacoes(id)
);
\d escrever

--Criação da tabela de Eventos
CREATE TABLE eventos (
  id INTEGER NOT NULL,
  titulo VARCHAR(255) NOT NULL,
  "data" DATE NOT NULL,
  hora TIME,
  descricao TEXT,
  usr_email VARCHAR(70) NOT NULL,
  CONSTRAINT pk_eventos PRIMARY KEY (id),
  CONSTRAINT fk_usuario FOREIGN KEY (usr_email) REFERENCES usuario(email)
);
\d eventos

--Criação da relação/tabela "Participar"
CREATE TABLE participar (
  id INTEGER NOT NULL,
  email VARCHAR(70) NOT NULL,
  CONSTRAINT fk_id_evento FOREIGN KEY (id) REFERENCES eventos(id),
  CONSTRAINT fk_usuario FOREIGN KEY (email) REFERENCES usuario(email)
);
\d participar

\d
