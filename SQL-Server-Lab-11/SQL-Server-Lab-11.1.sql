--Tạo CSDL Lab13
CREATE DATABASE Lab13
GO
USE AdventureWorks2016CTP3
GO
--Sao chép 3 cột ProductID, Name và Color từ bảng Production.Product của database AdventureWorks sang CSDL Lab13
SELECT ProductID, Name, Color INTO Lab13.dbo.Product FROM Production.Product
GO
USE Lab13
GO
--Hiển thị bảng Product vừa sao chép được
SELECT * FROM Product
GO
--Tạo một UPDATE trigger cho bảng Product nhằm ngăn cản việc người khác thay đổi tên của sản phẩm:
CREATE TRIGGER UpdateProduct
ON Product
FOR UPDATE
AS
	BEGIN
		IF(UPDATE(Name))
		BEGIN
			PRINT 'Khong duoc phep thay doi ten san pham';
			ROLLBACK TRANSACTION;
		END
	END
GO
--Thử tiến hành thay đổi tên của một sản phẩm nhằm kiểm tra sự hoạt động của trigger vừa tạo:
UPDATE Product SET Name = 'Cocacola' WHERE ProductID = 1