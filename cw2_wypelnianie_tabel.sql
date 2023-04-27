--wypelnianie danymi

INSERT INTO ksiegowosc.pracownicy(

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
	'Brunon',
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
	'ålimak',
	'Sezamkowa 29/67',
	'+48990943994'
),
(
	'G',
	'Beata',
	'Chrzan∆wik≥a',
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
	'Jan',
	'Bπk',
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

SELECT * FROM ksiegowosc.pracownicy


-----------------------------------------------godzina

INSERT INTO ksiegowosc.godzina(

	[data],
	[id_godziny],
	[id_pracownika],
	[liczba_godzin]

)
VALUES
(
	'2022-04-16',
	1,
	'A',
	5
),
(
	'2022-04-17',
	2,
	'B',
	5
),
(
	'2022-04-18',
	3,
	'C',
	7
),
(
	'2022-04-19',
	4,
	'D',
	8
),
(
	'2022-04-17',
	5,
	'E',
	9
),
(
	'2022-04-20',
	6,
	'F',
	10
),
(
	'2022-04-20',
	7,
	'G',
	6
),
(
	'2022-04-20',
	12,
	'H',
	7
),
(
	'2022-04-21',
	8,
	'I',
	5
),
(
	'2022-04-25',
	9,
	'J',
	6
)

SELECT * FROM ksiegowosc.godzina


INSERT INTO ksiegowosc.pensje (
	[id_pensji],
	[id_premii],
	[kwota],
	[stanowisko]
)
VALUES
(
	'PEN1',
	'P1',
	6000,
	'Shaman'
),
(
	'PEN2',
	'P2',
	11000,
	'Warlock'
),
(
	'PEN3',
	'P3',
	1480,
	'Shaman'
),
(
	'PEN4',
	'P4',
	2900,
	'Warrior'
),
(
	'PEN5',
	'P5',
	4500,
	'Mage'
),
(
	'PEN6',
	'P6',
	5500,
	'Priest'
),
(
	'PEN7',
	'P7',
	6000,
	'Mage'
),
(
	'PEN8',
	'P8',
	4500,
	'Monk'
),
(
	'PEN9',
	'P9',
	1600,
	'Hunter'
),
(
	'PEN10',
	'P10',
	700,
	'Hunter'
)

SELECT * FROM ksiegowosc.pensje



INSERT INTO ksiegowosc.premie(

	[id_premii],
	[kwota],
	[rodzaj]

)
VALUES
(
	'P1',
	150,
	NULL
),
(
	'P2',
	200,
	NULL
),
(
	'P3',
	250,
	NULL
),
(
	'P4',
	230,
	NULL
),
(
	'P5',
	400,
	NULL
),
(
	'P6',
	500,
	NULL
),
(
	'P7',
	300,
	NULL
),
(
	'P8',
	100,
	NULL
),
(
	'P9',
	180,
	NULL
),
(
	'P10',
	400,
	NULL
)

SELECT * FROM ksiegowosc.premie


INSERT INTO ksiegowosc.wynagrodzenia VALUES
	('1', '2022-04-27', 'A', '1', 'PEN1', 'P1'),
	('2', '2022-04-27', 'B', '2', 'PEN2', 'P2'),
	('3', '2022-04-27', 'C', '3', 'PEN3', 'P3'),
	('4', '2022-04-28', 'D', '4', 'PEN4', 'P4'),
	('5', '2022-04-28', 'E', '5', 'PEN5', 'P5'),
	('6', '2022-04-29', 'F', '6', 'PEN6', 'P6'),
	('7', '2022-04-30', 'G', '7', 'PEN7', 'P7'),
	('8', '2022-04-30', 'H', '12', 'PEN8', 'P8'),
	('9', '2022-05-15', 'I', '8', 'PEN9', 'P9'),
	('10', '2022-05-17', 'J', '9', 'PEN10', 'P10');

SELECT * FROM ksiegowosc.wynagrodzenia

