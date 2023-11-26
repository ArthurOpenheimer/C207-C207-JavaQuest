DROP DATABASE IF EXISTS javaquest;
CREATE DATABASE javaquest;

USE javaquest;

CREATE TABLE Raca(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    traco_racial VARCHAR(200) NOT NULL
);

CREATE TABLE Classe(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    habilidade VARCHAR(200) NOT NULL
);

CREATE TABLE Personagem(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ca INT NOT NULL,
    id_raca INT NOT NULL,
    id_classe INT UNIQUE NOT NULL,
    FOREIGN KEY (id_raca) REFERENCES Raca(id),
    FOREIGN KEY (id_classe) REFERENCES Classe(id)
);

CREATE TABLE Pericia(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    bonus INT NOT NULL
);

CREATE TABLE Personagem_Pericia(
    id_personagem INT NOT NULL,
    id_pericia INT NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_pericia) REFERENCES Pericia(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Item(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo TINYINT NOT NULL, # 0:Ferramenta, 1: Arma
    id_personagem INT,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Arma(
    dano INT NOT NULL,
    id_item INT NOT NULL,
    FOREIGN KEY (id_item) REFERENCES Item(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Ferramenta(
    descricao VARCHAR(200) NOT NULL,
    id_item INT NOT NULL,
    FOREIGN KEY (id_item) REFERENCES Item(id) ON UPDATE CASCADE ON DELETE CASCADE
);
