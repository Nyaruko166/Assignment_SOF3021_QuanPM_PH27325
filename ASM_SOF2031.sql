CREATE DATABASE ASM_SOF3021
GO
USE ASM_SOF3021
GO


CREATE TABLE TaiKhoanGame
(
    Id      INT PRIMARY KEY IDENTITY (1,1),
    Ma      VARCHAR(20) UNIQUE,
    Ten     NVARCHAR(100)  DEFAULT NULL,
    SoLuong INT,
    DonGia  DECIMAL(20, 0) DEFAULT 0,
    Server  VARCHAR(10)  NOT NULL,
    Anh     VARCHAR(MAX) NOT NULL
)

CREATE TABLE HoaDonChiTiet
(
    Id        INT PRIMARY KEY IDENTITY (1,1),
    IdHD      INT,
    IdTK      INT,
    SoLuong   INT,
    DonGia    DECIMAL(20, 0),
    ThanhTien DECIMAL(20, 0),
    NgayTao   DATE
)

CREATE TABLE HoaDon
(
    Id            INT PRIMARY KEY IDENTITY (1,1),
    TongTien      DECIMAL(20, 0),
    TenKhachHang  NVARCHAR(20),
    NgayThanhToan DATE
)

CREATE TABLE TaiKhoan
(
    Id        INT PRIMARY KEY IDENTITY (1,1),
    Username  VARCHAR(50),
    Password  VARCHAR(50),
    Email     VARCHAR(50),
    Role      NVARCHAR(50),
)

ALTER TABLE HoaDonChiTiet
    ADD FOREIGN KEY (IdHD) REFERENCES HoaDon (id);
ALTER TABLE HoaDonChiTiet
    ADD FOREIGN KEY (IdTK) REFERENCES TaiKhoanGame (id);

INSERT INTO TaiKhoanGame (Ma, Ten, SoLuong, DonGia, Server, Anh)
VALUES ('TK001', N'Tl10+ | Honkai Star Rail Reroll account', 123, 10000, 'Asia',
        '/img/tl10.jpg'),
       ('TK002', N'TL15+ | Honkai Star Rail Reroll account', 512, 15000, 'EU',
        '/img/tl15.jpg'),
       ('TK003', N'TL20+ | Honkai Star Rail Reroll HSR acc gem', 125, 25000, 'Asia',
        '/img/tl20.jpg'),
       ('TK004', N'TL25+ | Honkai Star Rail HSR Reroll account', 245, 55000, 'US',
        '/img/tl25.jpg'),
       ('TK005', N'TL30+ | Honkai Star Rail Reroll HSR acc gem', 150, 70000, 'Asia',
        '/img/tl30.jpg'),
       ('TK006', N'Tl40+ | Honkai Star Rail Reroll HSR acc gem', 420, 100000, 'Asia',
        '/img/tl40.jpg'),
       ('TK007', N'Cl45+ | 11000+ Gems Honkai Impact 3 Reroll', 500, 100000, 'Sea',
        '/img/hk45.jpg'),
       ('TK008', N'Cl40+ | 19000+ Gems Honkai Impact 3 Reroll', 200, 200000, 'Japan',
        '/img/hk40.jpg'),
       ('TK009', N'Pc10+ | 100k Gems | Princess Connet Re:dive Starter account', 161, 40000, 'Japan',
        '/img/pc10.jpg'),
       ('TK010', N'Pc20+ | 145k+ Gems | Princess Connect Re:Dive Starter Accounts', 452, 80000, 'Japan',
        '/img/pc20.jpg'),
       ('TK011', N'Ba10+ | 30,000 Gems | Blue Archive Start Basic Gem', 621, 300000, 'Japan',
        '/img/ba10.jpg')


INSERT INTO TaiKhoan (Username, Password, Email, Role)
VALUES ('Nyaruko', 123123, N'occho1666@gmail.com', N'Admin'),
       ('Nya', 123123, N'abcxyz@gmail.com', N'Khách Hàng'),
       ('KhachHang', 123123, N'quanpmph27325@fpt.edu.vn', N'Khách Hàng'),
       ('Nya123', 123456, N'abcxyzdhg@gmail.com', N'Khách Hàng'),
       ('KhachHang123', 123123, N'abcdef@fpt.edu.vn', N'Khách Hàng')

SELECT *
FROM TaiKhoanGame

SELECT *
FROM TaiKhoan

SELECT *
FROM HoaDon

SELECT *
FROM HoaDonChiTiet

SELECT TOP 10 tkg.Ten, SUM(hdct.SoLuong) AS tongSoLuong
FROM TaiKhoanGame tkg
         JOIN HoaDonChiTiet hdct ON tkg.Id = hdct.IdTK
         JOIN HoaDon hd ON hdct.IdHD = hd.Id
WHERE WEEK(hd.n) = 1
GROUP BY tkg.Ten
ORDER BY tongSoLuong DESC

SELECT TOP 10 p.product_name, SUM(id.quantity) AS total_quantity
FROM products p
         JOIN invoice_details id ON p.product_id = id.product_id
         JOIN invoices i ON id.invoice_id = i.invoice_id
WHERE MONTH(i.invoice_date) = MONTH(GETDATE())
  AND YEAR(i.invoice_date) = YEAR(GETDATE())
GROUP BY p.product_name
ORDER BY total_quantity DESC;

UPDATE HoaDon
SET NgayThanhToan = '2023-03-02'
WHERE Id = 1;
UPDATE HoaDon
SET NgayThanhToan = '2023-02-11'
WHERE Id = 2;
UPDATE HoaDon
SET NgayThanhToan = '2023-05-30'
WHERE Id = 3;

UPDATE HoaDonChiTiet
SET NgayTao = '2023-03-02'
WHERE IdHD = 1;
UPDATE HoaDonChiTiet
SET NgayTao = '2023-02-11'
WHERE IdHD = 2;
UPDATE HoaDonChiTiet
SET NgayTao = '2023-05-30'
WHERE IdHD = 3;

DECLARE @date DATE;
SET @date = '2023-06-14';

SELECT DATEPART(WEEK, @date) AS week_number;

