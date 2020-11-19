CREATE DATABASE Store
GO
USE Store
GO
--TAO BANG FACTORY
CREATE TABLE Factory(
	FactoryID VARCHAR(5),
	FactoryName VARCHAR(30),
	Address VARCHAR(150),
	PhoneNumber VARCHAR(15),
	CONSTRAINT pk_Factory PRIMARY KEY (FactoryID)
	)
--TAO BANG PRODUCT
CREATE TABLE Product(
	ProductID VARCHAR(5),
	ProductName VARCHAR(30),
	FactoryID VARCHAR(5),
	Description VARCHAR(150),
	Unit VARCHAR(5),
	Price MONEY,
	Amount INT,
	CONSTRAINT pk_Product PRIMARY KEY (ProductID)
	)
GO
--THEM KHOA NGOAI CHO BANG PRODUCT
ALTER TABLE Product	ADD CONSTRAINT fk_Product FOREIGN KEY (FactoryID) REFERENCES Factory(FactoryID)
--CHEN DU LIEU BANG FACTORY
INSERT INTO Factory VALUES ('F123A', 'Asus', '1925 Grassland Pkwy Alpharetta GA 30004', '018006588')
INSERT INTO Factory VALUES ('F124A', 'MSI', 'Taiwan', '01900633402')
INSERT INTO Factory VALUES ('F125A', 'Acer', 'Taiwan', '01900969601')
INSERT INTO Factory VALUES ('F126A', 'Dell', 'USA', '01800545455')

--CHEN DU LIEU VAO BANG PRODUCT
INSERT INTO Product VALUES ('MT450', 'May Tinh T450','F123A', 'May Nhap Cu', 'Chiec', 1000, 10)
INSERT INTO Product VALUES ('DT567',  'Dien Thoai Nokia 5670','F123A', 'Dien Thoai Dang Hot', 'Chiec', 200, 200)
INSERT INTO Product VALUES ('MI450', 'May In Samsung 450', 'F123A', 'May In Dang Loai Binh', 'Chiec', 100, 10)
GO
--HIEN THI TAT CA CAC HANG SX
SELECT FactoryID, FactoryName
FROM Factory
GO
--HIEN THI TAT CA CAC SAN PHAM
SELECT ProductID, ProductName
FROM Product
GO
--DANH SACH HANG THEO THU TU NGUOC ALPHABET
SELECT FactoryID, FactoryName
FROM Factory
ORDER BY FactoryName DESC
GO
--SP THEO THU TU GIA GIAM DAN
SELECT ProductID, ProductName, Price
FROM Product
ORDER BY Price DESC
GO
--THONG TIN HANG ASUS
SELECT *FROM Factory
WHERE FactoryName = 'Asus'
GO
--SAN PHAM CON IT HON 11 CHIEC TRONG KHO
SELECT ProductID, ProductName, Amount
FROM Product
WHERE Amount < 11
GO
--GIA TIEN TUNG MAT HANG >0
ALTER TABLE Product 
	ADD CONSTRAINT ck_Price CHECK(Price>0)
GO
--THAY DOI SDT PHAI BAT DAU = 0
ALTER TABLE Factory
	ADD CONSTRAINT ck_Phone CHECK(PhoneNumber LIKE '0%')
GO
--TAO INDEX TEN HANG VA MO TA
CREATE INDEX Index_Product ON Product(ProductName, Description)
GO
--TAO VIEW SP
CREATE VIEW view_SanPham AS
SELECT ProductID, ProductName, Price
FROM Product
GO
--TAO VIEW SP,HANG
CREATE VIEW view_SanPham_Hang AS
SELECT ProductID, ProductName, FactoryName
FROM Factory JOIN Product ON Factory.FactoryID = Product.FactoryID
GO
select*from view_SanPham_Hang
