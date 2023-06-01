--Napisz zapytanie ,które wykorzystuje transakcjê (zaczynaj¹),
--a nastêpnie aktualizuje cenê produktu o ProductID równym 680 
--w tabeli Production.Product o 10% i nastêpnie zatwierdza transakcjê.

BEGIN TRANSACTION;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;

COMMIT;

select * from Production.Product
WHERE ProductID = 680;

----------zad2

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE ProductID = 707;

ROLLBACK;--wycofuje transakcjê i przywraca stan bazy danych do stanu przed rozpoczêciem transakcji

select * from Production.Product
WHERE ProductID = 707;


-----zad3
SET IDENTITY_INSERT Production.Product ON-- wyswietla sie komunikat i trzeba tak ustawic

BEGIN TRANSACTION;
	INSERT INTO Production.Product(rowguid)--dodaje nowy wiersz
	VALUES(NEWID());
	
	INSERT INTO Production.Product(ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate)
	VALUES(1000,'Pompka rower', 'PP-TREE-22', 1, 1, 500, 250, '30.30', '60.60', 1, '2023-06-01','AAAA84C6-1D11-AAF2-BAEE-AAAAF494AAAD','2023-02-08 12:11:36.827')

COMMIT;

select * from Production.Product;

----zad4

BEGIN TRANSACTION;

DECLARE @TotalCost smallmoney;

SELECT @TotalCost = SUM(StandardCost) FROM Production.Product;

IF @TotalCost <= 50000
BEGIN
    UPDATE Production.Product
    SET StandardCost = StandardCost * 1.1;

    COMMIT;
END
ELSE
BEGIN
    ROLLBACK;
END

-----zad5

BEGIN TRANSACTION;

DECLARE @ProductNumber NVARCHAR(50);
SET @ProductNumber = 'AA-TREE-22';

IF EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = @ProductNumber)
BEGIN
    ROLLBACK;
END
ELSE
BEGIN
    INSERT INTO Production.Product(ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate)
    VALUES (1002, 'test test', @ProductNumber, 1, 1, 500, 250, 30.30, 60.60, 1, '2023-06-01', 'cccc84C6-1D11-AAF2-BAEE-AAAAF494AAAD', '2023-02-08 12:11:36.827');

    COMMIT;
END

select * from Production.Product
Where ProductID = 1002;

------------zad6
select * from [Sales].[SalesOrderDetail]

BEGIN TRANSACTION;

IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    ROLLBACK;
END
ELSE
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty + 1;

    COMMIT;
END

--------zad7

BEGIN TRANSACTION;

DECLARE @sredniKoszt DECIMAL(10, 3);
DECLARE @iloscProduktow INT;

SELECT @sredniKoszt = AVG(StandardCost) FROM Production.Product;
SELECT @iloscProduktow = COUNT(*) FROM Production.Product WHERE StandardCost > @sredniKoszt;

IF @iloscProduktow > 10
BEGIN
    ROLLBACK;
END
ELSE
BEGIN
    DELETE FROM Production.Product WHERE StandardCost > @sredniKoszt;

    COMMIT;
END

select * from [Production].[Product];