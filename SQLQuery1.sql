-- tworzenie bazy dancyh
CREATE DATABASE firma;


--stworzenie nowego schematu 
CREATE SCHEMA rozliczenia;


CREATE TABLE rozliczenia.pracownicy (id_pracownika CHAR(8) PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(100) NOT NULL,
	telefon CHAR(12) NULL);

-- przyklad tworzenia tabeli

CREATE TABLE rozliczenia.godzina (id_godziny CHAR(6) PRIMARY KEY, data DATE NOT NULL, liczba_godzin SMALLINT NOT NULL, id_pracownika CHAR(8) NOT NULL);

CREATE TABLE rozliczenia.pensje (id_pensji CHAR(8) PRIMARY KEY, stanowisko VARCHAR(50) NOT NULL, kwota SMALLMONEY NOT NULL, id_premii CHAR(8) NULL);

CREATE TABLE rozliczenia.premie(id_premii CHAR(8) PRIMARY KEY, rodzaj VARCHAR(30) NULL,kwota SMALLMONEY NOT NULL);


--dodawanie kluczy obcych
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);


ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

--wypelnienie tabeli 10 pracownikami
INSERT INTO rozliczenia.pracownicy(

	[id_pracownika],
	[imie],
	[nazwisko],
	[adres],
	[telefon]

)
VALUES
(
	'A',
	'Arnold',
	'Samiec',
	'Orzeszkowa 22/56',
	NULL
),
(
	'B',
	'Borys',
	'Budka',
	'Orzeszkowa 77/51',
	'+48967006998'
),
(
	'C',
	'Anna',
	'Chrzan',
	'Orzeszkowa 22/41',
	'+48917894997'
),
(
	'D',
	'Kuba',
	'Buba',
	'Orzeszkowa 21/48',
	'+48991463796'
),
(
	'E',
	'Eryk',
	'Siwy',
	'Orzeszkowa 22/40',
	'+48943578995'
),
(
	'F',
	'Kamil',
	'Œlimak',
	'Sezamkowa 29/67',
	'+48990943994'
),
(
	'G',
	'Beata',
	'Æwik³a',
	'Sezamkowa 29/56',
	'+48997164993'
),
(
	'H',
	'Ala',
	'Kotwica',
	'Sezamkowa 29/11',
	'+48994535992'
),
(
	'I',
	'Wiktor',
	'B¹k',
	'Sezamkowa 29/45',
	'+48123456789'
),
(
	'J',
	'Steve',
	'Jobs',
	'Sezamkowa 29/40',
	NULL
)

SELECT * FROM rozliczenia.pracownicy