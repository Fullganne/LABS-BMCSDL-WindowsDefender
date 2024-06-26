﻿	
--a
CREATE DATABASE QLBongDa
USE QLBongDa

--b
CREATE TABLE QUOCGIA (
    MAQG VARCHAR(5) PRIMARY KEY,
    TENQG NVARCHAR(60) NOT NULL
);

CREATE TABLE TINH (
    MATINH VARCHAR(5) PRIMARY KEY,
    TENTINH NVARCHAR(100) NOT NULL
);

CREATE TABLE SANVD (
    MASAN VARCHAR(5) PRIMARY KEY,
    TENSAN NVARCHAR(100) NOT NULL,
    DIACHI NVARCHAR(200)
);

CREATE TABLE CAULACBO (
    MACLB VARCHAR(5) PRIMARY KEY,
    TENCLB NVARCHAR(100) NOT NULL,
    MASAN VARCHAR(5) NOT NULL,
    MATINH VARCHAR(5) NOT NULL,
    FOREIGN KEY (MASAN) REFERENCES SANVD(MASAN),
    FOREIGN KEY (MATINH) REFERENCES TINH(MATINH)
);

CREATE TABLE CAUTHU (
    MACT NUMERIC PRIMARY KEY IDENTITY(1,1),
    HOTEN NVARCHAR(100) NOT NULL,
    VITRI NVARCHAR(20) NOT NULL,
    NGAYSINH DATETIME,
    DIACHI NVARCHAR(200),
    MACLB VARCHAR(5) NOT NULL,
    MAQG VARCHAR(5) NOT NULL,
    SO INT NOT NULL,
    FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB),
    FOREIGN KEY (MAQG) REFERENCES QUOCGIA(MAQG)
);

CREATE TABLE HUANLUYENVIEN (
    MAHLV VARCHAR(5) PRIMARY KEY,
    TENHLV NVARCHAR(100) NOT NULL,
    NGAYSINH DATETIME,
    DIACHI NVARCHAR(200),
    DIENTHOAI NVARCHAR(20),
    MAQG VARCHAR(5) NOT NULL,
    FOREIGN KEY (MAQG) REFERENCES QUOCGIA(MAQG)
);

CREATE TABLE HLV_CLB (
    MAHLV VARCHAR(5),
    MACLB VARCHAR(5),
    VAITRO NVARCHAR(100) NOT NULL,
    PRIMARY KEY (MAHLV, MACLB),
    FOREIGN KEY (MAHLV) REFERENCES HUANLUYENVIEN(MAHLV),
    FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB)
);

CREATE TABLE TRANDAU (
    MATRAN NUMERIC PRIMARY KEY IDENTITY(1,1),
    NAM INT NOT NULL,
    VONG INT NOT NULL,
    NGAYTD DATETIME NOT NULL,
    MACLB1 VARCHAR(5) NOT NULL,
    MACLB2 VARCHAR(5) NOT NULL,
    MASAN VARCHAR(5) NOT NULL,
    KETQUA VARCHAR(5) NOT NULL,
    FOREIGN KEY (MACLB1) REFERENCES CAULACBO(MACLB),
    FOREIGN KEY (MACLB2) REFERENCES CAULACBO(MACLB),
    FOREIGN KEY (MASAN) REFERENCES SANVD(MASAN)
);

CREATE TABLE BANGXH (
    MACLB VARCHAR(5),
    NAM INT,
    VONG INT,
    SOTRAN INT NOT NULL,
    THANG INT NOT NULL,
    HOA INT NOT NULL,
    THUA INT NOT NULL,
    HIEUSO VARCHAR(5) NOT NULL,
    DIEM INT NOT NULL,
    HANG INT NOT NULL,
    PRIMARY KEY (MACLB, NAM, VONG),
    FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB)
);



--c
-- Chèn dữ liệu vào bảng QUOCGIA
INSERT INTO QUOCGIA (MAQG, TENQG) VALUES
('VN', N'Việt Nam'),
('ANH', N'Anh Quốc'),
('TBN', N'Tây Ban Nha'),
('BDN', N'Bồ Đào Nha'),
('BRA', N'Brazil'),
('ITA', N'Ý'),
('THA', N'Thái Lan');

-- Chèn dữ liệu vào bảng TINH
INSERT INTO TINH (MATINH, TENTINH) VALUES
('BD', N'Bình Dương'),
('GL', N'Gia Lai'),
('DN', N'Đà Nẵng'),
('KH', N'Khánh Hòa'),
('PY', N'Phú Yên'),
('LA', N'Long An');

-- Chèn dữ liệu vào bảng SANVD
INSERT INTO SANVD (MASAN, TENSAN, DIACHI) VALUES
('GD', N'Gò Đậu', N'123 QL1, TX Thủ Dầu Một, Bình Dương'),
('PL', N'Pleiku', N'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai'),
('CL', N'Chi Lăng', N'127 Võ Văn Tần, Đà Nẵng'),
('NT', N'Nha Trang', N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa'),
('TH', N'Tuy Hòa', N'57 Trường Chinh, Tuy Hòa, Phú Yên'),
('LA', N'Long An', N'102 Hùng Vương, Tp Tân An, Long An');

-- Chèn dữ liệu vào bảng CAULACBO
INSERT INTO CAULACBO (MACLB, TENCLB, MASAN, MATINH) VALUES
('BBD', N'BECAMEX BÌNH DƯƠNG', 'GD', 'BD'),
('HAGL', N'HOÀNG ANH GIA LAI', 'PL', 'GL'),
('SDN', N'SHB ĐÀ NẴNG', 'CL', 'DN'),
('KKH', N'KHATOCO KHÁNH HÒA', 'NT', 'KH'),
('TPY', N'THÉP PHÚ YÊN', 'TH', 'PY'),
('GDT', N'GẠCH ĐỒNG TÂM', 'LA', 'LA');

-- Chèn dữ liệu vào bảng CAUTHU
INSERT INTO CAUTHU (HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) VALUES
(N'Nguyễn Vũ Phong', N'Tiền vệ', '1990-02-20', NULL, 'BBD', 'VN', 17),
(N'Nguyễn Công Vinh', N'Tiền đạo', '1992-03-10', NULL, 'HAGL', 'VN', 9),
(N'Trần Tấn Tài', N'Tiền vệ', '1989-11-12', NULL, 'BBD', 'VN', 8),
(N'Phan Hồng Sơn', N'Thủ môn', '1991-06-10', NULL, 'HAGL', 'VN', 1),
(N'Ronaldo', N'Tiền vệ', '1989-12-12', NULL, 'SDN', 'BRA', 7),
(N'Robinho', N'Tiền vệ', '1989-10-12', NULL, 'SDN', 'BRA', 8),
(N'Vidic', N'Hậu vệ', '1987-10-15', NULL, 'HAGL', 'ANH', 3),
(N'Trần Văn Santos', N'Thủ môn', '1990-10-21', NULL, 'BBD', 'BRA', 1),
(N'Nguyễn Trường Sơn', N'Hậu vệ', '1993-08-26', NULL, 'BBD', 'VN', 4);

-- Chèn dữ liệu vào bảng HUANLUYENVIEN
INSERT INTO HUANLUYENVIEN (MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG) VALUES
('HLV01', N'Vital', '1955-10-15', NULL, '0918011075', 'BDN'),
('HLV02', N'Lê Huỳnh Đức', '1972-05-20', NULL, '01223456789', 'VN'),
('HLV03', N'Kiatisuk', '1970-12-11', NULL, '01990123456', 'THA'),
('HLV04', N'Hoàng Anh Tuấn', '1970-06-10', NULL, '0989112233', 'VN'),
('HLV05', N'Trần Công Minh', '1973-07-07', NULL, '0909099990', 'VN'),
('HLV06', N'Trần Văn Phúc', '1965-03-02', NULL, '01650101234', 'VN');

-- Chèn dữ liệu vào bảng HLV_CLB
INSERT INTO HLV_CLB (MAHLV, MACLB, VAITRO) VALUES
('HLV01', 'BBD', N'HLV Chính'),
('HLV02', 'SDN', N'HLV Chính'),
('HLV03', 'HAGL', N'HLV Chính'),
('HLV04', 'KKH', N'HLV Chính'),
('HLV05', 'GDT', N'HLV Chính'),
('HLV06', 'BBD', N'HLV thủ môn');
-- Chèn dữ liệu vào bảng TRANDAU
SET IDENTITY_INSERT TRANDAU ON;
INSERT INTO TRANDAU (MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, KETQUA) VALUES
(1, 2009, 1, '2009-02-07', 'BBD', 'SDN', 'GD', '3-0'),
(2, 2009, 1, '2009-02-07', 'KKH', 'GDT', 'NT', '1-1'),
(3, 2009, 2, '2009-02-16', 'SDN', 'KKH', 'CL', '2-2'),
(4, 2009, 2, '2009-02-16', 'TPY', 'BBD', 'TH', '5-0'),
(5, 2009, 3, '2009-03-01', 'TPY', 'GDT', 'TH', '0-2'),
(6, 2009, 3, '2009-03-01', 'KKH', 'BBD', 'NT', '0-1'),
(7, 2009, 4, '2009-03-07', 'KKH', 'TPY', 'NT', '1-0'),
(8, 2009, 4, '2009-03-07', 'BBD', 'GDT', 'GD', '2-2');
SET IDENTITY_INSERT CAUTHU OFF;
-- Chèn dữ liệu vào bảng BANGXH
INSERT INTO BANGXH (MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, DIEM, HANG) VALUES
('BBD', 2009, 1, 1, 1, 0, 0, '3-0', 3, 1),
('KKH', 2009, 1, 1, 0, 1, 0, '1-1', 1, 2),
('GDT', 2009, 1, 1, 0, 1, 0, '1-1', 1, 3),
('TPY', 2009, 1, 0, 0, 0, 0, '0-0', 0, 4),
('SDN', 2009, 1, 1, 0, 0, 1, '0-3', 0, 5),
('TPY', 2009, 2, 1, 1, 0, 0, '5-0', 3, 1),
('BBD', 2009, 2, 2, 1, 0, 1, '3-5', 3, 2),
('KKH', 2009, 2, 2, 0, 2, 0, '3-3', 2, 3),
('GDT', 2009, 2, 1, 0, 1, 0, '1-1', 1, 4),
('SDN', 2009, 2, 2, 1, 1, 0, '2-5', 1, 5),
('BBD', 2009, 3, 3, 2, 0, 1, '4-5', 6, 1),
('GDT', 2009, 3, 2, 1, 1, 0, '3-1', 4, 2),
('TPY', 2009, 3, 2, 1, 0, 1, '5-2', 3, 3),
('KKH', 2009, 3, 3, 0, 2, 1, '3-4', 2, 4),
('SDN', 2009, 3, 2, 1, 1, 0, '2-5', 1, 5),
('BBD', 2009, 4, 4, 2, 1, 1, '6-7', 7, 1),
('GDT', 2009, 4, 3, 1, 2, 0, '5-1', 5, 2),
('KKH', 2009, 4, 4, 1, 2, 1, '4-4', 5, 3),
('TPY', 2009, 4, 3, 1, 0, 2, '5-3', 3, 4),
('SDN', 2009, 4, 2, 1, 1, 0, '2-5', 1, 5);

--d
-- Tạo user và phân quyền cho user BDAdmin
CREATE LOGIN BDAdmin WITH PASSWORD = '12345678';
CREATE USER BDAdmin FOR LOGIN BDAdmin;
ALTER ROLE db_owner ADD MEMBER BDAdmin;

-- Tạo user và phân quyền cho user BDBK
CREATE LOGIN BDBK WITH PASSWORD = '87654321';
CREATE USER BDBK FOR LOGIN BDBK;
GRANT BACKUP DATABASE TO BDBK;

-- Tạo user và phân quyền cho user BDRead
CREATE LOGIN BDRead WITH PASSWORD = '13579246';
CREATE USER BDRead FOR LOGIN BDRead;
GRANT SELECT TO BDRead;

-- Tạo user và phân quyền cho user BDU01
CREATE LOGIN BDU01 WITH PASSWORD = '98765432';
CREATE USER BDU01 FOR LOGIN BDU01;
GRANT CREATE TABLE TO BDU01;

-- Tạo user và phân quyền cho user BDU02
CREATE LOGIN BDU02 WITH PASSWORD = '24681357';
CREATE USER BDU02 FOR LOGIN BDU02;
GRANT UPDATE ON CAULACBO TO BDU02;
GRANT UPDATE ON CAUTHU TO BDU02;
GRANT UPDATE ON HUANLUYENVIEN TO BDU02;
GRANT UPDATE ON HLV_CLB TO BDU02;
GRANT UPDATE ON QUOCGIA TO BDU02;
GRANT UPDATE ON SANVD TO BDU02;
GRANT UPDATE ON TINH TO BDU02;
GRANT UPDATE ON TRANDAU TO BDU02;
GRANT UPDATE ON BANGXH TO BDU02;

-- Tạo user và phân quyền cho user BDU03
CREATE LOGIN BDU03 WITH PASSWORD = '57293641';
CREATE USER BDU03 FOR LOGIN BDU03;
GRANT SELECT, INSERT, UPDATE, DELETE ON CauLacBo TO BDU03;

-- Tạo user và phân quyền cho user BDU04
CREATE LOGIN BDU04 WITH PASSWORD = '31478562';
CREATE USER BDU04 FOR LOGIN BDU04;
DENY SELECT (NGAYSINH) ON CAUTHU TO BDU04;
DENY UPDATE (VITRI) ON CAUTHU TO BDU04;

-- Tạo user và phân quyền cho user BDProfile
USE master;
CREATE LOGIN BDProfile WITH PASSWORD = '69524783';
CREATE USER BDProfile FOR LOGIN BDProfile;
GRANT ALTER TRACE TO BDProfile;
GO

--Câu e
CREATE OR ALTER PROCEDURE SP_SEL_NO_ENCRYPT @TenCLB nvarchar(100),@TenQG nvarchar(60)
AS
	SELECT CT.MACT,CT.HOTEN,CT.NGAYSINH,CT.DIACHI,CT.VITRI
	FROM CAUTHU CT, CAULACBO CLB, QUOCGIA QG
	WHERE CT.MACLB=CLB.MACLB AND QG.MAQG=CT.MAQG
		AND QG.TENQG=@TenQG AND CLB.TENCLB=@TenCLB
GO

--Câu f
CREATE OR ALTER PROCEDURE SP_SEL_ENCRYPT @TenCLB nvarchar(100),@TenQG nvarchar(60) WITH ENCRYPTION
AS
	SELECT CT.MACT,CT.HOTEN,CT.NGAYSINH,CT.DIACHI,CT.VITRI
	FROM CAUTHU CT, CAULACBO CLB, QUOCGIA QG
	WHERE CT.MACLB=CLB.MACLB AND QG.MAQG=CT.MAQG
		AND QG.TENQG=@TenQG AND CLB.TENCLB=@TenCLB
GO

--Câu g
EXEC sp_helptext SP_SEL_NO_ENCRYPT
EXEC sp_helptext SP_SEL_ENCRYPT
-- Sau khi chạy hai lệnh trên thì SP_SEL_ENCRYPT không đọc được nội dung do đã bị mã hóa, còn SP_SEL_NO_ENCRYPT có thể xem nội dung
-- Store procedure SP_SEL_ENCRYPT cũng không thể modify được
GO
--Câu h
DECLARE @ProcedureName NVARCHAR(128)
DECLARE @SQL NVARCHAR(MAX)

DECLARE ProcedureCursor CURSOR FOR 
SELECT [name] 
FROM sys.procedures 
WHERE is_ms_shipped = 0 -- Loại bỏ các stored procedure hệ thống

OPEN ProcedureCursor
FETCH NEXT FROM ProcedureCursor INTO @ProcedureName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'ALTER PROCEDURE [' + @ProcedureName + '] WITH ENCRYPTION'
    EXEC sp_executesql @SQL

    FETCH NEXT FROM ProcedureCursor INTO @ProcedureName
END

CLOSE ProcedureCursor
DEALLOCATE ProcedureCursor

--Câu i
--câu 1
CREATE OR ALTER VIEW vCau1 
AS
	SELECT MACT, HOTEN, NGAYSINH, DIACHI, VITRI
	FROM CAUTHU CT,CAULACBO CLB,QUOCGIA QG
	WHERE CT.MACLB = CLB.MACLB
	  AND CT.MAQG = QG.MAQG
	  AND QG.TENQG = N'Brazil'
	  AND CLB.TENCLB = N'SHB Đà Nẵng';
GO

--câu 2
CREATE OR ALTER VIEW vCau2 
AS
	SELECT MATRAN, NGAYTD, CLB1.TENCLB AS TENCLB1, CLB2.TENCLB AS TENCLB2
	FROM TRANDAU TD,
			SANVD SVD,
			CAULACBO CLB1,
			CAULACBO CLB2
	WHERE TD.MASAN = SVD.MASAN
		AND TD.MACLB1 = CLB1.MACLB
		AND TD.MACLB2 = CLB2.MACLB
		AND VONG = 3 AND NAM = 2009;
GO

--câu 3
CREATE OR ALTER VIEW vCau3 
AS
	SELECT HLV.MAHLV, TENHLV, NGAYSINH, DIACHI, VAITRO, TENCLB
	FROM HUANLUYENVIEN HLV 
	INNER JOIN HLV_CLB ON HLV.MAHLV = HLV_CLB.MAHLV 
	INNER JOIN CAULACBO CLB ON HLV_CLB.MACLB = CLB.MACLB
	WHERE MAQG = 'VN'
GO

--câu 4
CREATE OR ALTER VIEW vCau4 
AS
	SELECT CLB.MACLB,CLB.TENCLB,SVD.TENSAN, SVD.DIACHI,
			(SELECT COUNT(*) 
			FROM CAUTHU CT2 
			WHERE CT2.MACLB = CLB.MACLB AND CT2.MAQG <> 'VN') AS SL
	FROM CAULACBO CLB, SANVD SVD
	WHERE CLB.MASAN = SVD.MASAN
		AND (SELECT COUNT(*) 
			FROM CAUTHU CT2 
			WHERE CT2.MACLB = CLB.MACLB AND CT2.MAQG <> 'VN') >= 2;
GO


--câu 5
CREATE OR ALTER VIEW vCau5
AS
	SELECT TENTINH, COUNT(MACT) as SLCT
	FROM TINH T 
	INNER JOIN CAULACBO CLB ON T.MATINH = CLB.MATINH
	INNER JOIN CAUTHU CT ON CLB.MACLB = CT.MACLB
	WHERE CT.VITRI = N'Tiền đạo'
	GROUP BY T.MATINH, T.TENTINH
GO

--câu 6
CREATE OR ALTER VIEW vCau6 AS
	SELECT CLB.TENCLB, T.TENTINH
	FROM CAULACBO CLB JOIN TINH T on CLB.MATINH = T.MATINH 
		JOIN BANGXH BXH on BXH.MACLB = CLB.MACLB
	WHERE BXH.VONG = 3 AND BXH.NAM = 2009
		AND BXH.HANG <= (SELECT MIN(BXH1.HANG) 
						FROM BANGXH BXH1 
						WHERE BXH1.VONG = 3 AND BXH1.NAM = 2009)
GO


--câu 7
CREATE OR ALTER VIEW vCau7
AS
	SELECT TENHLV
	FROM HUANLUYENVIEN HLV INNER JOIN HLV_CLB ON HLV.MAHLV = HLV_CLB.MAHLV
	WHERE DIENTHOAI = NULL
GO

--câu 8
CREATE OR ALTER VIEW vCau8
AS
	SELECT HLV.TENHLV
	FROM HUANLUYENVIEN HLV, QUOCGIA QG
	WHERE HLV.MAHLV NOT IN (SELECT HLV_CLB.MAHLV FROM HLV_CLB)
		AND QG.MAQG = HLV.MAQG
		AND QG.TENQG = N'Việt Nam'
GO
--câu 9
CREATE OR ALTER VIEW vCau9 
AS
	SELECT DISTINCT NGAYTD, TENSAN, CLB1.TENCLB TENCLB1, CLB2.TENCLB TENCLB2, KETQUA
	FROM TRANDAU TD 
	INNER JOIN SANVD SVD ON TD.MASAN = SVD.MASAN
	INNER JOIN BANGXH BXH ON KETQUA = HIEUSO AND (TD.MACLB1 = BXH.MACLB OR TD.MACLB2 = BXH.MACLB)
	INNER JOIN CAULACBO CLB1 ON TD.MACLB1 = CLB1.MACLB
	INNER JOIN CAULACBO CLB2 ON TD.MACLB2 = CLB2.MACLB
	WHERE TD.VONG <> 4 AND BXH.NAM = 2009 AND HANG = 1
GO

--câu 10
CREATE OR ALTER VIEW vCau10 
AS
	SELECT DISTINCT TD.NGAYTD, SVD.TENSAN, CLB1.TENCLB TENCLB1, CLB2.TENCLB TENCLB2, TD.KETQUA
	FROM TRANDAU TD 
	JOIN SANVD SVD ON TD.MASAN = SVD.MASAN
	JOIN CAULACBO CLB1 ON TD.MACLB1 = CLB1.MACLB 
	JOIN CAULACBO CLB2 ON TD.MACLB2 = CLB2.MACLB
	JOIN BANGXH BXH ON (CLB1.MACLB = BXH.MACLB or CLB2.MACLB = BXH.MACLB )
	WHERE TD.VONG = 3 and TD.NAM = 2009 AND BXH.hang = (SELECT MAX(bxh1.HANG)
														FROM BANGXH BXH1
														WHERE BXH1.VONG = 3)
GO

--Phân quyền
--BDRead
GRANT SELECT ON vCau1 TO BDRead;
GRANT SELECT ON vCau2 TO BDRead;
GRANT SELECT ON vCau3 TO BDRead;
GRANT SELECT ON vCau4 TO BDRead;
GRANT SELECT ON vCau5 TO BDRead;
GRANT SELECT ON vCau6 TO BDRead;
GRANT SELECT ON vCau7 TO BDRead;
GRANT SELECT ON vCau8 TO BDRead;
GRANT SELECT ON vCau9 TO BDRead;
GRANT SELECT ON vCau10 TO BDRead;
GO
--BDU01
DENY SELECT ON vCau1 TO BDU01;
DENY SELECT ON vCau2 TO BDU01;
DENY SELECT ON vCau3 TO BDU01;
DENY SELECT ON vCau4 TO BDU01;

GRANT SELECT ON vCau5 TO BDU01;
GRANT SELECT ON vCau6 TO BDU01;
GRANT SELECT ON vCau7 TO BDU01;
GRANT SELECT ON vCau8 TO BDU01;
GRANT SELECT on vCau9 TO BDU01;
GRANT SELECT on vCau10 TO BDU01;
GO

--BDU03
GRANT SELECT ON vCau1 TO BDU03;
GRANT SELECT ON vCau2 TO BDU03;
GRANT SELECT ON vCau3 TO BDU03;
GRANT SELECT ON vCau4 TO BDU03;
GO

--BDU04
GRANT SELECT ON vCau1 TO BDU04;
GRANT SELECT ON vCau2 TO BDU04;
GRANT SELECT ON vCau3 TO BDU04;
GRANT SELECT ON vCau4 TO BDU04;
GO

--Câu j
--câu 1
CREATE OR ALTER PROCEDURE SPCau1 @TenCLB nvarchar(100), @TenQG nvarchar(60)
AS
	SELECT MACT, HOTEN, NGAYSINH, DIACHI, VITRI
	FROM CAUTHU CT,CAULACBO CLB,QUOCGIA QG
	WHERE CT.MACLB = CLB.MACLB
	  AND CT.MAQG = QG.MAQG
	  AND QG.TENQG = @TenQG
	  AND CLB.TENCLB = @TenCLB;
GO

EXEC SPCau1 N'SHB ĐÀ NẴNG','Brazil';
GO

--câu 2
CREATE OR ALTER PROCEDURE SPCau2 @Vong int, @Nam int
AS
	SELECT MATRAN, NGAYTD, CLB1.TENCLB AS TENCLB1, CLB2.TENCLB AS TENCLB2
    FROM TRANDAU TD,
         SANVD S,
         CAULACBO CLB1,
         CAULACBO CLB2
    WHERE TD.MASAN = S.MASAN
      AND TD.MACLB1 = CLB1.MACLB
      AND TD.MACLB2 = CLB2.MACLB
      AND VONG = @Vong
      AND NAM = @Nam;
GO

EXEC SPCau2 2009,3;
GO

--câu 3
CREATE OR ALTER PROCEDURE SPCau3
@TenQG nvarchar(100)
AS
	SELECT HLV.MAHLV, HLV.TENHLV, HLV.NGAYSINH, HLV.DIACHI, HLV_CLB.VAITRO, CLB.TENCLB
    FROM HUANLUYENVIEN HLV,
         QUOCGIA QG,
         HLV_CLB,
         CAULACBO CLB
    WHERE HLV_CLB.MACLB = CLB.MACLB
      AND HLV.MAHLV = HLV_CLB.MAHLV
      AND HLV.MAQG = QG.MAQG
      AND QG.TENQG = @TenQG;
GO

EXEC SPCau3 N'Việt Nam';
GO


--câu 4
CREATE OR ALTER PROCEDURE SPCau4 @MaQG varchar(5), @SL int
AS
	SELECT CLB.MACLB,CLB.TENCLB,SVD.TENSAN, SVD.DIACHI,
			(SELECT COUNT(*) 
			FROM CAUTHU CT2 
			WHERE CT2.MACLB = CLB.MACLB AND CT2.MAQG <> @MaQG) AS SL
	FROM CAULACBO CLB, SANVD SVD
	WHERE CLB.MASAN = SVD.MASAN
		AND (SELECT COUNT(*) 
			FROM CAUTHU CT2 
			WHERE CT2.MACLB = CLB.MACLB AND CT2.MAQG <> @MaQG) >= @SL;
GO

EXEC SPCau4 'VN',2;
GO

--câu 5
CREATE OR ALTER PROCEDURE SPCau5 @Vitri nvarchar(20)
AS
	SELECT TENTINH, COUNT(MACT) as SLCT
	FROM TINH T INNER JOIN CAULACBO CLB ON T.MATINH = CLB.MATINH
		INNER JOIN CAUTHU CT ON CLB.MACLB = CT.MACLB
	WHERE CT.VITRI = @Vitri
	GROUP BY T.MATINH,T.TENTINH
GO

EXEC SPCau5 N'Tiền Đạo';
GO

--câu 6
CREATE OR ALTER PROCEDURE SPCau6 @Vong int,@Nam int
AS
	SELECT CLB.TENCLB, T.TENTINH
	FROM CAULACBO CLB JOIN TINH T on CLB.MATINH = T.MATINH 
		JOIN BANGXH BXH on BXH.MACLB = CLB.MACLB
	WHERE BXH.VONG = @Vong AND BXH.NAM = @Nam
		AND BXH.HANG <= (SELECT MIN(BXH1.HANG) 
						FROM BANGXH BXH1 
						WHERE BXH1.VONG = @Vong AND BXH1.NAM = @Nam);
GO

EXEC SPCau6 3,2009;
GO

--câu 7
CREATE OR ALTER PROCEDURE SPCau7
AS
	SELECT TENHLV
	FROM HUANLUYENVIEN HLV INNER JOIN HLV_CLB ON HLV.MAHLV = HLV_CLB.MAHLV
	WHERE DIENTHOAI = NULL
GO

EXEC SPCau7;
GO

--câu 8
CREATE OR ALTER PROCEDURE SPCau8
@TenQG varchar(5)
AS
	SELECT HLV.TENHLV
	FROM HUANLUYENVIEN HLV, QUOCGIA QG
	WHERE HLV.MAHLV NOT IN (SELECT HLV_CLB.MAHLV FROM HLV_CLB)
		AND QG.MAQG = HLV.MAQG
		AND QG.TENQG = @TenQG
GO

EXEC SPCau8 N'Việt Nam';
GO

--câu 9
CREATE OR ALTER PROCEDURE SPCau9 @Vong int,@Nam int
AS
	SELECT DISTINCT NGAYTD, TENSAN, CLB1.TENCLB TENCLB1, CLB2.TENCLB TENCLB2, KETQUA
	FROM TRANDAU TD inner join SANVD SVD ON TD.MASAN = SVD.MASAN
		INNER JOIN BANGXH BXH ON KETQUA = HIEUSO AND (TD.MACLB1 = BXH.MACLB OR TD.MACLB2 = BXH.MACLB)
		INNER JOIN CAULACBO CLB1 ON TD.MACLB1 = CLB1.MACLB
		INNER JOIN CAULACBO CLB2 ON TD.MACLB2 = CLB2.MACLB
	WHERE TD.VONG <> @Vong AND BXH.NAM = @Nam AND HANG = 1
GO

EXEC SPCau9 3,2009;
GO

--câu 10
CREATE OR ALTER PROCEDURE SPCau10 @Vong int,@Nam int
AS
	SELECT CLB.TENCLB, T.TENTINH
    FROM TINH T,
         CAULACBO CLB,
         BANGXH BXH
    WHERE T.MATINH = CLB.MATINH
      AND CLB.MACLB = BXH.MACLB
      AND BXH.VONG = @Vong
      AND BXH.NAM = @Nam
      AND BXH.HANG >= (SELECT MAX(BXH1.HANG) 
					  FROM BANGXH BXH1 
					  WHERE BXH1.VONG = @Vong AND BXH1.NAM = @Nam)
GO

EXEC SPCau10 3,2009;
GO

--Phân quyền
--BDURead
GRANT EXECUTE TO BDRead;
GO
---BDU01
GRANT EXECUTE ON SPCau5 TO BDU01;
GRANT EXECUTE ON SPCau6 TO BDU01;
GRANT EXECUTE ON SPCau7 TO BDU01;
GRANT EXECUTE ON SPCau8 TO BDU01;
GRANT EXECUTE ON SPCau9 TO BDU01;
GRANT EXECUTE ON SPCau10 TO BDU01;
GO
---BDU03
GRANT EXECUTE ON SPCau1 TO BDU03;
GRANT EXECUTE ON SPCau2 TO BDU03;
GRANT EXECUTE ON SPCau3 TO BDU03;
GRANT EXECUTE ON SPCau4 TO BDU03;
GO
---BDU04
GRANT EXECUTE ON SPCau1 TO BDU04;
GRANT EXECUTE ON SPCau2 TO BDU04;
GRANT EXECUTE ON SPCau3 TO BDU04;
GRANT EXECUTE ON SPCau4 TO BDU04;
GO