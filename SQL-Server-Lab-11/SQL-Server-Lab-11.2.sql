USE Northwind
GO
--TAO INSERT TRIGGER 
CREATE TRIGGER checkCustomerOnInsert
ON Customers
FOR INSERT
AS
	BEGIN
		IF EXISTS(SELECT * FROM Customers WHERE Phone IS NULL)
		BEGIN
			PRINT 'Please insert phone number';
			ROLLBACK TRANSACTION;
		END
	END
GO
--TAO UPDATE TRIGGER
CREATE TRIGGER checkCustomerContryOnUpdate
ON Customers
FOR UPDATE
AS
	BEGIN
		SELECT Country FROM Customers
		WHERE Country = 'France'
		BEGIN
			PRINT 'Can not update table You do not have permission'
			ROLLBACK TRANSACTION
		END
	END
GO
--CHEN COT ACTIVE VAO BANG CUSTOMERS
ALTER TABLE Customers
	ADD Active INT DEFAULT(1);
GO
--TAO TRIGER checkCustomerInsteadOfDelete
CREATE TRIGGER checkCustomerInsteadOfDelete
ON Customers
FOR DELETE 
AS 
	BEGIN
		BEGIN
			PRINT N'unactive'
			ROLLBACK TRANSACTION
			UPDATE Customers SET Active = '0'  WHERE CustomerID IN (SELECT CustomerID FROM deleted )
		END 
	END
GO
--THAY DOI MUC DO UU TIEN CUA checkCustomerContryOnUpdate LEN MUC CAO NHAT
sp_settriggerorder  @triggername= 'checkCustomerContryOnUpdate', 
					@order='First', 
					@stmttype = 'UPDATE';  
--TAO TRIGGER SAFETY
CREATE TRIGGER Safety
ON DATABASE 
FOR CREATE_TABLE, DROP_TABLE, ALTER_TABLE
AS
	BEGIN
		PRINT 'Can not update table or You do not have permission'
		ROLLBACK TRANSACTION
	END
GO