CREATE DATABASE Company
GO
USE Company
GO
--Tạo bảng phòng ban
CREATE TABLE PhongBan(
	MaPB VARCHAR(7),
	TenPB NVARCHAR(50)
	PRIMARY KEY(MaPB));
GO
--Chèn dữ liệu vào bảng phòng ban
INSERT INTO PhongBan VALUES(101, 'Văn Phòng')
INSERT INTO PhongBan VALUES(102, 'Hành Chính, Nhân sự')
INSERT INTO PhongBan VALUES(201, 'Quản Lý Dự Án')
INSERT INTO PhongBan VALUES(202, 'Công Nghệ Thông Tin')
INSERT INTO PhongBan VALUES(301, 'Giám Đốc')
--Tạo bảng nhân viên
CREATE TABLE NhanVien(
	MaNV VARCHAR(7) PRIMARY KEY,
	TenNV NVARCHAR(50),
	NgaySinh DATE CHECK ((DATEPART(year, NgaySinh)) < (DATEPART(year, getdate()))),
	SoCMND CHAR(9),
	GioiTinh CHAR(1) CHECK (GioiTinh IN ('M','F')),
	DiaChi NVARCHAR(100),
	NgayVaoLam DATETIME,
	MaPB VARCHAR(7)
	FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
	)
GO
--thêm ràng buộc ngày vào làm > ngày sinh 20 năm
ALTER TABLE NhanVien ADD CONSTRAINT Check_NgayVaoLam
	CHECK ((DATEPART(year, NgayVaoLam)) >= ((DATEPART(year, NgaySinh))+20))
GO
--chèn dữ liệu vào bảng nhân viên
INSERT INTO NhanVien VALUES('K200304', 'Trịnh Thị Mai Hương', '12-15-1995', 071017400, 'F', 'Sơn Dương, Tuyên Quang', '07-19-2018', 101 )
INSERT INTO NhanVien VALUES('K200305', 'Nguyễn Thị Hiền', '10-10-1991', 132025020, 'F', 'Đoan Hùng, Phú Thọ','07-19-2018', 101 )
INSERT INTO NhanVien VALUES('K200306', 'Phan Thị Hường', '03-20-1994', 132096770, 'F', 'Tam Nông, Phú Thọ', '07-19-2018', 101)
INSERT INTO NhanVien VALUES('K200307', 'Nguyễn Thị Thảo', '11-23-1998', 132339707, 'F', 'Phù Ninh, Phú Thọ', '07-19-2018', 101)
INSERT INTO NhanVien VALUES('K200308', 'Lâm Thị Thùy Trang', '03-06-1997', 073490771, 'F', 'Bắc Quang, Hà Giang', '07-19-2018', 101)
INSERT INTO NhanVien VALUES('K000001', 'Hoàng Minh Vương', '06-16-1993', 132265563, 'M', 'Thanh Ba, Phú Thọ', '07-19-2018', 301)
INSERT INTO NhanVien VALUES('K000002', 'Nguyễn Quang Nhật', '01-05-1998', 074543672, 'M', 'Việt Nam, Trái Đất', '07-19-2018', 202)
--tạo bảng lương dự án
CREATE TABLE LuongDA(
	MaDA VARCHAR(8),
	MaNV VARCHAR(7),
	NgayNhan DATETIME DEFAULT GETDATE(),
	SoTien MONEY CHECK(Sotien > 0),
	PRIMARY KEY(MaDA, MaNV),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
	)
GO
--chèn dữ liệu vào bảng lương dự án
INSERT INTO LuongDA(MaDA, MaNV, SoTien) VALUES('JD3T2QH3', 'K000001', 5000000) 
INSERT INTO LuongDA(MaDA, MaNV, SoTien) VALUES('JD3T3QH3', 'K000002',  5000)
INSERT INTO LuongDA(MaDA, MaNV, SoTien) VALUES('JD3T4QH3', 'K200304',  500)
INSERT INTO LuongDA(MaDA, MaNV, SoTien) VALUES('JD3T5QH3', 'K200305',  500)
INSERT INTO LuongDA(MaDA, MaNV, SoTien) VALUES('JD3T6QH3', 'K200306',  500)
GO
--thông tin về các bảng LUONGDA, NHANVIEN, PHONGBAN.
SELECT*FROM PhongBan
SELECT*FROM NhanVien
SELECT*FROM LuongDA
GO
--hiển thị những nhân viên có giới tính là 'F'.
SELECT * FROM NhanVien WHERE GioiTinh LIKE '%F'
GO
--Hiển thị tất cả các dự án, mỗi dự án trên 1 dòng.
SELECT DISTINCT MaDA FROM LuongDA GROUP BY MaDA
GO
--Hiển thị tổng lương của từng nhân viên.
SELECT MaNV, SUM(SoTien) AS "TongTien"
FROM LuongDA GROUP BY MaNV
GO
--Hiển thị tất cả các nhân viên trên một phòng ban.
SELECT TenPB, MaNV, TenNV 
FROM PhongBan INNER JOIN NhanVien
ON PhongBan.MaPB = NhanVien.MaPB
WHERE PhongBan.MaPB = 101
GO
--Hiển thị mức lương của những nhân viên phòng 101.
SELECT TenNV, SoTien
FROM NhanVien INNER JOIN LuongDA
ON NhanVien.MaNV = LuongDA.MaNV
WHERE NhanVien.MaPB = 101
GO
--Hiển thị số lượng nhân viên của từng phòng.
SELECT COUNT(DISTINCT MaNV) AS SoLuongNhanVien
FROM NhanVien
WHERE NhanVien.MaPB = 101
SELECT COUNT(DISTINCT MaNV) AS SoLuongNhanVien
FROM NhanVien
WHERE NhanVien.MaPB = 102
SELECT COUNT(DISTINCT MaNV) AS SoLuongNhanVien
FROM NhanVien
WHERE NhanVien.MaPB = 201
SELECT COUNT(DISTINCT MaNV) AS SoLuongNhanVien
FROM NhanVien
WHERE NhanVien.MaPB = 202
SELECT COUNT(DISTINCT MaNV) AS SoLuongNhanVien
FROM NhanVien
WHERE NhanVien.MaPB = 301
GO
--Viết một query để hiển thị những nhân viên mà tham gia ít nhất vào một dự án.
SELECT TenNV, MaDA
FROM NhanVien INNER JOIN LuongDA
ON NhanVien.MaNV = LuongDA.MaNV