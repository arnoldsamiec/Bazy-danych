CREATE SCHEMA cw7;

-------------------------------------------------------------------
CREATE FUNCTION cw7.fibonacci (@n BIGINT)
RETURNS BIGINT
AS
BEGIN
    DECLARE @result BIGINT;

    IF @n <= 0
        SET @result = 0;
    ELSE IF @n = 1
        SET @result = 1;
    ELSE
        SET @result = cw7.fibonacci(@n - 1) + cw7.fibonacci(@n - 2);

    RETURN @result;
END;

CREATE PROCEDURE cw7.Wypisz (@i bigINT)
AS
BEGIN
    DECLARE @fiboValue BIGINT;
	DECLARE @index BIGINT = 1;
    WHILE @index <= @i
    BEGIN
        SET @fiboValue = cw7.fibonacci(@index);
        PRINT @fiboValue;
        SET @index = @index + 1;
    END
END;

DROP PROCEDURE IF EXISTS cw7.Wypisz;

DROP FUNCTION IF EXISTS cw7.fibonacci;
EXEC cw7.Wypisz @i = 10;

--2. Napisz trigger DML, który po wprowadzeniu danych do tabeli 
--Personszmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami. 


select * from Person.Person;


CREATE TRIGGER duzaLitera
ON Person.Person
AFTER INSERT
AS
BEGIN

    UPDATE Person.Person
    SET LastName = UPPER(Person.LastName)
    
END;

INSERT INTO Person.BusinessEntity(rowguid)
VALUES (NEWID());

INSERT INTO Person.Person(BusinessEntityID,PersonType,NameStyle,FirstName,MiddleName,LastName,EmailPromotion,ModifiedDate) 
	VALUES (20779,'IN',0,'Wojciech','John','Smok',2,2015-01-09);


--Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie,
--je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’o wiêcej ni¿ 30%.

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN

	DECLARE @staryTaxRate smallmoney;
    DECLARE @nowyTaxRate smallmoney;

    SELECT @staryTaxRate = TaxRate FROM deleted;
    SELECT @nowyTaxRate = TaxRate FROM inserted;

    IF ABS((@nowyTaxRate - @staryTaxRate) / @staryTaxRate) > 0.3
    BEGIN
        RAISERROR('blad pole taxRate nie moze zostac zmienione', 16, 1); -- 16 oznacza sredni blad
        ROLLBACK;
    END;
END;

UPDATE Sales.SalesTaxRate 
SET TaxRate =  70.00
WHERE SalesTaxRateID = 30;
