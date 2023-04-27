
--tworzenie nowego schematu o nazwie ksiegowosc
CREATE SCHEMA ksiegowosc;



--nowe tabele dla schematu ksiegowosc, reszta taka sama jak dla rozliczenia

CREATE TABLE ksiegowosc.pracownicy (id_pracownika VARCHAR(8) PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(100) NOT NULL,
	telefon CHAR(12) NULL);

	--funcja ktora powinna dzialac a nie dziala :(
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela pracownikow ';
COMMENT ON COLUMN ksiegowosc.pracownicy.id_pracownika IS 'klucz glowny tabeli';
COMMENT ON COLUMN ksiegowosc.pracownicy.imie IS 'Imie pracownika';
COMMENT ON COLUMN ksiegowosc.pracownicy.nazwisko IS 'Nazwisko pracownika';
COMMENT ON COLUMN ksiegowosc.pracownicy.adres IS 'Adres pracownika';
COMMENT ON COLUMN ksiegowosc.pracownicy.telefon IS 'Telefon pracownika';

-- w ten sposob tworzylem wszystkie komentarze do tabel
EXEC sys.sp_addextendedproperty
@name = 'Tabela pracownikow',
@value = 'Informacja o pracownikach.',
@level0type = 'SCHEMA', @level0name = 'ksiegowosc',
@level1type = 'TABLE', @level1name = 'pracownicy';
GO

CREATE TABLE ksiegowosc.godzina (id_godziny VARCHAR(6) PRIMARY KEY, data DATE NOT NULL, liczba_godzin SMALLINT NOT NULL, id_pracownika VARCHAR(8) NOT NULL);

EXEC sys.sp_addextendedproperty
@name = 'Tabela godzin',
@value = 'Ilosc godzin przepracowanych ',
@level0type = 'SCHEMA', @level0name = 'ksiegowosc',
@level1type = 'TABLE', @level1name = 'godzina';
GO


CREATE TABLE ksiegowosc.pensje (id_pensji VARCHAR(8) PRIMARY KEY, stanowisko VARCHAR(50) NOT NULL, kwota SMALLMONEY NOT NULL, id_premii VARCHAR(8) NULL);

EXEC sys.sp_addextendedproperty
@name = 'Tabela pensji',
@value = 'Informacja o pensjach pracownikow.',
@level0type = 'SCHEMA', @level0name = 'ksiegowosc',
@level1type = 'TABLE', @level1name = 'pensje';
GO

CREATE TABLE ksiegowosc.premie (id_premii VARCHAR(8) PRIMARY KEY, rodzaj VARCHAR(30) NULL,kwota SMALLMONEY NOT NULL);

EXEC sys.sp_addextendedproperty
@name = 'Tabela premii',
@value = 'Informacja o premiach pracownikow.',
@level0type = 'SCHEMA', @level0name = 'ksiegowosc',
@level1type = 'TABLE', @level1name = 'premie';
GO

CREATE TABLE ksiegowosc.wynagrodzenia (
	id_wynagrodzenia VARCHAR(6) PRIMARY KEY,
	data DATE NOT NULL,
	id_pracownika VARCHAR(8) NOT NULL,
	id_godziny VARCHAR(6) NOT NULL,
	id_pensji VARCHAR(8) NOT NULL,
	id_premii VARCHAR(8),
);

EXEC sys.sp_addextendedproperty
@name = 'Tabela wynagrodzenia',
@value = 'Informacja o wynagrodzeniach pracownikow.',
@level0type = 'SCHEMA', @level0name = 'ksiegowosc',
@level1type = 'TABLE', @level1name = 'wynagrodzenia';
GO

SELECT * FROM ksiegowosc.wynagrodzenia


--klucze obce, 1 mamy dla godziny reszta zostaje dla wynagrodzen
--kazdy typ zmiennej musi sie pokrywac w stosunku do przydzielania kluczyc obcych

ALTER TABLE ksiegowosc.godzina ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godzina(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

