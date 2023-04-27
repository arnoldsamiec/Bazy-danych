--start

--zad 6A
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--zad 6B

SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenia.id_pensji=pensje.id_pensji
WHERE kwota>1000;

--zad 6C

SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenia.id_premii
WHERE pensje.kwota>2000  AND wynagrodzenia.id_premii IS NULL;

--kazdy pracownik ma premie, dlatego nie pokazuje sie nikt bo nie ma wartosci NULL
SELECT * FROM ksiegowosc.premie

--zad 6D

SELECT * FROM ksiegowosc.pracownicy
WHERE pracownicy.imie LIKE 'J%'

--zad 6E

SELECT * FROM ksiegowosc.pracownicy
WHERE pracownicy.imie LIKE '%a' AND pracownicy.nazwisko LIKE '%n%'

--zad 6F

SELECT imie, nazwisko, godzina.liczba_godzin - 160 FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.godzina ON godzina.id_godziny=wynagrodzenia.id_godziny

--zad 6G

SELECT imie,nazwisko FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
WHERE pensje.kwota BETWEEN	1500 and 3000;

--zad 6H

SELECT imie,nazwisko FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenia.id_premii
LEFT JOIN ksiegowosc.godzina ON godzina.id_godziny=wynagrodzenia.id_godziny 
WHERE liczba_godzin > 160 AND wynagrodzenia.id_premii Is NULL;

-- nie wyswietla sie nikt gdyz tak jak w punkcie C kazdy pracownik otrzymal premie

--zad 6I

SELECT pracownicy.*,pensje.kwota AS pensja FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
ORDER BY pensje.kwota;

--zad 6J

SELECT pracownicy.*,pensje.kwota AS pensja,premie.kwota AS premia FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenia.id_premii
ORDER BY pensje.kwota,premie.kwota DESC;

--desc skrot od slowa descending - malejaco

--zad 6K

SELECT COUNT(pracownicy.id_pracownika) AS zatrudnionych,pensje.stanowisko AS premia FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
GROUP BY pensje.stanowisko

--zad 6L

SELECT pensje.stanowisko ,AVG(pensje.kwota) AS Srednia_p³aca, MIN(pensje.kwota) AS Minimalna_p³aca, MAX(pensje.kwota) AS Maksymalna_p³aca FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
GROUP BY pensje.stanowisko
HAVING pensje.stanowisko='Shaman';

--zad 6M
SELECT SUM(pensje.kwota) AS suma_wynagrodzen FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji

--zad 6N

SELECT pensje.stanowisko, SUM(pensje.kwota) AS wynagrodzenie_klasy FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
GROUP BY pensje.stanowisko

--zad 6O

SELECT pensje.stanowisko, COUNT(premie.id_premii) AS ilosc_premii FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika=wynagrodzenia.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenia.id_pensji
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenia.id_premii
GROUP BY pensje.stanowisko


--zad 6P

SELECT * FROM ksiegowosc.premie

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'


DELETE ksiegowosc.pracownicy
FROM ksiegowosc.pracownicy 
LEFT OUTER JOIN ksiegowosc.wynagrodzenia  ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
LEFT OUTER JOIN ksiegowosc.pensje  ON pensje.id_pensji=wynagrodzenia.id_pensji
WHERE pensje.kwota < 1200;

SELECT * FROM ksiegowosc.pensje