CREATE DATABASE WordClassTravelAndTours
GO
USE WordClassTravelAndTours
GO
CREATE TABLE Flights(
	AircraftCode NVARCHAR(10),
	FType NVARCHAR(10),
	Source NVARCHAR(20),
	Destination NVARCHAR(20),
	DepTime DATETIME,
	JourneyHrs INT
	)
GO
INSERT INTO Flights
	VALUES('UA01', 'Boeing', 'Los Angeles', 'LonDon', '15:30:00', 6)
INSERT INTO Flights
	VALUES('UA02', 'Boeing', 'California', 'New York', '09:30:00', 8)
INSERT INTO Flights
	VALUES('SA01', 'Boeing', 'Istanbul', 'Ankara', '10:45:00', 8)
INSERT INTO Flights
	VALUES('SA02', 'Airbus', 'LonDon', 'New York', '11:15:00', 9)
INSERT INTO Flights
	VALUES('SQ01', 'Airbus', 'Sydney', 'Ankara', '01:45:00', 15)
INSERT INTO Flights
	VALUES('SQ02', 'Boeing', 'Perth', 'Aden', '13:30:00', 10)
INSERT INTO Flights
	VALUES('SQ03', 'Airbus', 'San Francisco', 'Nariobi', '15:45:00', 15)
SELECT * FROM Flights
GO
SELECT AircraftCode, Source, Destination, DepTime FROM Flights
GO
INSERT INTO Flights
	VALUES('UA01', 'Boeing', 'Los Angeles', 'LonDon', '15:30:00', 6)
GO
SELECT TOP 65 PERCENT * FROM Flights
GO
SELECT TOP 2 * FROM Flights
GO
SELECT COUNT(AircraftCode) FROM Flights
GO
SELECT *, JourneyHrs * 150 AS Price FROM Flights
GO