select * from ksiegowosc.pracownicy3

alter table ksiegowosc.pracownicy
drop table ksiegowosc.pracownicy

alter table ksiegowosc.pracownicy
add telefon VARCHAR(12) not null

update ksiegowosc.pracownicy
set
telefon = 941006998, 967006998, 917894997,

--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48)

select * from ksiegowosc.pracownicy1
alter table ksiegowosc.pracownicy1 
alter column telefon varchar(16);
update ksiegowosc.pracownicy1 
set telefon = concat('+48', telefon);

select * from ksiegowosc.pracownicy1

--b) Zmodyfikuj atrybut telefonw tabeli pracownicytak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’ 

update ksiegowosc.pracownicy4
set telefon = concat(
    substring(telefon, 1, 3),
    '-',
    substring(telefon, 4, 3),
    '-',
    substring(telefon, 7, 3)
);

select * from ksiegowosc.pracownicy4


--c) Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter

select top 1 
id_pracownika, upper(imie) as imie, upper(nazwisko) as nazwisko, upper(adres) as adres, telefon
from ksiegowosc.pracownicy1
order by len(nazwisko) desc;

--d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

select 
hashbytes('MD5',imie) as imie, 
hashbytes('MD5',nazwisko) as nazwisko, 
hashbytes('MD5',adres) as adres, 
hashbytes('MD5',telefon) as telefon,
hashbytes('MD5', cast(kwota AS VARCHAR(16))) AS kwota 
from ksiegowosc.pracownicy1 osoba
join ksiegowosc.wynagrodzenia kwota
on kwota.id_pracownika = osoba.id_pracownika
join ksiegowosc.pensje pensje
on kwota.id_pensji = pensje.id_pensji;

--f) Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne.

select * from ksiegowosc.pracownicy as osoba
left join ksiegowosc.wynagrodzenia as kwota 
on osoba.id_pracownika = kwota.id_pracownika
left join ksiegowosc.pensje as pensje 
on pensje.id_pensji = kwota.id_pensji
left join ksiegowosc.premie as premia 
on premia.id_premii = kwota.id_premii

--g) wygeneruj raport (zapytanie), które zwróciw wyniki treœæ wg poni¿szego szablonu:
--	Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma³ pensjê ca³kowit¹ na kwotê 7540 z³, 
--	gdzie wynagrodzenie zasadnicze wynosi³o: 5000 z³, premia: 2000 z³, nadgodziny: 540 z³
