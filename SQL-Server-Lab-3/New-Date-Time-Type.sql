--date Data Type
DECLARE @admissionDate date = '09-08-2009';
SELECT @admissionDate;
GO

DECLARE @admissionDate date = GETDATE()
SELECT @admissionDate;
GO

DECLARE @admissionDate date = '09-08-2009 10:30:25';
SELECT @admissionDate;
GO

--time Data Type
DECLARE @startTime time = '10:10:30.1234567';
DECLARE @startTime1 time(0) = '10:10:30.1234567';
DECLARE @startTime2 time(1) = '10:10:30.1234567';
DECLARE @startTime3 time(2) = '10:10:30.1234567';
DECLARE @startTime4 time(3) = '10:10:30.1234567';
DECLARE @startTime5 time(4) = '10:10:30.1234567';
DECLARE @startTime6 time(5) = '10:10:30.1234567';
DECLARE @startTime7 time(6) = '10:10:30.1234567';
DECLARE @startTime8 time(7) = '10:10:30.1234567';
SELECT @startTime;
SELECT @startTime1;
SELECT @startTime2;
SELECT @startTime3;
SELECT @startTime4;
SELECT @startTime5;
SELECT @startTime6;
SELECT @startTime7;
SELECT @startTime8;
GO
--datetime2 Data Type
DECLARE @bookingTime datetime2 = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime1 datetime2(0) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime2 datetime2(1) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime3 datetime2(2) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime4 datetime2(3) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime5 datetime2(4) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime6 datetime2(5) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime7 datetime2(6) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime8 datetime2(7) = '2009-09-08 11:59:11.1234567';
SELECT @bookingTime;
SELECT @bookingTime1;
SELECT @bookingTime2;
SELECT @bookingTime3;
SELECT @bookingTime4;
SELECT @bookingTime5;
SELECT @bookingTime6;
SELECT @bookingTime7;
SELECT @bookingTime8;
GO

--datetimeoffset Data Type
DECLARE @sunriseTime datetimeoffset = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime1 datetimeoffset(0) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime2 datetimeoffset(1) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime3 datetimeoffset(2) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime4 datetimeoffset(3) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime5 datetimeoffset(4) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime6 datetimeoffset(5) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime7 datetimeoffset(6) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime8 datetimeoffset(7) = '2009-09-08 06:59:11.1234567';
SELECT @sunriseTime;
SELECT @sunriseTime1;
SELECT @sunriseTime2;
SELECT @sunriseTime3;
SELECT @sunriseTime4;
SELECT @sunriseTime5;
SELECT @sunriseTime6;
SELECT @sunriseTime7;
SELECT @sunriseTime8;
GO

-- calculating the time difference between two places each located at different time zones
DECLARE @location1 datetimeoffset(0)
SET @location1 = '2009-11-9 23:50:55 -1:00'
DECLARE @location2 datetimeoffset(0)
SET @location2 = '2009-11-9 22:50:55 +5:00'
SELECT DATEDIFF(HH, @location1, @location2)