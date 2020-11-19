--Example 6.1
SELECT * FROM Employee

--Example 6.2
USE AdventureWorks2016CTP3
--Employee table contains the detail of employee.
--This statement retrieves all the rows of the table Employee.
SELECT * FROM Employee

--Example 6.3
/* Employee table contains the details of an employee.
This statement retrieves all the rows of the table Employee. */
SELECT * FROM Employee

--Example 6.4
CREATE TABLE Contacts(
	MailID varchar(20),
	Name text,
	TelephoneNumber int)

--Example 6.5
ALTER TABLE Contacts
ADD FaxNumber int

--Example 6.6
DROP TABLE Contacts

--Example 6.7
USE AdventureWorks
SELECT * Employee

--Example 6.8
USE AdventureWorks
INSERT INTO Contacts VALUES('john@abc.com','John',5432677,5432678)

--Example 6.9
UPDATE Contacts
SET TelephoneNumber = 5432679
WHERE Name LIKE 'John'

--Example 6.10
DELETE FROM Contacts
WHERE TelephoneNumber = 5432679

--Example 6.11
CREATE TABLE NewEmployees (
	EmployeeID smallint,
	FirstName char(10),
	LastName char(10),
	Department varchar(50),
	HiredDate datetime,
	Salary money);
INSERT INTO NewEmployees VALUES(11,'Kevin','Blaine','Research','2006-07-31 00:00:00.000',54000);
WITH EmployeeTemp (EmployeeID,FirstName,LastName,Department,HiredDate, Salary) AS (SELECT * FROM NewEmployees)
INSERT INTO Employee
SELECT * FROM EmployeeTemp

--Example6.12
GRANT SELECT
ON Employee
TO JOHN

--Example 6.13
REVOKE SELECT
ON Employee
FROM JOHN

--Example 6.14
DENY SELECT
ON Employee
TO JOHN

--Example 6.15
SELECT * FROM Employee

--Example 6.16
USE AdventureWorks
GO
SELECT * FROM Employee
GO

--Example 6.17
DECLARE @PriceChangeDetails TABLE
(
	HotelNumber int,
	Price money,
	NewPrice money
)
UPDATE Hotels
SET Price = 3000
OUTPUT INSERTED.HotelNumber,DELETED.Price, INSERTED.Price
INTO @PriceChangeDetails
WHERE HotelNumber = 101
SELECT * FROM @PriceChangeDetails