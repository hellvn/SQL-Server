CREATE DATABASE ToyzUnlimited
GO
USE ToyzUnlimited
GO
CREATE TABLE Toys(
	ProductCode VARCHAR(5),
	Name VARCHAR(30),
	Category VARCHAR(30),
	Manufacturer VARCHAR(40),
	AgeRange VARCHAR(15),
	UnitPrice MONEY,
	Netweight INT,
	QtyOnHand INT,
	CONSTRAINT pk_Toys PRIMARY KEY (ProductCode)
	)
GO
INSERT INTO Toys VALUES
('PZ001', 'Monopoly Game', 'Puzzles', 'Hasbro', 'Ages 8 and up', 19.99, 929, 21),
('PZ002', 'Sorry! Game', 'Puzzles', 'Hasbro', '6 to 98 years', 9.97, 479, 30),
('PZ003', 'UNO Color & Number Matching', 'Puzzles', NULL, '5-11 Years', 5.44, 160, 22),
('BT001', 'Nerf N-strike Elite Infinus', 'Blaster', 'Hasbro', '8 to 98 years', 39.98, 2865, 50),
('BT002', 'FullyLoaded Tactical Vest', 'Blaster', 'wishbox co.', '5 years', 20.99, 900, 33),
('BT003', 'Judge Nerf Doomlands Blaster','Blaster','Hasbro','8 years', 22.99,1300,43),
('BT004', 'Megalodon Nerf', 'Blaster', 'Hasbro', '8 - 99 Years', 39.99, 1587, 500),
('VT001', 'Tractor Vehicle', 'Vehicles', 'Green Toys', '1 - 8 years', 15.99, 431, 131),
('VT002', 'Scooper Construction Truck', 'Vehicles', 'Green Toys', '2 - 10 years', 7.95, 362, 31),
('VT003', 'Recycling Truck', 'Vehicles', 'Green Toys', '1 - 10 years', 29.42, 744, 121),
('VT004', 'Fire Truck with Flatbed Truck', 'Vehicles', 'Green Toys', '1 - 8 years', 26.10, 2036, 231),
('EL001', 'Tamagotchi Original Majestic', 'Electric', 'Bandai America Inc.', '8 years and up', 29.61, 90, 69),
('EL002', 'KidiBuzz G2', 'Electric', 'VTech', '4 - 9 years', 80.97, 380, 35),
('EL003', 'Handheld Game Console', 'Electric', 'JAMSWALL', '1 - 3 years', 24.99, 250, 241),
('EL004', 'Robot Toy', 'Electric', 'REMOKING', '3 years and up', 29.99, 370, 23)
GO
--TAO PROCEDURE HEAVY TOYS
CREATE PROCEDURE HeavyToys AS
SELECT * FROM Toys WHERE(Netweight >500) 
GO
EXEC HeavyToys
GO
--TAO PROCEDURE PRICE INCREASE
CREATE PROCEDURE PriceIncrease AS
BEGIN 
UPDATE Toys 
SET UnitPrice *= 10 
END
GO
EXEC PriceIncrease
GO
--TAO PROCEDURE QTYONHAND
CREATE PROCEDURE QtyOnHand AS
BEGIN 
UPDATE Toys 
SET UnitPrice /= 5 
END
GO
EXEC QtyOnHand
GO
--THU TUC LUU TRU HE THONG SP_HELPTEXT
sp_helptext '[dbo].[HeavyToys]'
GO
sp_helptext '[dbo].[PriceIncrease]'
GO
sp_helptext '[dbo].[QtyOnHand]'
GO
--KHUNG NHIN HE THONG sys.sql_modules
SELECT  DEFINITION FROM sys.sql_modules
GO
--TAO PROCEDURE SpecificPriceIncrease
CREATE PROCEDURE SpecificPriceIncrease AS
BEGIN
	UPDATE Toys 
	SET UnitPrice = QtyOnHand + UnitPrice
END
GO
EXEC SpecificPriceIncrease
GO
--CHINH SUA THU TUC LUU TRU SpecificPriceIncrease
ALTER PROCEDURE SpecificPriceIncrease AS 
	UPDATE Toys 
	SET UnitPrice = QtyOnHand + UnitPrice
	SELECT ProductCode,Name,Category,Manufacturer,UnitPrice AS UnitPrice,QtyOnHand FROM Toys 
	WHERE QtyOnHand > 0
	SELECT @@ROWCOUNT 
GO
