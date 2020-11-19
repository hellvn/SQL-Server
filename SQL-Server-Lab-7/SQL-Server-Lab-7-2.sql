--TAO DATABASE
CREATE DATABASE RiverPlate
GO
USE RiverPlate
GO
--TAO BANG Studen
CREATE TABLE Student(
	StudentNo INT,
	StudenName VARCHAR(50),
	StudenAddress VARCHAR(100),
	PhoneNo INT
	CONSTRAINT pk_Student PRIMARY KEY (StudentNo)
	)
GO
--TAO BANG Department
CREATE TABLE Department(
	DeptNo INT,
	DeptName VARCHAR(50),
	ManagerName CHAR(30)
	CONSTRAINT pk_Department PRIMARY KEY (DeptNo)
	)
GO
--TAO BANG Assignment
CREATE TABLE Assignment(
	AssignmentNo INT,
	Description VARCHAR(100)
	CONSTRAINT pk_Assignment PRIMARY KEY (AssignmentNo)
	)
GO
--TAO BANG Works_Assign
CREATE TABLE Works_Assign(
	JobID INT,
	StudentNo INT,
	AssignmentNo INT,
	TotalHours INT,
	JobDetails XML
	CONSTRAINT pk_Works_Assign PRIMARY KEY (JobID)
	)
GO
--TAO KHOA NGOAI CHO BANG Works_Assign
ALTER TABLE Works_Assign ADD CONSTRAINT FK_Studen FOREIGN KEY(StudentNo) REFERENCES Student(StudentNo)
ALTER TABLE Works_Assign ADD CONSTRAINT FK_Assignment FOREIGN KEY(AssignmentNo) REFERENCES Assignment(AssignmentNo)
GO
--TAO CHI MUC IX_Student
ALTER TABLE Works_Assign DROP CONSTRAINT FK_Studen
ALTER TABLE Student DROP CONSTRAINT pk_Student
CREATE UNIQUE CLUSTERED INDEX IX_Studen ON Student(StudentNo)
ALTER TABLE Works_Assign ADD CONSTRAINT FK_Studen FOREIGN KEY(StudentNo) REFERENCES Student(StudentNo)
--CHINH SUA VAF XAY DUNG LAI IX_Student
ALTER INDEX IX_Studen ON Student REBUILD
WITH (ONLINE=OFF)
--TAO CHI MUC IX_DEPT
CREATE NONCLUSTERED INDEX IX_Dept ON Department(DeptNo, DeptName,ManagerName)