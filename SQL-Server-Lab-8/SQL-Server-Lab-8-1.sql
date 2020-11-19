CREATE DATABASE BookStore
GO
USE BookStore
GO
--TAO BANG CUSTOMER
CREATE TABLE Customer(
	CustomerID INT IDENTITY,
	CustomerName VARCHAR(50), 
	Address VARCHAR(100),
	Phone VARCHAR(12)
	CONSTRAINT pk_Customer PRIMARY KEY (CustomerID)
	)
--TAO BANG BOOKS
CREATE TABLE Books(
	BookCode INT,
	Category VARCHAR(50),
	Author VARCHAR(50),
	Publisher vARCHAR(50),
	Title VARCHAR(100),
	Price INT,
	Instore INT
	CONSTRAINT pk_Books PRIMARY KEY (BookCode)
	)
--TAO BANG BOOK SOLD
CREATE TABLE BookSold(
	BookSoldID INT,
	CustomerID INT,
	BookCode INT,
	Date DATE,
	Price INT,
	Amount INT
	CONSTRAINT pk_BookSold PRIMARY KEY (BookSoldID)
	)
GO
--TAO KHOA NGOAI CHO BANG BookSold
ALTER TABLE BookSold ADD CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
ALTER TABLE BookSold ADD CONSTRAINT fk_BookCode FOREIGN KEY (BookCode) REFERENCES Books(BookCode)
--DINH DANG NGAY THANG
SET DATEFORMAT dmy
--CHEN DU LIEU CHO BANG CUSTOMER
INSERT INTO Customer(CustomerName, Address, Phone) VALUES ('Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478')
INSERT INTO Customer(CustomerName, Address, Phone) VALUES ('Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266')
INSERT INTO Customer(CustomerName, Address, Phone) VALUES ('Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476')
INSERT INTO Customer(CustomerName, Address, Phone) VALUES ('Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108')
INSERT INTO Customer(CustomerName, Address, Phone) VALUES ('Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738')
--CHEN DU LIEU VAO BANG BOOKS
INSERT INTO Books VALUES (1001, 'Fantasy', 'Neil Gaiman', 'Harpercollins Publishers Inc', 'Good Omens: The Nice and Accurate Prophecies of Agnes Nutter, Witch', 126000, 50)
INSERT INTO Books VALUES (1002, 'Fantasy', 'George R. R. Martin, Doug Wheatley', 'Random House', 'Fire & Blood: 300 Years Before A Game Of Thrones', 430000, 50)
INSERT INTO Books VALUES (2001, 'Romance', 'David Nicholls',  'Random House', 'One Day', 225600, 50)
INSERT INTO Books VALUES (2002, 'Romance', 'Jude Deveraux', 'Pocket Books', 'Secrets', 113900, 50)
INSERT INTO Books VALUES (2003, 'Romance', 'Debbie Macomber', 'Harlequin (UK)', 'On a Snowy Night', 211650, 50)
INSERT INTO Books VALUES (2004, 'Romance', 'Danielle Steel', 'Random House Inc', 'One Day at a Time', 100800, 50)
INSERT INTO Books VALUES (3001, 'Classics', 'Mary Shelley,Douglas Clegg', 'Penguin Books', 'Frankenstein', 104000, 50)
INSERT INTO Books VALUES (3002, 'Classics', 'Miguel de Cervantes Saavedra,Walter Starkie', 'Penguin Books', 'Don Quixote', 118150, 50)
INSERT INTO Books VALUES (3003, 'Classics', 'Joseph Heller', 'Grantham Book Services', 'Catch-22', 167450, 50)
INSERT INTO Books VALUES (3004, 'Classics', 'Victor Hugo', 'Simon And Schuster', 'Les Miserables', 88800, 50)
--CHEN DU LIEU VAO BANG BOOKSOLD
INSERT INTO BookSold VALUES (1304001, 1, 2002, '13/04/2020', 113900, 2)
INSERT INTO BookSold VALUES (1304002, 4, 2004, '13/04/2020', 100800, 5)
INSERT INTO BookSold VALUES (1304003, 1, 3001, '13/04/2020', 104000, 1)
INSERT INTO BookSold VALUES (1304004, 3, 2001, '13/04/2020', 225600, 3)
INSERT INTO BookSold VALUES (1304005, 2, 2002, '13/04/2020', 113900, 2)
INSERT INTO BookSold VALUES (1304006, 5, 2002, '13/04/2020', 113900, 2)
INSERT INTO BookSold VALUES (1304007, 1, 2002, '13/04/2020', 113900, 2)
INSERT INTO BookSold VALUES (1304008, 4, 2002, '13/04/2020', 113900, 2)
INSERT INTO BookSold VALUES (1304009, 2, 2002, '13/04/2020', 113900, 2)
INSERT INTO BookSold VALUES (1304010, 1, 2002, '13/04/2020', 113900, 2)
GO
--TAO VIEW SACH DA BAN
CREATE VIEW Solded_book AS
SELECT B.BookCode, Title, B.Price, SUM(Amount)
FROM Books JOIN BookSold AS b ON B.BookCode = B.BookCode
GO
--TAO VIEW SACH DA MUA
CREATE VIEW Bought_1 AS
SELECT DISTINCT BookSoldID, BookSold.CustomerID, CustomerName, Address, Title FROM Customer, BookSold, Books 
WHERE Customer.CustomerID = BookSold.CustomerID AND Books.BookCode = BookSold.BookCode
GO
