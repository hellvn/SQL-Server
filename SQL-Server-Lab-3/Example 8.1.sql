--Variable declaration of type int
DECLARE @age INT = 40
--Variable declaration of type decimal
DECLARE @taxPercent DECIMAL = 0.75
--Variable declaration of type money
DECLARE @amount MONEY = 50000
DECLARE @bonus MONEY = @amount*.10
--Variable declaration of type date
DECLARE @userDate DATE = '09-30-2009'
DECLARE @currentDate DATE = GETDATE()
SELECT @age, @taxPercent, @amount, @bonus, @userDate, @currentDate