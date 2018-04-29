CREATE DATABASE atletismo
USE atletismo
GO

CREATE TABLE pais(
	cod VARCHAR(3) NOT NULL,
	nome VARCHAR(100),
	PRIMARY KEY(cod)
)
CREATE TABLE atleta(
	cod INT NOT NULL,
	cod_pais VARCHAR(3),
	nome VARCHAR (100),
	sexo VARCHAR(1),
	PRIMARY KEY(cod),
	FOREIGN KEY (cod_pais) REFERENCES pais(cod)
)
