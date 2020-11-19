IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'BookLibrary')
	DROP DATABASE BookLibrary
GO
CREATE DATABASE BookLibrary
GO
USE BookLibrary
GO
CREATE TABLE Book(
	BookCode INT IDENTITY(1000,1),
	BookTitle VARCHAR(100) NOT NULL,
	Author VARCHAR(50) NOT NULL,
	Edition INT,
	BookPrice MONEY,
	Copies INT,
	CONSTRAINT PK_Book PRIMARY KEY (BookCode)
	)
GO
CREATE TABLE Member(
	MemberCode INT IDENTITY(100,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	PhoneNumber INT,
	CONSTRAINT PK_Member PRIMARY KEY (MemberCode)
	)
GO
CREATE TABLE IssueDetail(
	BookCode INT,
	MemberCode INT,
	CONSTRAINT FK_BookCode 
	FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
	CONSTRAINT FK_MemberCode 
	FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
	IssueDate DATETIME,
	ReturnDate DATETIME
	)
GO
--Xóa bỏ ràng buộc khóa ngoại của bảng IssueDetails
ALTER TABLE IssueDetail
	DROP CONSTRAINT FK_BookCode
ALTER TABLE IssueDetail
	DROP CONSTRAINT FK_MemberCode
GO
--Xóa bỏ Ràng buộc Khóa chính của bảng Member và Book
ALTER TABLE Book
	DROP CONSTRAINT PK_Book
GO
ALTER TABLE Member
	DROP CONSTRAINT PK_Member
GO
--Thêm mới Ràng buộc Khóa chính cho bảng Member và Book
ALTER TABLE Book
	ADD CONSTRAINT PK_Book PRIMARY KEY (BookCode)
GO
ALTER TABLE Member
	ADD CONSTRAINT PK_Member PRIMARY KEY (MemberCode)
GO
--Thêm mới các Ràng buộc Khóa ngoại cho bảng IssueDetails
ALTER TABLE IssueDetail
	ADD CONSTRAINT FK_BookCode
	FOREIGN KEY (BookCode) REFERENCES Book(BookCode)
GO
ALTER TABLE IssueDetail
	ADD CONSTRAINT FK_MemberCode
	FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)
GO
--Bổ sung thêm Ràng buộc giá bán sách > 0 và < 200
ALTER TABLE Book
	ADD CONSTRAINT CK_Price
	CHECK(BookPrice BETWEEN 0 AND 200)
GO
--Bổ sung thêm Ràng buộc duy nhất cho PhoneNumber của bảng Member
ALTER TABLE Member
	ADD UNIQUE(PhoneNumber)
GO
--Bổ sung thêm ràng buộc NOT NULL cho BookCode, MemberCode trong bảng IssueDetails
ALTER TABLE IssueDetail
	ALTER COLUMN BookCode INT NOT NULL
GO
ALTER TABLE IssueDetail
	ALTER COLUMN MemberCode INT NOT NULL
GO
--Tạo khóa chính gồm 2 cột BookCode, MemberCode cho bảng IssueDetails
ALTER TABLE IssueDetail
	ADD CONSTRAINT PK_IssueDetail PRIMARY KEY(BookCode,MemberCode)
GO
--Chèn dữ liệu hợp lý cho các bảng(Sử dụng SQL)
INSERT INTO Book(BookTitle, Author, Edition, BookPrice, Copies) 
	VALUES('Hai-Mươi-Bảy', 'Đặng Huỳnh Mai Anh', 1, 84, 0)
INSERT INTO Member(Name, Address, PhoneNumber)
	VALUES('Vương', 'Hà Nội', '0866858676')
INSERT INTO IssueDetail(IssueDate, ReturnDate)
	VALUES(2008-11-11,2020-11-09)
GO