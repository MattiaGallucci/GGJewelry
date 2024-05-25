DROP database IF EXISTS GeekFactoryDB;
CREATE database GeekFactoryDB;

USE GeekFactoryDB;

DROP TABLE IF EXISTS UserAccount;
CREATE TABLE UserAccount
(
	email varchar(50) PRIMARY KEY NOT NULL,
    passwordUser varchar(5000) NOT NULL,
	nome varchar(50) NOT NULL,
    cognome varchar(50) NOT NULL,
    indirizzo varchar(50) NOT NULL,
    telefono varchar(15) NOT NULL,
    numero char(16) NOT NULL,
    intestatario varchar(50) NOT NULL,
    CVV char(3) NOT NULL,
    ruolo varchar(16) NOT NULL DEFAULT 'registeredUser'
);

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente
(
	email varchar(50) PRIMARY KEY NOT NULL,
    FOREIGN KEY(email) REFERENCES UserAccount(email) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Venditore;
CREATE TABLE Venditore
(
	email varchar(50) PRIMARY KEY NOT NULL,
    feedback int DEFAULT NULL,
    FOREIGN KEY(email) REFERENCES UserAccount(email) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Tipologia;
CREATE TABLE Tipologia
(
    nome ENUM('Arredamento Casa','Action Figures','Gadget') PRIMARY KEY NOT NULL
);

DROP TABLE IF EXISTS Prodotto;
CREATE TABLE Prodotto
(
	codice int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
    descrizione text NOT NULL,
    deleted BOOL NOT NULL DEFAULT false,
    prezzo double(10,2) NOT NULL,
    model varchar(200) NOT NULL,
    speseSpedizione double(5,2) DEFAULT 0,
    emailVenditore varchar(50) NOT NULL,
    tag ENUM('Manga/Anime', 'Film/Serie TV', 'Videogiochi', 'Originali') NOT NULL,
    nomeTipologia ENUM('Arredamento Casa','Action Figures','Gadget') NOT NULL,
    dataAnnuncio date NOT NULL,
    FOREIGN KEY(emailVenditore) REFERENCES Venditore(email) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(nomeTipologia) REFERENCES Tipologia(nome) ON UPDATE cascade ON DELETE cascade
)ENGINE=InnoDB AUTO_INCREMENT=1000;

DROP TABLE IF EXISTS Ordine;
CREATE TABLE Ordine
(
	codiceOrdine int NOT NULL AUTO_INCREMENT,
    codiceProdotto int NOT NULL,
    emailCliente varchar(50) NOT NULL,
    prezzoTotale double(10,2) NOT NULL,
    quantity int NOT NULL,
    dataAcquisto date NOT NULL,
    PRIMARY KEY(codiceOrdine,codiceProdotto),
    FOREIGN KEY(codiceProdotto) REFERENCES Prodotto(codice) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(emailCliente) REFERENCES Cliente(email) ON UPDATE cascade ON DELETE cascade
)ENGINE=InnoDB AUTO_INCREMENT=100;

DROP TABLE IF EXISTS Recensione;
CREATE TABLE Recensione
(
	codiceRecensione int NOT NULL AUTO_INCREMENT,
    codiceProdotto int NOT NULL,
    emailCliente varchar(50) NOT NULL,
    votazione tinyint unsigned NOT NULL,
    testo text,
    dataRecensione date NOT NULL,
    PRIMARY KEY(codiceRecensione,codiceProdotto),
    FOREIGN KEY(codiceProdotto) REFERENCES Prodotto(codice) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(emailCliente) REFERENCES Cliente(email) ON UPDATE cascade ON DELETE cascade
);

DROP TABLE IF EXISTS Preferiti;
CREATE TABLE Preferiti
(
	codiceProdotto int NOT NULL,
    emailCliente varchar(50) NOT NULL,
    PRIMARY KEY(codiceProdotto,emailCliente),
    FOREIGN KEY(codiceProdotto) REFERENCES Prodotto(codice) ON UPDATE cascade ON DELETE cascade,
    FOREIGN KEY(emailCliente) REFERENCES Cliente(email) ON UPDATE cascade ON DELETE cascade
);

USE GeekFactoryDB;

/* begin data population */

/* accountuser data */
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV, ruolo)
VALUES ('geekfactory@gmail.com', MD5('12345678'), 'Geek', 'Factory', 'Unisa, Dipartimento Informatica', '3476549862', '5436724598431234', 'GeekFactory', 476, 'admin');
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('mariorossi@gmail.com', MD5('12345678'), 'Mario', 'Rossi', 'Caserta, Via Lazio 14', '3476549862', '5436724598431234', 'Mario Rossi', 476); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('luigiverdi@gmail.com', MD5('12345678'), 'Luigi', 'Verdi', 'Roma, Via Cesare 17', '3518457668', '6745982476311234', 'Luigi Verdi', 435); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('lorenzobianchi@gmail.com', MD5('12345678'), 'Lorenzo', 'Bianchi', 'Messina, Via Federico Fellini 14', '3474351776', '8791267534971234', 'Lorenzo Bianchi', 143); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('gigiprossi@gmail.com', MD5('12345678'), 'Gigi Pio', 'Rossi', 'Caserta, Via Lazio 14', '3518234671', '7613872515281234', 'Gigi Pio Rossi', 621); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('davidesari@yahoo.com', MD5('12345678'), 'Davide', 'Sari', 'Palermo, Via Libertà 15', '3517628334', '8901034567391234', 'Davide Sari', 165); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('emildcarlo@libero.it', MD5('12345678'), 'Emiliano', 'De Carlo', 'Napoli, Via Superiore 24', '3479228888', '3241768501101234', 'Emiliano De Carlo', 823); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('saraverdi@gmail.com', MD5('12345678'), 'Sara', 'Verdi', 'Pisa, Via Miracoli 73', '3476629882', '6734891203451234', 'Sara Verdi', 820); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('federeale@yahoo.com', MD5('12345678'), 'Federica', 'Reale', 'Salerno, Via Ponzi 1', '3471192332', '8923674123781234', 'Federica Reale', 732); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('cr7@gmail.com', MD5('4567812'), 'Cristiano', 'Ronaldo', 'Torino, Via Gemma 34', '3519938471', '7639071056291234', 'Cristiano Ronaldo', 623); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('simonebianchi@yahoo.com', MD5('45678912'), 'Simone', 'Bianchi', 'Milano, Via Verità 83', '3479990110', '7823019820351234', 'Simone Bianchi', 999); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('miriamesp@libero.it', MD5('45678912'), 'Miriam', 'Esposito', 'Napoli, Via Positano 56', '3479928998', '7153918202031234', 'Miriam Esposito', 102); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('michver@yahoo.com', MD5('45678912'), 'Michele', 'Verdi', 'Pavia, Via Roma 11', '3519923000', '6172918291541234', 'Michele Verdi', 629); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('dantealig@gmail.com', MD5('45678912'), 'Dante', 'Alighieri', 'Firenze, Via Santa Margherita 1', '3518823999', '8178291004211234', 'Dante Alighieri', 555); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('alemanzoni@gmail.com', MD5('45678912'), 'Alessandro', 'Manzoni', 'Milano, Via Gerolamo Morone 1', '3512579112', '7182192004621234', 'Alessandro Manzoni', 172); 
INSERT INTO UserAccount (email, passwordUser, nome, cognome, indirizzo, telefono, numero, intestatario, CVV)
VALUES ('pessimismocosmico@libero.it', MD5('45678912'), 'Giacomo', 'Leopardi', 'Recanati, Via Leopardi 14', '3519928000', '1672819100321234', 'Giacomo Leopardi', 671);

/* cliente data */
INSERT INTO Cliente (email) VALUES ('geekfactory@gmail.com');
INSERT INTO Cliente (email) VALUES ('mariorossi@gmail.com');
INSERT INTO Cliente (email) VALUES ('luigiverdi@gmail.com');
INSERT INTO Cliente (email) VALUES ('lorenzobianchi@gmail.com');
INSERT INTO Cliente (email) VALUES ('alemanzoni@gmail.com');
INSERT INTO Cliente (email) VALUES ('miriamesp@libero.it');
INSERT INTO Cliente (email) VALUES ('simonebianchi@yahoo.com');
INSERT INTO Cliente (email) VALUES ('gigiprossi@gmail.com');
INSERT INTO Cliente (email) VALUES ('davidesari@yahoo.com');
INSERT INTO Cliente (email) VALUES ('emildcarlo@libero.it');
INSERT INTO Cliente (email) VALUES ('saraverdi@gmail.com');
INSERT INTO Cliente (email) VALUES ('federeale@yahoo.com');
INSERT INTO Cliente (email) VALUES ('cr7@gmail.com');
INSERT INTO Cliente (email) VALUES ('pessimismocosmico@libero.it');
INSERT INTO Cliente (email) VALUES ('dantealig@gmail.com');
INSERT INTO Cliente (email) VALUES ('michver@yahoo.com');

/* venditore data */
INSERT INTO Venditore (email, feedback) VALUES ('michver@yahoo.com', 80);
INSERT INTO Venditore (email, feedback) VALUES ('dantealig@gmail.com', 93);
INSERT INTO Venditore (email, feedback) VALUES ('alemanzoni@gmail.com', NULL);
INSERT INTO Venditore (email, feedback) VALUES ('mariorossi@gmail.com', NULL);
INSERT INTO Venditore (email, feedback) VALUES ('pessimismocosmico@libero.it', 90);
INSERT INTO Venditore (email) VALUES ('geekfactory@gmail.com');
INSERT INTO Venditore (email) VALUES ('luigiverdi@gmail.com');
INSERT INTO Venditore (email) VALUES ('lorenzobianchi@gmail.com');
INSERT INTO Venditore (email) VALUES ('miriamesp@libero.it');
INSERT INTO Venditore (email) VALUES ('simonebianchi@yahoo.com');
INSERT INTO Venditore (email) VALUES ('gigiprossi@gmail.com');
INSERT INTO Venditore (email) VALUES ('davidesari@yahoo.com');
INSERT INTO Venditore (email) VALUES ('emildcarlo@libero.it');
INSERT INTO Venditore (email) VALUES ('saraverdi@gmail.com');
INSERT INTO Venditore (email) VALUES ('federeale@yahoo.com');
INSERT INTO Venditore (email) VALUES ('cr7@gmail.com');

/* tipologia data */
INSERT INTO Tipologia (nome) VALUES ('Arredamento Casa');
INSERT INTO Tipologia (nome) VALUES ('Action Figures');
INSERT INTO Tipologia (nome) VALUES ('Gadget');

/* prodotto data */
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Portachiavi naruto', 'Portachiavi di naruto, venduti tre in blocco', 9.99, 3.00, 'dantealig@gmail.com', 'Manga/Anime', 'Gadget', current_date(), 'naruto-keychain.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Corona game of thrones', 'Corona in plastica di game of thrones dipinta a mano', 19.99, 2.00, 'dantealig@gmail.com', 'Film/Serie TV', 'Gadget', current_date(), 'crown.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('GameBoy', 'GameBoy con case stampato in 3d, a cui è stato aggiunto un raspberry per emulazione', 39.99, 3.00, 'dantealig@gmail.com', 'Videogiochi', 'Gadget', current_date(), 'gameboy.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Spille Super Mario', '5 spille di Super Mario vendute insieme', 8.99, 1.00, 'pessimismocosmico@libero.it', 'Videogiochi', 'Gadget', current_date(), 'spille-mario.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Cover random', 'Vendo una cover di colore casuale', 2.99, 1.00, 'pessimismocosmico@libero.it', 'Originali', 'Gadget', current_date(), 'cover.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Goku DB', 'Vendo Goku di DragonBall, alto 25 cm', 29.99, 0.00, 'alemanzoni@gmail.com', 'Manga/Anime', 'Action Figures', current_date(), 'dragonball.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Stormtrooper', 'Vendo stormtrooper di star wars come in foto', 19.99, 0.00, 'michver@yahoo.com', 'Film/Serie TV', 'Action Figures', current_date(), 'swaf.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Action figure di Link', 'Link di The Legend of Zelda, alto 15 cm', 15.99, 0.00, 'michver@yahoo.com', 'Videogiochi', 'Action Figures', current_date(), 'zelda.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Cavaliere di Dark Souls', 'Alto 25 cm e già colorato', 31.99, 0.00, 'michver@yahoo.com', 'Videogiochi', 'Action Figures', current_date(), 'darksouls.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Modello umano', 'Modello umano da colorare a piacimento e snodabile', 23.99, 0.00, 'michver@yahoo.com', 'Originali', 'Action Figures', current_date(), 'human.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Stand cuffie HP', 'Stand per cuffie ispirato a Harry Potter', 14.99, 3.00, 'mariorossi@gmail.com', 'Film/Serie TV', 'Arredamento Casa', current_date(), 'cuffiehp.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Orologio Harry Potter', 'Orologio con batteria di Harry Potter, escluse pile', 29.99, 3.00, 'mariorossi@gmail.com', 'Film/Serie TV', 'Arredamento Casa', current_date(), 'orologio.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Lampada Minecraft', 'Lampada di minecraft apribile, da inserire batterie e lampadina', 79.99, 0.00, 'mariorossi@gmail.com', 'Videogiochi', 'Arredamento Casa', current_date(), 'minelamp.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Stand Portal', 'Stand per libri, custodie, etc... ispirato a Portal', 14.99, 2.00, 'mariorossi@gmail.com', 'Videogiochi', 'Arredamento Casa', current_date(), 'stand.jpg');
INSERT INTO Prodotto (nome, descrizione, prezzo, speseSpedizione, emailVenditore, tag, nomeTipologia, dataAnnuncio, model)
VALUES ('Vaso multicolore', 'Vaso multicolore alto 30 cm, con diametro di 27 cm', 34.99, 1.00, 'michver@yahoo.com', 'Originali', 'Arredamento Casa', current_date(), 'vaso.jpg');

/* ordine data */
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1000, 'mariorossi@gmail.com', 25.98, 2, '2017-11-11');
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1000, 'luigiverdi@gmail.com', 12.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1001, 'lorenzobianchi@gmail.com', 21.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1002, 'alemanzoni@gmail.com', 42.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1003, 'miriamesp@libero.it', 19.98, 2, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1003, 'simonebianchi@yahoo.com', 19.98, 2, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1004, 'gigiprossi@gmail.com', 3.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1005, 'davidesari@yahoo.com', 59.98, 2, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1001, 'emildcarlo@libero.it', 21.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1002, 'saraverdi@gmail.com', 42.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1004, 'federeale@yahoo.com', 3.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1014, 'cr7@gmail.com', 35.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1002, 'mariorossi@gmail.com', 42.99, 1, current_date());
INSERT INTO Ordine (codiceProdotto, emailCliente, prezzoTotale, quantity, dataAcquisto)
VALUES (1003, 'mariorossi@gmail.com', 19.98, 2, current_date());

/* recensione data */
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1000, 'mariorossi@gmail.com', 10, NULL, current_date());
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1001, 'lorenzobianchi@gmail.com', 9, NULL, current_date());
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1000, 'luigiverdi@gmail.com', 9, NULL, current_date());
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1014, 'cr7@gmail.com', 8, NULL, current_date());
INSERT INTO Recensione (codiceProdotto, emailCliente, votazione, testo, dataRecensione)
VALUES (1003, 'mariorossi@gmail.com', 9, NULL, current_date());

/* preferiti data */
INSERT INTO Preferiti (codiceProdotto, emailCliente)
VALUES (1000, 'mariorossi@gmail.com');
INSERT INTO Preferiti (codiceProdotto, emailCliente)
VALUES (1001, 'mariorossi@gmail.com');
INSERT INTO Preferiti (codiceProdotto, emailCliente)
VALUES (1002, 'mariorossi@gmail.com');

/* end data population */