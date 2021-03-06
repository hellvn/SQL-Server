IF EXISTS(SELECT*FROM sys.databases WHERE name= 'CitySoftware')
	DROP DATABASE CitySoftware
GO
CREATE DATABASE CitySoftware
GO
USE CitySoftware
GO
--TAO BANG EMPLOYEE
CREATE TABLE Employee(
	EmployeeID INT,
	Name VARCHAR(100),
	Tel CHAR(11),
	Email VARCHAR(30)
	)
GO
--TAO BANG GROUP
CREATE TABLE E_Group(
	GroupID INT,
	GroupName VARCHAR(30),
	LeaderID INT,
	ProjectID INT
	)
GO
--TAO BANG PROJECT
CREATE TABLE Project(
	ProjectID INT,
	ProjectName VARCHAR(30),
	StartDate DATETIME,
	EndDate DATETIME,
	Period INT,
	Cost MONEY
	)
GO
--TAO BANG GROUP DETAIL
CREATE TABLE GroupDetail(
	GroupID INT,
	EmployeeID INT,
	Status CHAR(20)
	)
GO
--TAO KHOA CHINH VA KHOA NGOAI
--TAO PRIMARY KEY
ALTER TABLE Employee
	ALTER COLUMN EmployeeID INT NOT NULL
ALTER TABLE E_Group
	ALTER COLUMN GroupID INT NOT NULL
ALTER TABLE Project
	ALTER COLUMN ProjectID INT NOT NULL
ALTER TABLE GroupDetail
	ALTER COLUMN GroupID INT NOT NULL
ALTER TABLE Employee
	ADD CONSTRAINT pk_Employee PRIMARY KEY (EmployeeID)
ALTER TABLE E_Group
	ADD CONSTRAINT pk_E_Group PRIMARY KEY (GroupID)
ALTER TABLE Project
	ADD CONSTRAINT pk_Project PRIMARY KEY (ProjectID)
ALTER TABLE GroupDetail
	ADD CONSTRAINT pk_GroupDetail PRIMARY KEY (GroupID)
--TAO FOREIGN KEY
ALTER TABLE E_Group
	ADD CONSTRAINT Fk_ProjectID FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
ALTER TABLE GroupDetail
	ADD CONSTRAINT Fk_GroupID FOREIGN KEY (GroupID) REFERENCES E_Group(GroupID)
ALTER TABLE GroupDetail
	ADD CONSTRAINT Fk_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
--THEM DU LIEU CHO CAC BANG
ALTER TABLE Employee
	
SELECT TOP (50)
	[FirstName]
  FROM [AdventureWorks2016CTP3].[Person].[Person]
where Employee.EmployeeID = AdventureWorks2016CTP3.Person.Person.BusinessEntityID

select*from Employee