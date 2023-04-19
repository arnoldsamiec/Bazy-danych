--zad5 wyswietlenie nazwiska i adresu pracownika
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--zad6 wypisanie daty z dniem i miesiacem
SELECT DATEPART ( dw , data ) as 'dzien ',
	DATEPART ( mm , data ) as 'miesiac'
FROM rozliczenia.godziny;

-- pierwsza kolumna odpowiada dniu w tygodniu
-- druga natomiast mowi jaki to miesiac w roku

--zad7 dodanie nowej kolumny netto + zmiana nazwy na kwota na kwota brutto
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
-- kwota na kwota_brutto

-- dodaje nowa kolumne o nazwie kwota_netto i przelicza brutto jako podatek 32%
ALTER TABLE rozliczenia.pensje
ADD kwota_netto AS (pensje.kwota_brutto * 0.68);


SELECT * FROM rozliczenia.pensje
-- aby wyswietlic zmiane