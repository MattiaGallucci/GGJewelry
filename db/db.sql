DROP database IF EXISTS GGDB;
CREATE database GGDB;
USE GGDB;

DROP TABLE IF EXISTS utente;
CREATE TABLE utente (
email        varchar(100)    NOT NULL,
username     varchar(50)     NOT NULL,
password     varchar(64)     NOT NULL,
nome         varchar(50)     NOT NULL,
cognome      varchar(50)     DEFAULT NULL,
admin        tinyint(1)      NOT NULL DEFAULT '0',
PRIMARY KEY (email),
UNIQUE (username)
);

DROP TABLE IF EXISTS indirizzo;
CREATE TABLE indirizzo (
id             int             NOT NULL AUTO_INCREMENT,
citta          varchar(50)     NOT NULL,
provincia      varchar(10)     NOT NULL,
cap            varchar(10)     NOT NULL,
via            varchar(50)     NOT NULL,
civico         varchar(10)     NOT NULL,
utenteEmail    varchar(50)     NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (utenteEmail) REFERENCES utente(email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS metodoDiPagamento;
CREATE TABLE metodoDiPagamento (
id             int                     NOT NULL AUTO_INCREMENT,
tipo           enum('carta','iban')    NOT NULL,
iban           char(27)                DEFAULT NULL,
numeroCarta    varchar(19)             DEFAULT NULL,
utenteEmail    varchar(50)             NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (utenteEmail) REFERENCES utente(email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS ordine;
CREATE TABLE ordine (
id             int             NOT NULL AUTO_INCREMENT,
data           date            NOT NULL,
costoTotale    double          NOT NULL,
utenteEmail    varchar(50)     NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (utenteEmail) REFERENCES utente(email) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
nome varchar(50)     NOT NULL,
PRIMARY KEY (nome)
);

DROP TABLE IF EXISTS prodotto;
CREATE TABLE prodotto (
id             int             NOT NULL,
nome           varchar(100)    NOT NULL,
descrizione    varchar(500)    NOT NULL,
quantita       int             NOT NULL,
costo          int             NOT NULL,
sesso          enum('m','f')   NOT NULL,
immagine       varchar(1000)   DEFAULT NULL,
categoriaNome  varchar(50)     NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (categoriaNome) REFERENCES categoria(nome) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS inserimento;
CREATE TABLE inserimento (
id				int				NOT NULL AUTO_INCREMENT,
prodottoId     	int             NOT NULL,
ordineId       	int             NOT NULL,
quantita       	int             NOT NULL,
immagine      	varchar(1000)   DEFAULT NULL,
nome           	varchar(100)    NOT NULL,
costo          	int             NOT NULL,
PRIMARY KEY (id, ordineId),
FOREIGN KEY (ordineId) REFERENCES ordine(id) ON UPDATE CASCADE ON DELETE CASCADE
    );


INSERT INTO utente (email, username, password, nome, cognome, admin) VALUES
("mario@gmail.com", "user1", "cGFzc3dvcmQx", 'Mario', 'Rossi', 0),
("luigi@gmail.com", "user2", "cGFzc3dvcmQy", 'Luigi', 'Verdi', 0),
("admin@gmail.com", "admin", "YWRtaW5wYXNzd29yZA==", 'Admin', 'Admin', 1),
("mattia@gmail.com", "mattia", "bWF0dGlh", "Mattia", "Gallucci", 0),
("choaib@gmail.com", "choaib", "Y2hvYWli", "Choaib", "Goumri", 0);

INSERT INTO indirizzo (citta, provincia, cap, via, civico, utenteEmail) VALUES
('Roma', 'RM', '00100', 'Via Roma', '1', 'mario@gmail.com'),
('Milano', 'MI', '20100', 'Corso Milano', '2', 'luigi@gmail.com'),
("Solofra", "AV", "83029", "Via Roma", "1", "mattia@gmail.com"),
("Milano", "MI", "20100", "Via Roma", "1", "choaib@gmail.com");

INSERT INTO categoria (nome) VALUES
("collane"),
("anelli"),
("bracciali"),
("orecchini");

-- Insert values into 'prodotto' table without the 'immagine' field
INSERT INTO prodotto (id, nome, descrizione, quantita, costo, sesso, immagine, categoriaNome) VALUES 
(1, 'Collana Infinity', 'Eterno romanticismo: I simboli dell’amore e dell’infinito sono fusi insieme in questa elegante collana G&G Jewelry. Un cuore in cristallo bianco è intrecciato con un simbolo dell’infinito placcato nella tonalità oro rosa in questo adorabile gioiello, una rappresentazione visiva della promessa di amore eterno. Un’idea regalo perfetta per la persona che ami.', 50, 130, 'f', 'assets/img/collana1.jpg', 'collane'),
(2, 'Collana Mesmera', 'Scegli la pura eleganza di questa sfavillante collana Mesmera. Il design luminoso è realizzato con una fila di G&G Jewelry Zirconi che catturano la luce su una montatura placcata rodio in un mix straordinario di tagli e dimensioni. L’allungamento completato da una chiusura a moschettone e da una pioggia di sorprendenti G&G Jewelry Zirconia conferiscono a questo gioiello un tocco di lusso in più. Regala questo gioiello a una persona cara che non vorrà rinunciarvi mai più.', 30, 300, 'f', 'assets/img/collana2.jpg', 'collane'),
(3, 'Collana Gema', 'Questa collana cristallina è un gioiello di grande effetto che si distingue per la bellezza di ogni dettaglio. Simbolo dell’abile savoir-faire di G&G Jewelry, il design placcato rodio presenta una moltitudine di cristalli incastonati a griffe, in un mix di tagli e in diverse tonalità di blu, tutto sapientemente disposto in una forma organica ma precisa. L’effetto di insieme è di massima intensità e rappresenta il modo perfetto per infondere glamour ad una serata raffinata.', 15, 750, 'f', 'assets/img/collana3.jpg', 'collane'),
(4, 'Anello Vittore', 'Questo anello sfoggia il luminoso splendore delle pietre sfaccettate luccicanti. Elementi bianchi, a forma di goccia, disposti in un’unica fila riflettono e rifrangono meravigliosamente la luce. Le forme pure ed eleganti rendono questo anello perfetto da abbinare ad altri gioielli e per creare trendy look sovrapposti con altri anelli in coordinato. Una scelta eccellente per impreziosire gli outfit per le occasioni speciali e un’idea regalo di grande ispirazione.', 10, 160, 'f', 'assets/img/anello1.jpg', 'anelli'),
(5, 'Anello Hyperbola', 'Questo anello Hyperbola intrecciato integra più stili in un unico design meravigliosamente compatto. Le sue due fasce placcate rodio sovrapposte sono impreziosite da G&G Jewelry Zirconia trasparenti con montature a binario e a griffe. Un cristallo aggiuntivo taglio Oval è inframmezzato per un impatto aggiuntivo. Abbinalo ad un bangle coordinato per un look davvero mozzafiato.', 50, 140, 'f', 'assets/img/anello2.jpg', 'anelli'),
(6, 'Anello Cocktail Lucent', 'Questo splendente anello Lucent è realizzato per catturare il massimo della luce e procurare gioia a chi lo indossa. Magistralmente tagliato con 138 sfaccettature, questo design tempestato da cristalli combina una bellissima trasparenza con un intarsio in acciaio inossidabile. Chic e audace, questo iconico anello ottagonale offre infinite possibilità di styling per ogni look.', 50, 250, 'f', 'assets/img/anello3.jpg', 'anelli'),
(7, 'Bracciale Angelic', 'Un classico intramontabile. Il braccialetto rodiato propone una fila di Clear Crystal a taglio circolare, ognuno incorniciato dal pavé di Clear Crystal. Il gioiello si abbina perfettamente agli altri accessori della collezione Angelic.', 50, 160, 'f', 'assets/img/bracciale1.jpg', 'bracciali'),
(8, 'Bracciale Millenia', 'Trova il divertimento nella moda con questo gioioso bracciale Millenia blu, che contiene almeno il 30% di G&G Jewelry ReCreated™ crystals, i nostri cristalli più sostenibili ad oggi. La creazione è placcata rodio e presenta una vivace sfumatura di cristalli taglio Octagon. Affascinante ed espressivo, questo bracciale è perfetto per le giornate che meritano un tocco di colore vivace.', 30, 250, 'f', 'assets/img/bracciale2.jpg', 'bracciali'),
(9, 'Bracciale Mesmera', 'Questo bracciale Mesmera sorprende con la bellezza di ogni suo dettaglio. Incastonato in una placcatura rodio, l’elegante gioiello presenta una serie di cristalli con montatura a griffe in un’audace varietà di tagli. Un’ulteriore pietra è disposta all’estremità dell’allungamento pendente per un tocco di lusso extra. Un modo davvero radioso per esprimere il tuo senso dello stile.', 25, 200, 'f', 'assets/img/bracciale3.jpg', 'bracciali'),
(10, 'Orecchini a lobo Matrix', 'Questi straordinari orecchini a buco sono una fresca interpretazione del classico orecchino con perla. Ciascuna creazione placcata rodio presenta un’unica Crystal Pearl G&G Jewelry bianca e una G&G Jewelry Zirconia taglio Round, collegate tra loro per dare vita a un insieme lussuoso e lucente. Indossali con un pendente Matrix coordinato per amplificare la radiosità.', 40, 80, 'f', 'assets/img/orecchini1.jpg', 'orecchini'),
(11, 'Orecchini a lobo Constella', 'Preparati a risplendere con questi incantevoli orecchini a lobo della linea Constella. Questo irresistibile paio, che esibisce pietre trasparenti illuminate dalla squisita tecnica pavé G&G Jewelry, è rifinito da una montatura placcata rodio. Instant wonder per ogni giorno.', 10, 100, 'f', 'assets/img/orecchini2.jpg', 'orecchini'),
(12, 'Orecchini pendenti Mesmera', 'Per un massimo di radiosità, scegli questi orecchini della famiglia Mesmera che catturano la luce. Lo sfavillante design di ogni gioiello sfoggia audaci cristalli con montatura a griffe, incastonati in una struttura placcata rodio e ogni pietra è realizzata in una forma diversa. Un regalo semplice ma elegante che ravviverà ogni occasione speciale.', 60, 130, 'f', 'assets/img/orecchini3.jpg', 'orecchini');

-- Insert values into 'ordine' table
-- Insert values into 'ordine' table
INSERT INTO ordine (id, data, costoTotale, utenteEmail) VALUES
(1, '2023-01-10', 570.00, 'mario@gmail.com'),  -- Collana Infinity + Collana Mesmera + Orecchini pendenti Mesmera
(2, '2023-02-15', 1610.00, 'luigi@gmail.com'),  -- 2 * Collana Gema + Orecchini a lobo Constella
(3, '2023-03-20', 250.00, 'mattia@gmail.com'),  -- Anello Vittore + Orecchini a lobo Matrix
(4, '2023-04-25', 350.00, 'choaib@gmail.com'),  -- Anello Hyperbola + Bracciale Mesmera
(5, '2023-05-30', 670.00, 'mario@gmail.com');   -- Anello Cocktail Lucent + Bracciale Angelic + Bracciale Millenia

-- Insert values into 'inserimento' table
INSERT INTO inserimento (id, prodottoId, ordineId, quantita, immagine, nome, costo) VALUES
(1, 1, 1, 1, 'assets/img/collana1.jpg', 'Collana Infinity', 130),
(2, 2, 1, 1, 'assets/img/collana2.jpg', 'Collana Mesmera', 300),
(3, 12, 1, 1, 'assets/img/orecchini3.jpg', 'Orecchini pendenti Mesmera', 130),
(4, 3, 2, 2, 'assets/img/collana3.jpg', 'Collana Gema', 750),
(5, 11, 2, 1, 'assets/img/orecchini2.jpg', 'Orecchini a lobo Constella', 100),
(6, 4, 3, 1, 'assets/img/anello1.jpg', 'Anello Vittore', 160),
(7, 10, 3, 1, 'assets/img/orecchini1.jpg', 'Orecchini a lobo Matrix', 80),
(8, 5, 4, 1, 'assets/img/anello2.jpg', 'Anello Hyperbola', 140),
(9, 9, 4, 1, 'assets/img/bracciale3.jpg', 'Bracciale Mesmera', 200),
(10, 6, 5, 1, 'assets/img/anello3.jpg', 'Anello Cocktail Lucent', 250),
(11, 7, 5, 1, 'assets/img/bracciale1.jpg', 'Bracciale Angelic', 160),
(12, 8, 5, 1, 'assets/img/bracciale2.jpg', 'Bracciale Millenia', 250);

-- Insert values into 'metodoDiPagamento' table
INSERT INTO metodoDiPagamento (tipo, iban, numeroCarta, utenteEmail) VALUES
('carta', NULL, '1234-5678-9123-4567', 'mario@gmail.com'),
('carta', NULL, '9876-5432-1098-7654', 'luigi@gmail.com'),
("carta", NULL, "1234-1234-1234-1234", "mattia@gmail.com"),
("carta", NULL, "7777-7777-7777-7777", "choaib@gmail.com");