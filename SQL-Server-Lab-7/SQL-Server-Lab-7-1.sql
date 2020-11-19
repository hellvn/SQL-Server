--TAO DATABASE APTECH
CREATE DATABASE Aptech
USE Aptech
--TAO BANG CLASSES
CREATE TABLE Classes(
	ClassName CHAR(6),
	Teacher VARCHAR(30),
	TimeSlot VARCHAR(30),
	Class INT,
	Lab INT
	)
GO
--TAO UNIQUE, CLUSTERED INDEX
CREATE UNIQUE CLUSTERED INDEX MyClusteredIndex ON Classes(ClassName) 
WITH (Pad_index = on, FillFactor =70, Ignore_Dup_Key=on)
--TAO NONCLUSTERED INDEX
CREATE NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher)
--XOA CHI MUC TeacherIndex
DROP INDEX TeacherIndex ON Classes
--TAO LAI MyClusteredIndex
CREATE UNIQUE CLUSTERED INDEX MyClusteredIndex ON Classes(ClassName) 
WITH (DROP_EXISTING = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS= ON, MAXDOP = 2)
--TAO COMPOSITE INDEX ClassLabIndex
CREATE INDEX ClassLabIndex ON Classes(Class, Lab)
--XEM TAT CA CHI MUC
EXECUTE sp_helpindex 'Classes'


