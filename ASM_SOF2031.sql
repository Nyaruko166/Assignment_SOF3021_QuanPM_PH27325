CREATE DATABASE ASM_SOF3021
GO
USE ASM_SOF3021
GO


CREATE TABLE TaiKhoanGame
(
    Id      INT PRIMARY KEY IDENTITY (1,1),
    Ma      VARCHAR(20) UNIQUE,
    Ten     NVARCHAR(50)   DEFAULT NULL,
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
    TrangThai BIT
)

ALTER TABLE HoaDonChiTiet
    ADD FOREIGN KEY (IdHD) REFERENCES HoaDon (id);
ALTER TABLE HoaDonChiTiet
    ADD FOREIGN KEY (IdTK) REFERENCES TaiKhoanGame (id);

INSERT INTO TaiKhoanGame (Ma, Ten, SoLuong, DonGia, Server, Anh)
VALUES ('TK001', N'Tl10+ | Honkai Star Rail Reroll account', 30, 10000, 'Asia',
        '/img/tl10.jpg'),
       ('TK002', N'TL15+ | Honkai Star Rail Reroll account', 20, 15000, 'EU',
        '/img/tl15.jpg'),
       ('TK003', N'TL20+ | Honkai Star Rail Reroll HSR acc gem', 6, 25000, 'Asia',
        '/img/tl20.jpg'),
       ('TK004', N'TL25+ | Honkai Star Rail HSR Reroll account', 4, 55000, 'US',
        '/img/tl25.jpg'),
       ('TK005', N'TL30+ | Honkai Star Rail Reroll HSR acc gem', 2, 70000, 'Asia',
        '/img/tl30.jpg'),
       ('TK006', N'Tl40+ | Honkai Star Rail Reroll HSR acc gem', 1, 100000, 'Asia',
        '/img/tl40.jpg')

INSERT INTO TaiKhoan (Username, Password, Email, Role, TrangThai)
VALUES ('Nyaruko', 123123, N'occho1666@gmail.com', N'Admin', 1),
       ('Nya', 123123, N'abcxyz@gmail.com', N'Khách Hàng', 0),
       ('KhachHang', 123123, N'quanpmph27325@fpt.edu.vn', N'Khách Hàng', 1)

SELECT *
FROM TaiKhoanGame

SELECT *
FROM TaiKhoan