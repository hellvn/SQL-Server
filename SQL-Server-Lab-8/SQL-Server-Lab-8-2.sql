CREATE DATABASE School
GO
USE School
GO
--TAO BANG LOP HOC
CREATE TABLE Class(
	ClassCode VARCHAR(10),
	HeadTeacher VARCHAR(30),
	Room VARCHAR(30),
	TimeSlot CHAR,
	CloseDate DATETIME,
	CONSTRAINT pk_Class PRIMARY KEY (ClassCode)
	)
CREATE TABLE Student(
	RollNo VARCHAR(10),
	ClassCode VARCHAR(10),
	FullName VARCHAR(30),
	Male BIT,
	BirthDate DATE,
	Address VARCHAR(40),
	Provice CHAR(2),
	Email VARCHAR(30)
	CONSTRAINT pk_Student PRIMARY KEY (RollNo)
	)
CREATE TABLE Subject(
	SubjectCode VARCHAR(10),
	SubjectName VARCHAR(40),
	WMark BIT,
	PMark BIT,
	WTest_per INT,
	PTest_per INT
	CONSTRAINT pk_Subject PRIMARY KEY (SubjectCode)
	)
CREATE TABLE Mark(
	RollNo VARCHAR(10),
	SubjectCode VARCHAR(10),
	WMark FLOAT,
	PMark FLOAT,
	Mark FLOAT
	CONSTRAINT pk_Mark PRIMARY KEY (RollNo, SubjectCode)
	)
GO
--TAO KHOA NGOAI CHO BANG STUDEN
ALTER TABLE Student ADD CONSTRAINT fk_Student FOREIGN KEY (ClassCode) REFERENCES Class(ClassCode)
--TAO KHOA NGOAI CHO BANG MARK
ALTER TABLE Mark ADD CONSTRAINT fk_RN FOREIGN KEY (RollNo) REFERENCES Student(RollNo)
ALTER TABLE Mark ADD CONSTRAINT fk_SC FOREIGN KEY (SubjectCode) REFERENCES Subject(SubjectCode)
GO
--DINH DANG NGAY THANG
SET DATEFORMAT DMY
GO
--CHEN DU LIEU BANG CLASS
INSERT INTO Class VALUES ('C1001L', 'Tran Ngoc Han', 'Class1', 'M', '02/05/2021')
INSERT INTO Class VALUES ('C1002L', 'Tran Ngoc Linh', 'Class2', 'L', '02/05/2021')
INSERT INTO Class VALUES ('C1003L', 'Tran Minh Long', 'Class3', 'I', '02/05/2021')
INSERT INTO Class VALUES ('C1004L', 'Le Nhat Minh', 'Class4', 'G', '02/05/2021')
INSERT INTO Class VALUES ('C1005L', 'Le Hoai Thuong', 'Class5', 'A', '02/05/2021')
GO
--CHEN DU LIEU BANG STUDENT
INSERT INTO Student VALUES('A00001', 'C1001L', 'Nguyen Van Tam', 1, '06/04/1971', '32 Tran Binh Trong, Q5, TpHCM', 'SG', 'tamnguyenvan@gmail.com')
INSERT INTO Student VALUES('A00002', 'C1001L', 'Phan Thi Thanh', 0, '10/01/1971', '45 An Duong Vuong, Q5, TpHCM', 'SG', 'thanhphan71@gmail.com')
INSERT INTO Student VALUES('A00003', 'C1002L', 'Le Ha Vinh', 1, '03/09/1979', '8 Le Duan, Dong Da, Ha Noi', 'HN', 'vinhlh@gmail.com')
INSERT INTO Student VALUES('A00004', 'C1002L', 'Ha Duy Lap', 1, '02/05/1983', '234 Kham Thien, Dong Da, Ha Noi', 'HN', 'haduylap@gmail.com')
INSERT INTO Student VALUES('A00005', 'C1002L', 'Nguyen Thi Lien', 0, '18/07/1993', '16/23 Thai Ha, Dong Da, Ha Noi', 'HN', 'liennguyen@gmail.com')
GO
--CHEN DU LIEU BANG SUBJECT
INSERT INTO Subject VALUES('LBEP', 'Logic Building, Elementary Programming', 1, 1, 100, 100)
INSERT INTO Subject VALUES('BNGW', 'Building Next Generation Websites', 1, 1, 100, 100)
INSERT INTO Subject VALUES('SEUA', 'Social Engineering and User Awareness', 1, 1, 100, 100)
INSERT INTO Subject VALUES('BSJ', 'BootStrap and jQuery', 1, 1, 100, 100)
INSERT INTO Subject VALUES('DDD', 'Database Design & Development', 1, 1, 100, 100)
GO
--CHEN DU LIEU BANG MARK
--A00001
INSERT INTO Mark VALUES('A00001', 'LBEP', 70, 50, 60)
INSERT INTO Mark VALUES('A00001', 'BNGW', 80, 70, 75)
INSERT INTO Mark VALUES('A00001', 'SEUA', 80, 50, 62.5)
INSERT INTO Mark VALUES('A00001', 'BSJ', 60, 90, 75)
INSERT INTO Mark VALUES('A00001', 'DDD', 70, 80, 75)
--A00002
INSERT INTO Mark VALUES('A00002', 'LBEP', 0, 50, 25)
INSERT INTO Mark VALUES('A00002', 'BNGW', 80, 80, 80)
INSERT INTO Mark VALUES('A00002', 'SEUA', 50, 30, 40)
INSERT INTO Mark VALUES('A00002', 'BSJ', 0, 0, 0)
INSERT INTO Mark VALUES('A00002', 'DDD', 30, 20, 25)
--A00003
INSERT INTO Mark VALUES('A00003', 'LBEP', 30, 60, 45)
INSERT INTO Mark VALUES('A00003', 'BNGW', 34, 35, 34.5)
INSERT INTO Mark VALUES('A00003', 'SEUA', 26, 42, 34)
INSERT INTO Mark VALUES('A00003', 'BSJ', 68, 90, 79)

--A00004
INSERT INTO Mark VALUES('A00004', 'DDD', 35, 80, 57.5)
--A00005
INSERT INTO Mark VALUES('A00005', 'LBEP', 76, 64, 70)
INSERT INTO Mark VALUES('A00005', 'BNGW', 80, 70, 75)

GO
--TAO VIEW SV CO IT NHAT HAI BAI THI KHAC NHAU
CREATE VIEW view_2sj AS
SELECT DISTINCT Student.RollNo, FullName
FROM Student JOIN Mark ON Student.RollNo = Mark.RollNo
WHERE Student.RollNo IN(
	SELECT RollNo
	FROM Mark
	GROUP BY RollNo
	HAVING COUNT(Mark.RollNo) >=2
	)
GO
--TAO VIEW SV KHONG CO DIEM
CREATE VIEW view_failed AS
SELECT DISTINCT Student.RollNo, FullName
FROM Student JOIN Mark ON Student.RollNo = Mark.RollNo
WHERE  (Mark.Mark) < 50
GO
--TAO VIEW SINH VIEN HOC TIME SLOT L
CREATE VIEW view_slotl AS
SELECT DISTINCT Class.ClassCode, Student.RollNo, Student.FullName
FROM Class JOIN Student ON Class.ClassCode = Student.ClassCode
WHERE Class.TimeSlot = 'L'
GO
--TAO VIEW GIAO VIEN COS 3 HS THI TRUOT
CREATE VIEW view_gv AS
SELECT DISTINCT Class.ClassCode, Class.HeadTeacher
FROM Class, Student, Mark
WHERE (Class.ClassCode = Student.ClassCode AND Student.RollNo = Mark.RollNo) AND ( Mark.Mark <50)
GO
--TAO VIEW SINH VIEN THI TRUOT MON LBEP
CREATE VIEW view_failedlbep AS
SELECT DISTINCT Student.FullName, Class.ClassCode, Class.HeadTeacher, Mark.Mark
FROM Student, Class, Mark, Subject
WHERE (Mark.Mark < 50) AND (Class.ClassCode = Student.ClassCode AND Student.RollNo = Mark.RollNo) 
GO