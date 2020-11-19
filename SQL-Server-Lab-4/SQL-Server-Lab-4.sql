IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'school')
	DROP DATABASE school
GO
CREATE DATABASE school
GO
USE school
GO

CREATE TABLE Studen(
	FistName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	DateOfBirth DATE,
	StudenID VARCHAR(5) PRIMARY KEY NOT NULL,
	)
GO
CREATE TABLE Class(
	ClassID VARCHAR(10) PRIMARY KEY NOT NULL,
	Teacher NVARCHAR(30) NOT NULL,
	)
GO
--Bảng class detail chứa thông tin sinh viên học lớp nào lấy dữ liệu 2 bảng trên--
CREATE TABLE ClassDetail(
	Number INT IDENTITY NOT NULL,
	StudenID VARCHAR(5) NOT NULL,
	ClassID VARCHAR(10) NOT NULL,
	PRIMARY KEY(StudenID, ClassID),
	FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
	FOREIGN KEY (StudenID) REFERENCES Studen(StudenID),
	)
GO
INSERT INTO Studen VALUES('William', 'Smith','1993-06-16', 001)
INSERT INTO Studen VALUES('Ngô Bá', 'Khá','1993-11-27', 002)
INSERT INTO Studen VALUES('Nguyễn Thị', 'Anh Thư', '1996-08-12', 003)
INSERT INTO Studen VALUES('Nguyễn Thị', 'Ngọc Mai', '1999-01-18', 004)
INSERT INTO Studen VALUES('Trần Thị', 'Mỹ Phượng', '2002-02-06', 005)
GO
INSERT INTO Class VALUES ('T1501M', 'Đặng Bùi Kim Ngân')
INSERT INTO Class VALUES ('T1903M', 'Trần Kim Thoa')
INSERT INTO Class VALUES ('T3112E', 'Nguyễn Thị Cẩm Anh')
INSERT INTO Class VALUES ('T1508M', 'Phan Quốc Bảo')
INSERT INTO Class VALUES ('T2004M', 'Đặng Kim Thi')
GO
INSERT INTO ClassDetail VALUES (101,'T2004M')
INSERT INTO ClassDetail VALUES (002,'T2004M')
INSERT INTO ClassDetail VALUES (003,'T2004M')
INSERT INTO ClassDetail VALUES (004,'T2004M')
INSERT INTO ClassDetail VALUES (005,'T2004M')
UPDATE Studen
	SET StudenID = 101
	WHERE StudenID = 001
GO
UPDATE Class
	SET Teacher = 'Lê Bảo Bình'
	WHERE ClassID = 'T1501M'
GO
UPDATE ClassDetail
	SET ClassID = 'T1508M'
	WHERE StudenID = 004
GO
DELETE FROM ClassDetail
	WHERE (StudenID = 004 AND ClassID = 'T1508M')
GO
DELETE FROM Studen
	WHERE (StudenID = 004)
GO
DELETE FROM Class
	WHERE (ClassID = 'T1508M')
GO
SELECT * FROM ClassDetail
GO
