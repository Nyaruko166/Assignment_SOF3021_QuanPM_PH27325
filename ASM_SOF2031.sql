CREATE DATABASE ASM_SOF3021
GO
USE ASM_SOF3021
GO
CREATE TABLE TaiKhoanGame
(
    Id      UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Ma      VARCHAR(20) UNIQUE,
    Ten     NVARCHAR(50)                 DEFAULT NULL,
    SoLuong INT,
    DonGia  DECIMAL(20, 0)               DEFAULT 0,
    Server  VARCHAR(10)  NOT NULL,
    Anh     VARCHAR(MAX) NOT NULL
)

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

SELECT *
FROM TaiKhoanGame