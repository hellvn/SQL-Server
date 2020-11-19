SELECT * FROM Person.ContactSELECT Title, FirstName, MiddleName, LastName, EmailAddress FROM Person.
Contact
SELECT Title + '. '+FirstName+''+LastName AS 'Person Name' FROM Person.
Contact
SELECT * FROM Person.AddressSELECT DISTINCT (City) FROM Person.Address SELECT TOP 10 * FROM Person.Address SELECT TOP 25 PERCENT * FROM Person.AddressSELECT AVG(Rate) FROM HumanResources.EmployeePayHistorySELECT COUNT(EmployeeID) AS TitleCount FROM HumanResources.Employee