-- 1.Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki 
-- pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej 
-- TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.

select * from HumanResources.EmployeePayHistory
select * from Person.Person
select * from HumanResources.Employee

;with zadannie1
--(BusinessEntityID,FirstName, LastName,JobTitle,BirthDate,MaritalStatus,Gender,HireDate,Rate) uzywam tych kolumn
as
(
	select placa.BusinessEntityID,FirstName, LastName,JobTitle,BirthDate,MaritalStatus,Gender,HireDate,Rate from HumanResources.EmployeePayHistory as placa
	join Person.Person as osob 
	on placa.BusinessEntityID = osob.BusinessEntityID
	join HumanResources.Employee as osoba
	on placa.BusinessEntityID = osoba.BusinessEntityID
)

-- w ten sposob dodajemy nasze wybrane dane do nowej tabeli
select * into #TempEmployeeInfo from zadannie1;

select * from #TempEmployeeInfo;

drop table #TempEmployeeInfo;


-- 2.Uzyskaj informacje na temat przychodów ze sprzeda¿y wed³ug firmy i kontaktu
-- (za pomoc¹ CTE i bazy AdventureWorksLT). Wynik powinien wygl¹daæ nastêpuj¹co:


select * from SalesLT.Customer

select * from SalesLT.SalesOrderHeader

;with zadanko2
--(CompanyContact,Revenue)
as
(
--	companyname jest w tabeli SalesLT.Customer, a TotalDue w SalesLT.SalesOrderHeader
--	nawiasy aby imie i nazwisko bylo tak jak na zdj_przyklad 

	select concat (CompanyName, ' (', FirstName, LastName, ')') as CompanyContact, TotalDue as Revenue 
	from SalesLT.Customer as osoba
	join SalesLT.SalesOrderHeader as przychod
	on osoba.CustomerID = przychod.CustomerID
)

--w kolejnosci po companycontact zeby jak w przykladzie
select * from zadanko2 order by CompanyContact;


--3. Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów.Wykorzystaj CTE i bazê AdventureWorksLT

select * from SalesLT.ProductCategory
select * from SalesLT.Product

;with zadanko3
--(Category, SalesValue)
as
(
	select kata.name as Category, sprzedarz.LineTotal as SalesValue
	from SalesLT.ProductCategory kata
	join SalesLT.Product produkt
	on kata.ProductCategoryID = produkt.ProductCategoryID
	join SalesLT.SalesOrderDetail sprzedarz
	on produkt.ProductID=sprzedarz.ProductID
)
--12 cyfr, z czego 2 cyfry po przecinku
-- funkcja cast() konwertuje wynik na inny typ
select Category, cast(round(sum(SalesValue), 2) as numeric(12, 2)) as SalesValue from zadanko3
group by Category;
