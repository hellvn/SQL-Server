﻿CREATE DATABASE Shop
GO
USE Shop
GO
--TAO BANG THONG TIN KHACH HANG
CREATE TABLE KhachHang(
	Ma_KhachHang VARCHAR(4),
	HoTen_KH NVARCHAR(40),
	DiaChi_KH NVARCHAR(150),
	SoDienThoai INT
	CONSTRAINT PK_KH PRIMARY KEY (Ma_KhachHang)
	)
GO
--TAO BANG THONG TIN KHO HANG
CREATE TABLE KhoHang(
	Ma_SanPham VARCHAR(4),
	TenSanPham NVARCHAR(30),
	MoTa NVARCHAR(150),
	DonVi NVARCHAR(10),
	DonGia MONEY,
	CONSTRAINT PK_KHO PRIMARY KEY (Ma_SanPham)
	)
GO
--TAO BANG DON HANG
CREATE TABLE DonHang(
	Ma_DonHang VARCHAR(4),
	Ma_KhachHang VARCHAR(4),
	NgayDatHang DATE DEFAULT GETDATE(), 
	CONSTRAINT PK_DH PRIMARY KEY (Ma_DonHang)
	)
GO
--TAO BANG HOA DON
CREATE TABLE HoaDon(
	Ma_DonHang VARCHAR(4),
	Ma_SanPham VARCHAR(4),
	SoLuong INT,
	ThanhTien MONEY,
	CONSTRAINT PK_HD PRIMARY KEY (Ma_DonHang, Ma_SanPham)
	)
GO
--TAO KHOA NGOAI CHO BANG DON HANG
ALTER TABLE DonHang ADD CONSTRAINT fk01_DH FOREIGN KEY (Ma_KhachHang) REFERENCES KhachHang(Ma_KhachHang)
--TAO KHOA NGOAI CHO BANG HOA DON
ALTER TABLE HoaDon ADD CONSTRAINT fk01_HD FOREIGN KEY (Ma_DonHang) REFERENCES DonHang(Ma_DonHang)
ALTER TABLE HoaDon ADD CONSTRAINT fk02_HD FOREIGN KEY (Ma_SanPham) REFERENCES KhoHang(Ma_SanPham)
--DAT KIEU NGAY THANG NAM
SET DATEFORMAT DMY
--THEM DU LIEU BANG KHACH HANG
INSERT INTO KhachHang VALUES ('KH01', 'Nguyễn Văn An', '111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '987654321')
INSERT INTO KhachHang VALUES ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478')
INSERT INTO KhachHang VALUES ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266')
INSERT INTO KhachHang VALUES ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476')
INSERT INTO KhachHang VALUES ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108')
GO
--THEM DU LIEU BANG KHO HANG
INSERT INTO KhoHang VALUES ('MT01', 'Máy Tính T450', 'Máy nhập mới', 'Chiếc', 1000)
INSERT INTO KhoHang VALUES ('DT01', 'Điện thoại Nokia5670', 'Điện thoại đang hot', 'Chiếc', 200)
INSERT INTO KhoHang VALUES ('MI01', 'Máy in Samsung 450', 'Máy in đang ế', 'Chiếc', 100)
GO
--THEM DU LIEU BANG DON HANG
INSERT INTO DonHang VALUES ('123', 'KH01', '18/09/2011')
INSERT INTO DonHang VALUES ('124', 'KH05', '18/09/2011')
INSERT INTO DonHang VALUES ('125', 'KH03', '18/09/2011')
INSERT INTO DonHang VALUES ('126', 'KH02', '18/09/2011')
INSERT INTO DonHang VALUES ('127', 'KH05', '18/09/2011')
GO
--THEM DU LIEU BANG HOA DON
INSERT INTO HoaDon VALUES ('123', 'MT01', 1, 1000)
INSERT INTO HoaDon VALUES ('123', 'DT01', 2, 400)
INSERT INTO HoaDon VALUES ('123', 'MI01', 1, 100)
INSERT INTO HoaDon VALUES ('124', 'DT01', 4, 800)
GO
--DANH SACH KHACH HANG DA MUA HANG
SELECT DISTINCT DonHang.Ma_KhachHang, HoTen_KH AS KhachDaMua FROM DonHang INNER JOIN KhachHang ON DonHang.Ma_KhachHang = KhachHang.Ma_KhachHang
--DANH SACH SAN PHAM CUA CUA HANG
SELECT DISTINCT Ma_SanPham,TenSanPham FROM KhoHang
--DANH SACH CAC DON DAT HANG
SELECT Ma_DonHang, NgayDatHang FROM DonHang
--LIET KE DANH SACH KHACH HANG THEO THU TU ALPHABET
SELECT * FROM KhachHang ORDER BY HoTen_KH
--LIET KE DANH SACH SAN PHAM THEO THU TU GIA GIAM DAN
SELECT * FROM KhoHang ORDER BY DonGia DESC
--LIET KE CAC SAN PHAM MA KHACH HANG NGUYEN VAN AN DA MUA
SELECT DISTINCT HoaDon.Ma_SanPham, TenSanPham
FROM HoaDon INNER JOIN KhoHang
ON KhoHang.Ma_SanPham = HoaDon.Ma_SanPham
AND EXISTS (SELECT*FROM DonHang  INNER JOIN KhachHang
ON KhachHang.Ma_KhachHang = DonHang.Ma_KhachHang
WHERE HoTen_KH = 'Nguyễn Văn An')
--SO KHACH HANG DA MUA O CUA HANG
SELECT COUNT(DISTINCT Ma_KhachHang) AS KhachDaMuaHang FROM DonHang
--SO MAT HANG MA CUA HANG BAN
SELECT COUNT(DISTINCT Ma_SanPham) AS SoMatHang FROM KhoHang
--TONG TIEN CUA TUNG DON HANG
SELECT SUM(ThanhTien) AS GiaTriDonHang FROM HoaDon WHERE Ma_DonHang = 123
SELECT SUM(ThanhTien) AS GiaTriDonHang FROM HoaDon WHERE Ma_DonHang = 124
SELECT SUM(ThanhTien) AS GiaTriDonHang FROM HoaDon WHERE Ma_DonHang = 125
SELECT SUM(ThanhTien) AS GiaTriDonHang FROM HoaDon WHERE Ma_DonHang = 126
SELECT SUM(ThanhTien) AS GiaTriDonHang FROM HoaDon WHERE Ma_DonHang = 127
--GIA TIEN >0
ALTER TABLE KhoHang ADD CONSTRAINT CK_DonGia CHECK(DonGia>0)
--NGAY DAT HANG NHO HON NGAY HIEN TAI
ALTER TABLE DonHang ADD CONSTRAINT CK_NgayDatHang CHECK ((DATEPART(year, NgayDatHang)) < (DATEPART(year, getdate())))
--THEM COT NGAY SAN XUAT
ALTER TABLE KhoHang ADD NgaySX DATE CHECK ((DATEPART(year, Ngaysx)) < (DATEPART(year, getdate())))
-- DAT CHI MUC INDEX CHO TEN HANG VA TEN KH
CREATE INDEX ID_KH ON KhachHang(HoTen_KH)
CREATE INDEX ID_SP ON KhoHang(TenSanPham)
--TAO VIEW KHACH HANG
CREATE VIEW [View_KhachHang] AS
SELECT HoTen_KH, DiaChi_KH, SoDienThoai
FROM KhachHang
--TAO VIEW SAN PHAM
CREATE VIEW View_SanPham AS
SELECT TenSanPham, DonGia
FROM KhoHang
--TAO VIEW KHACH HANG SAN PHAM
CREATE VIEW View_KH_SP AS
SELECT HoTen_KH, SoDienThoai, TenSanPham, SoLuong, NgayDatHang
FROM KhachHang, KhoHang, DonHang, HoaDon