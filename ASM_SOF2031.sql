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
        'https://i.postimg.cc/Vk6CCwnm/163795-copy-copy-2-copy.webp'),
       ('TK002', N'TL15+ | Honkai Star Rail Reroll account', 20, 15000, 'EU',
        'https://i.postimg.cc/WbtkQ1md/honkaisr-1-copy.webp'),
       ('TK003', N'TL20+ | Honkai Star Rail Reroll HSR acc gem', 6, 25000, 'Asia',
        'https://i.postimg.cc/ZqD19kzf/honkaisr-1-copy-Recovered-1-copy.webp'),
       ('TK004', N'TL25+ | Honkai Star Rail HSR Reroll account', 4, 55000, 'US',
        'https://i.postimg.cc/MH1Q3w9G/honkaisr-1.webp'),
       ('TK005', N'TL30+ | Honkai Star Rail Reroll HSR acc gem', 2, 70000, 'Asia',
        'https://i.postimg.cc/RFcxC3sy/163796-copy-copy-2-copy.png'),
       ('TK006', N'Tl40+ | Honkai Star Rail Reroll HSR acc gem', 1, 100000, 'Asia',
        'https://i.postimg.cc/HsPb0HCv/aaaa.jpg')

SELECT *
FROM TaiKhoanGame