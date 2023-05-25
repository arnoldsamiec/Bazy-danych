create database geo2;

create schema tabela;

CREATE TABLE GeoEon
(
id_eon INT NOT NULL PRIMARY KEY,
nazwa_eon varchar(30) NOT NULL
);

CREATE TABLE GeoEra
(
id_era INTEGER NOT NULL PRIMARY KEY,
id_eon INTEGER,
nazwa_era VARCHAR(30) NOT NULL,
FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon)
);


CREATE TABLE GeoOkres
(
id_okres INTEGER NOT NULL PRIMARY KEY,
id_era INTEGER,
nazwa_okres VARCHAR(30) NOT NULL,
FOREIGN KEY (id_era) REFERENCES GeoEra(id_era)
);

CREATE TABLE GeoEpoka
(
id_epoka INTEGER NOT NULL PRIMARY KEY,
id_okres INTEGER,
nazwa_epoka VARCHAR(30) NOT NULL,
FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres)
);

CREATE TABLE GeoPietro
(
id_pietro INTEGER NOT NULL PRIMARY KEY,
id_epoka INTEGER REFERENCES GeoEpoka(id_epoka),
nazwa_pietro VARCHAR(30) NOT NULL,
FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka)
);

#wypelnianie danymi

#eon
INSERT INTO GeoEon VALUES(1, 'Fanerozoik');

#era
INSERT INTO GeoEra VALUES(1, 1, 'Paleozoik');
INSERT INTO GeoEra VALUES(2, 1, 'Mezozoik');
INSERT INTO GeoEra VALUES(3, 1, 'Kenozoik');

select * from GeoOkres;
#okres

INSERT INTO GeoOkres VALUES(1, 1, 'kambr');
INSERT INTO GeoOkres VALUES(2, 1, 'ordowik');
INSERT INTO GeoOkres VALUES(3, 1, 'sylur');
INSERT INTO GeoOkres VALUES(4, 1, 'dewon');
INSERT INTO GeoOkres VALUES(5, 1, 'karbon');
INSERT INTO GeoOkres VALUES(6, 1, 'perm');

INSERT INTO GeoOkres VALUES(7, 2, 'trias');
INSERT INTO GeoOkres VALUES(8, 2, 'jura');
INSERT INTO GeoOkres VALUES(9, 2, 'kreda');

INSERT INTO GeoOkres VALUES(10, 3, 'paleogen');
INSERT INTO GeoOkres VALUES(11, 3, 'neogen');
INSERT INTO GeoOkres VALUES(12, 3, 'czwartorzęd');

select * from GeoOkres;

#epoka
select * from GeoEpoka;


INSERT INTO GeoEpoka VALUES(1, 1, 'terenew');
INSERT INTO GeoEpoka VALUES(2, 1, 'druga epoka kambru');
INSERT INTO GeoEpoka VALUES(3, 1, 'miaoling');
INSERT INTO GeoEpoka VALUES(4, 1, 'furong');

INSERT INTO GeoEpoka VALUES(5, 2, 'ordowik wczesny');
INSERT INTO GeoEpoka VALUES(6, 2, 'ordowik środkowy');
INSERT INTO GeoEpoka VALUES(7, 2, 'ordowik późny');

INSERT INTO GeoEpoka VALUES(8, 3, 'landower');
INSERT INTO GeoEpoka VALUES(9, 3, 'wenlok');
INSERT INTO GeoEpoka VALUES(10, 3, 'ludlow');
INSERT INTO GeoEpoka VALUES(11, 3, 'przydol');

INSERT INTO GeoEpoka VALUES(12, 4, 'wczesny dewon');
INSERT INTO GeoEpoka VALUES(13, 4, 'środkowy dewon');
INSERT INTO GeoEpoka VALUES(14, 4, 'późny dewon');

INSERT INTO GeoEpoka VALUES(15, 5, 'missisip');
INSERT INTO GeoEpoka VALUES(16, 5, 'pensylwan');

INSERT INTO GeoEpoka VALUES(17, 6, 'cisural');
INSERT INTO GeoEpoka VALUES(18, 6, 'gwadalup');
INSERT INTO GeoEpoka VALUES(19, 6, 'loping');

INSERT INTO GeoEpoka VALUES(20, 7, 'wczesny trias');
INSERT INTO GeoEpoka VALUES(21, 7, 'środkowy trias');
INSERT INTO GeoEpoka VALUES(22, 7, 'późny trias');

INSERT INTO GeoEpoka VALUES(23, 8, 'jura wczesna');
INSERT INTO GeoEpoka VALUES(24, 8, 'jura środkowa');
INSERT INTO GeoEpoka VALUES(25, 8, 'jura późna');

INSERT INTO GeoEpoka VALUES(26, 9, 'wczesna kreda');
INSERT INTO GeoEpoka VALUES(27, 9, 'późna kreda');

INSERT INTO GeoEpoka VALUES(28, 10, 'paleocen');
INSERT INTO GeoEpoka VALUES(29, 10, 'eocen');
INSERT INTO GeoEpoka VALUES(30, 10, 'oligocen');

INSERT INTO GeoEpoka VALUES(31, 11, 'miocen');
INSERT INTO GeoEpoka VALUES(32, 11, 'pliocen');

INSERT INTO GeoEpoka VALUES(33, 12, 'plejstocen');
INSERT INTO GeoEpoka VALUES(34, 12, 'holocen');

#pietro

select * from GeoPietro;

INSERT INTO GeoPietro VALUES(1, 1, 'fortun');
INSERT INTO GeoPietro VALUES(2, 1, 'piętro 2');

INSERT INTO GeoPietro VALUES(3, 2, 'piętro 3');
INSERT INTO GeoPietro VALUES(4, 2, 'piętro 4');

INSERT INTO GeoPietro VALUES(5, 3, 'wuliuan');
INSERT INTO GeoPietro VALUES(6, 3, 'drum');
INSERT INTO GeoPietro VALUES(7, 3, 'gużang');

INSERT INTO GeoPietro VALUES(8, 4, 'paib');
INSERT INTO GeoPietro VALUES(9, 4, 'dziangszan');
INSERT INTO GeoPietro VALUES(10, 4, 'piętro 10');

INSERT INTO GeoPietro VALUES(11, 5, 'tremadok');
INSERT INTO GeoPietro VALUES(12, 5, 'flo');

INSERT INTO GeoPietro VALUES(13, 6, 'daping');
INSERT INTO GeoPietro VALUES(14, 6, 'darriwil');

INSERT INTO GeoPietro VALUES(15, 7, 'sandb');
INSERT INTO GeoPietro VALUES(16, 7, 'kat');
INSERT INTO GeoPietro VALUES(17, 7, 'hirnant');

INSERT INTO GeoPietro VALUES(18, 8, 'ruddan');
INSERT INTO GeoPietro VALUES(19, 8, 'aeron');
INSERT INTO GeoPietro VALUES(20, 8, 'telicz');

INSERT INTO GeoPietro VALUES(21, 9, 'szejnwud');
INSERT INTO GeoPietro VALUES(22, 9, 'homer');

INSERT INTO GeoPietro VALUES(23, 10, 'gorst');
INSERT INTO GeoPietro VALUES(24, 10, 'ludford');

INSERT INTO GeoPietro VALUES(25, 11, '');

INSERT INTO GeoPietro VALUES(26, 12, 'lochkow');
INSERT INTO GeoPietro VALUES(27, 12, 'prag');
INSERT INTO GeoPietro VALUES(28, 12, 'ems');

INSERT INTO GeoPietro VALUES(29, 13, 'eifel');
INSERT INTO GeoPietro VALUES(30, 13, 'żywet');

INSERT INTO GeoPietro VALUES(31, 14, 'fran');
INSERT INTO GeoPietro VALUES(32, 14, 'famen');

INSERT INTO GeoPietro VALUES(33, 15, 'turnej');
INSERT INTO GeoPietro VALUES(34, 15, 'wizen');
INSERT INTO GeoPietro VALUES(35, 15, 'serpuchow');

INSERT INTO GeoPietro VALUES(36, 16, 'baszkir');
INSERT INTO GeoPietro VALUES(37, 16, 'moskow');
INSERT INTO GeoPietro VALUES(38, 16, 'kasimow');
INSERT INTO GeoPietro VALUES(39, 16, 'gżel');

INSERT INTO GeoPietro VALUES(40, 17, 'assel');
INSERT INTO GeoPietro VALUES(41, 17, 'sakmar');
INSERT INTO GeoPietro VALUES(42, 17, 'artinsk');
INSERT INTO GeoPietro VALUES(43, 17, 'kungur');

INSERT INTO GeoPietro VALUES(44, 18, 'road');
INSERT INTO GeoPietro VALUES(45, 18, 'word');
INSERT INTO GeoPietro VALUES(46, 18, 'kapitan');

INSERT INTO GeoPietro VALUES(47, 19, 'wucziaping');
INSERT INTO GeoPietro VALUES(48, 19, 'czangsing');

INSERT INTO GeoPietro VALUES(49, 20, 'ind');
INSERT INTO GeoPietro VALUES(50, 20, 'olenek');

INSERT INTO GeoPietro VALUES(51, 21, 'anizyk');
INSERT INTO GeoPietro VALUES(52, 21, 'ladyn');

INSERT INTO GeoPietro VALUES(53, 22, 'karnik');
INSERT INTO GeoPietro VALUES(54, 22, 'noryk');
INSERT INTO GeoPietro VALUES(55, 22, 'retyk');

INSERT INTO GeoPietro VALUES(56, 23, 'hettang');
INSERT INTO GeoPietro VALUES(57, 23, 'synemur');
INSERT INTO GeoPietro VALUES(58, 23, 'pliensbach');
INSERT INTO GeoPietro VALUES(59, 23, 'toark');

INSERT INTO GeoPietro VALUES(60, 24, 'aalen');
INSERT INTO GeoPietro VALUES(61, 24, 'bajos');
INSERT INTO GeoPietro VALUES(62, 24, 'baton');
INSERT INTO GeoPietro VALUES(63, 24, 'kelowej');

INSERT INTO GeoPietro VALUES(64, 25, 'oksford');
INSERT INTO GeoPietro VALUES(65, 25, 'kimeryd');
INSERT INTO GeoPietro VALUES(66, 25, 'tyton');

INSERT INTO GeoPietro VALUES(67, 26, 'berrias');
INSERT INTO GeoPietro VALUES(68, 26, 'walanżyn');
INSERT INTO GeoPietro VALUES(69, 26, 'hoteryw');
INSERT INTO GeoPietro VALUES(70, 26, 'barrem');
INSERT INTO GeoPietro VALUES(71, 26, 'apt');
INSERT INTO GeoPietro VALUES(72, 26, 'alb');

INSERT INTO GeoPietro VALUES(73, 27, 'cenoman');
INSERT INTO GeoPietro VALUES(74, 27, 'turon');
INSERT INTO GeoPietro VALUES(75, 27, 'koniak');
INSERT INTO GeoPietro VALUES(76, 27, 'santon');
INSERT INTO GeoPietro VALUES(77, 27, 'kampan');
INSERT INTO GeoPietro VALUES(78, 27, 'mastrycht');

INSERT INTO GeoPietro VALUES(79, 28, 'dan');
INSERT INTO GeoPietro VALUES(80, 28, 'zeland');
INSERT INTO GeoPietro VALUES(81, 28, 'tanet');

INSERT INTO GeoPietro VALUES(82, 29, 'iprez');
INSERT INTO GeoPietro VALUES(83, 29, 'lutet');
INSERT INTO GeoPietro VALUES(84, 29, 'barton');
INSERT INTO GeoPietro VALUES(85, 29, 'priabon');

INSERT INTO GeoPietro VALUES(86, 30, 'rupel');
INSERT INTO GeoPietro VALUES(87, 30, 'szat');

INSERT INTO GeoPietro VALUES(88, 31, 'akwitan');
INSERT INTO GeoPietro VALUES(89, 31, 'burdygał');
INSERT INTO GeoPietro VALUES(90, 31, 'lang');
INSERT INTO GeoPietro VALUES(91, 31, 'serrawal');
INSERT INTO GeoPietro VALUES(92, 31, 'torton');
INSERT INTO GeoPietro VALUES(93, 31, 'messyn');

INSERT INTO GeoPietro VALUES(94, 32, 'zankl');
INSERT INTO GeoPietro VALUES(95, 32, 'piacent');

INSERT INTO GeoPietro VALUES(96, 33, 'gelas');
INSERT INTO GeoPietro VALUES(97, 33, 'kalabr');
INSERT INTO GeoPietro VALUES(98, 33, 'chiban');
INSERT INTO GeoPietro VALUES(99, 33, 'późny');

INSERT INTO GeoPietro VALUES(100, 34, 'grenland');
INSERT INTO GeoPietro VALUES(101, 34, 'northgrip');
INSERT INTO GeoPietro VALUES(102, 34, 'megalaj');

select * from geopietro;

CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL
JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );

select * from GeoTabela;

#PK dla tabeli glownej

ALTER TABLE GeoTabela
ADD PRIMARY KEY(id_pietro);

#tworzenie tabeli dziesiec ktora wykorzystamy do utworzenia tabeli millon

CREATE TABLE Dziesiec
(
cyfra INTEGER NOT NULL
);

drop table Dziesiec;
select * from Dziesiec;

INSERT INTO Dziesiec VALUES(0);
INSERT INTO Dziesiec VALUES(1);
INSERT INTO Dziesiec VALUES(2);
INSERT INTO Dziesiec VALUES(3);
INSERT INTO Dziesiec VALUES(4);
INSERT INTO Dziesiec VALUES(5);
INSERT INTO Dziesiec VALUES(6);
INSERT INTO Dziesiec VALUES(7);
INSERT INTO Dziesiec VALUES(8);
INSERT INTO Dziesiec VALUES(9);

CREATE TABLE Milion
(liczba int);

INSERT INTO Milion SELECT
	a1.cyfra+10*a2.cyfra+100*a3.cyfra+1000*a4.cyfra+10000*a5.cyfra+100000*a6.cyfra AS liczba
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec
a6 ;
select * from Milion ORDER BY liczba;

#	ZAPYTANIE 1
SELECT COUNT(*) FROM Milion
INNER JOIN GeoTabela ON (MOD(Milion.liczba, 102) = GeoTabela.id_pietro);

#	ZAPYTANIE 2
SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON
(mod(Milion.liczba,102)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;

#	ZAPYTANIE 3
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,102)=
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,102)=(id_pietro));

SELECT COUNT(*) FROM Milion
WHERE Milion.liczba % 102 IN
(SELECT GeoPietro.id_pietro FROM GeoPietro
NATURAL JOIN GeoEpoka
NATURAL JOIN GeoOkres
NATURAL JOIN GeoEra
NATURAL JOIN GeoEon);


CREATE INDEX index_eon ON GeoEon(id_eon);

CREATE INDEX index_era ON GeoEra(id_era);
CREATE INDEX index_era_2 ON GeoEra(id_eon);

CREATE INDEX index_okres ON GeoOkres(id_okres);
CREATE INDEX index_okres_2 ON GeoOkres(id_era);

CREATE INDEX index_epoka ON GeoEpoka(id_epoka);
CREATE INDEX index_epoka_2 ON GeoEpoka(id_okres);

CREATE INDEX index_pietro ON GeoPietro(id_pietro);
CREATE INDEX index_pietro_2 ON GeoPietro(id_epoka);