DROP database IF EXISTS GGDB;
CREATE database GGDB;
USE GGDB;

DROP TABLE IF EXISTS utente;
CREATE TABLE utente (
email 		varchar(100) 	NOT NULL,
username 	varchar(50) 	NOT NULL,
password 	varchar(64) 	NOT NULL,
nome 		varchar(50) 	NOT NULL,
cognome 	varchar(50) 	DEFAULT NULL,
admin 		tinyint(1) 		NOT NULL DEFAULT '0',
PRIMARY KEY (email),
UNIQUE (username)
);

DROP TABLE IF EXISTS indirizzo;
CREATE TABLE indirizzo (
id 				int 			NOT NULL AUTO_INCREMENT,
citta 			varchar(50) 	NOT NULL,
provincia 		varchar(10)		NOT NULL,
cap 			varchar(10) 	NOT NULL,
via 			varchar(50) 	NOT NULL,
civico 			varchar(10) 	NOT NULL,
utenteEmail 	varchar(50) 	NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (utenteEmail) REFERENCES utente(email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS metodoDiPagamento;
CREATE TABLE metodoDiPagamento (
id 				int 					NOT NULL AUTO_INCREMENT,
tipo 			enum('carta','iban')	NOT NULL,
iban 			char(27) 				DEFAULT NULL,
numeroCarta 	varchar(19) 			DEFAULT NULL,
utenteEmail 	varchar(50) 			NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (utenteEmail) REFERENCES utente(email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS ordine;
CREATE TABLE ordine (
id 				int 			NOT NULL AUTO_INCREMENT,
data 			date 			NOT NULL,
costoTotale 	double 			NOT NULL,
utenteEmail 	varchar(50) 	NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (utenteEmail) REFERENCES utente(email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
nome varchar(50) 	NOT NULL,
PRIMARY KEY (nome)
);

DROP TABLE IF EXISTS prodotto;
CREATE TABLE prodotto (
id 				int 			NOT NULL,
nome 			varchar(100) 	NOT NULL,
descrizione 	varchar(500) 	NOT NULL,
quantita 		int 			NOT NULL,
costo		 	int 			NOT NULL,
sesso 			enum('m','f') 	NOT NULL,
immagine 		varchar(1000) 	DEFAULT NULL,
categoriaNome 	varchar(50) 	NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (categoriaNome) REFERENCES categoria(nome) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS inserimento;
CREATE TABLE inserimento (
prodottoId 	int 			NOT NULL,
ordineId 	int 			NOT NULL,
quantita   	int				NOT NULL,
PRIMARY KEY (prodottoId, ordineId),
FOREIGN KEY (prodottoId) REFERENCES prodotto(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (ordineId) REFERENCES ordine(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO utente (email, username, password, nome, cognome, admin) VALUES
('mario@example.com', 'user1', "cGFzc3dvcmQx", 'Mario', 'Rossi', 0),
('luigi@example.com', 'user2', 'cGFzc3dvcmQy', 'Luigi', 'Verdi', 0),
('admin@example.com', 'admin', 'YWRtaW5wYXNzd29yZA==', 'Admin', 'Admin', 1),
("admin@admin.com", "admin1", "YWRtaW4=", "admin", "admin", 1),
("mattia@gmail.com", "mattia", "bWF0dGlh", "Mattia", "Gallucci", 0);

INSERT INTO indirizzo (citta, provincia, cap, via, civico, utenteEmail) VALUES
('Roma', 'RM', '00100', 'Via Roma', '1', 'mario@example.com'),
('Milano', 'MI', '20100', 'Corso Milano', '2', 'luigi@example.com'),
("Solofra", "AV", "83029", "Via Roma", "1", "mattia@gmail.com");

INSERT INTO categoria (nome) VALUES
('Elettronica'),
('Abbigliamento'),
('Ufficio'),
("collane"),
("anelli");

-- Insert values into 'prodotto' table without the 'immagine' field
INSERT INTO prodotto (id, nome, descrizione, quantita, costo, sesso, immagine, categoriaNome) VALUES 
(1, 'T-shirt Uomo', 'T-shirt in cotone di alta qualità', 50, 15.99, 'm', 'images/tshirt_uomo.jpg', 'Abbigliamento'),
(2, 'Jeans Donna', 'Jeans slim fit', 30, 39.99, 'f', 'images/jeans_donna.jpg', 'Abbigliamento'),
(3, 'Giacca Uomo', 'Giacca elegante in lana', 15, 99.99, 'm', 'images/giacca_uomo.jpg', 'Abbigliamento'),
(4, 'Abito Donna', 'Abito lungo elegante', 10, 79.99, 'f', 'images/abito_donna.jpg', 'Abbigliamento'),
(5, "collana1", "collana d'oro", 50, 100, "m", "images/DA-METTERE.jpg", "collane"),
(6, "anello1", "anello con diamante", 50, 100, "m", "images/DA-METTERE.jpg", "anelli");

-- Insert values into 'ordine' table
INSERT INTO ordine (data, costoTotale, utenteEmail) VALUES
('2023-01-10', 1520, 'mario@example.com'),
('2023-02-15', 40, 'luigi@example.com'),
("2003-09-03", 100, "mattia@gmail.com");

-- Insert values into 'inserimento' table
INSERT INTO inserimento (prodottoId, ordineId, quantita) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(5, 3, 1);

-- Insert values into 'metodoDiPagamento' table
INSERT INTO metodoDiPagamento (tipo, iban, numeroCarta, utenteEmail) VALUES
('iban', 'IT60X0542811101000000123456', NULL, 'mario@example.com'),
('carta', NULL, '1234-5678-9123-4567', 'mario@example.com'),
('iban', 'IT60X0542811101000000654321', NULL, 'luigi@example.com'),
('carta', NULL, '9876-5432-1098-7654', 'luigi@example.com'),
("carta", NULL, "1234-1234-1234-1234", "mattia@gmail.com");

-- Popola la tabella 'ordine' con alcuni dati di esempio
INSERT INTO ordine (data, costoTotale, utenteEmail) VALUES
('2023-01-10', 1520.00, 'mario@example.com'),
('2023-02-15', 40.00, 'luigi@example.com'),
('2023-03-20', 200.00, 'mario@example.com'),
('2023-04-25', 85.00, 'luigi@example.com'),
('2023-05-30', 400.00, 'mario@example.com');
