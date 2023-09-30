CREATE DATABASE IF NOT EXISTS testing_system;
USE testing_system;

/*
Crate table department
*/
CREATE TABLE department(
	DepartmentID TINYINT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE `account`;

CREATE TABLE `account`(
	AccountID SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Username VARCHAR(50) NOT NULL UNIQUE,
    FullName VARCHAR(50) NOT NULL,
    DepartmentID TINYINT,
    CONSTRAINT FOREIGN KEY fk_account_department(DepartmentID) REFERENCES department(DepartmentID)
);
/*
insert data
*/
-- department
INSERT INTO department (DepartmentName)
VALUE('Dev');
INSERT INTO department (DepartmentName)
VALUES
('BrSE'),
('HR');

-- account
INSERT INTO `account` (Email, Username, Fullname, DepartmentID)
VALUES
('quanghai@gmail.com', 'quanghai', 'Nguyen Quang Hai', 1),
('tuananh@gmail.com', 'tuananh', 'Nguyen Tuan Anh', 7),
('conphuong@gmail.com', 'conphuong', 'Nguyen Cong Phuong', 8),
('vanhau@gmail.com', 'vanhau', 'Doan Van Hau', 1);

/*
Truy vấn dữ liệu(query)
*/
-- Mệnh đề WHERE
SELECT * FROM department;
SELECT * FROM department WHERE DepartmentID = 1;
SELECT * FROM department WHERE DepartmentID = 2;
SELECT * FROM department WHERE DepartmentID IN (7, 8);
SELECT * FROM department WHERE DepartmentID NOT IN (7, 8);
SELECT DepartmentName, DepartmentID FROM department WHERE DepartmentID = 1;
-- Toán tử LIKE (important): 'pattern%'(bắt đầu là pattern); '%pattern'(kết thúc là pattern); '%pattern%'(chứa pattern)
-- VD1: Lấy ra những người có họ là nguyen trong bang account
SELECT *
FROM `account`
WHERE fullname LIKE 'nguyen%';

SELECT *
FROM `account`
WHERE fullname LIKE '%phuong';

SELECT *
FROM `account`
WHERE fullname LIKE '%van%';

-- Các toán tử khác: IS NULL, NOT NULL, BETWEEN, ...
-- VD: Tìm những người mà chưa thuộc phòng ban nào
SELECT *
FROM `account`
WHERE DepartmentID IS NULL;

-- VD: Tìm những người mà đã có phòng ban
SELECT AccountID, Username
FROM `account`
WHERE DepartmentID IS NOT NULL;

SELECT AccountID, Username
FROM `account`
WHERE AccountID BETWEEN 3 AND 5;

-- DISTINCT: Lấy những bản ghi không có giá trị trùng lặp trên một cột nào đó => DISTINCT phải đứng sau SELECT
SELECT DISTINCT Fullname, AccountID, Email, DepartmentID
FROM `account`;

SELECT DISTINCT DepartmentID
FROM `account`;

SELECT DISTINCT DepartmentID, Fullname
FROM `account`;-- (Không được)

SELECT DISTINCT DepartmentID, AccountID, Email, DepartmentID, FullName
FROM `account`;-- (Không được)
-- DISTINCT thực hiện trên một column duy nhất

-- ORDER BY(important):
SELECT * 
FROM `account` ORDER BY AccountID DESC; -- DESC(giảm dần) -- ASC(tăng dần)

SELECT * 
FROM `account` ORDER BY DepartmentID;

SELECT *
FROM `account` ORDER BY DepartmentID DESC;

-- Aggregate Functions: COUNT, SUM, MIN, MAX, AVG
SELECT COUNT(*) AS Total
FROM `account`;

SELECT SUM(AccountID) AS TotalID
FROM `account`;

SELECT MIN(AccountID) AS MinID
FROM `account`;

SELECT MAX(AccountID) AS MaxID
FROM `account`;

SELECT AVG(AccountID) AS AvgID
FROM `account`;

/*
group by & having(important)
*/
-- Nên sử dụng order by trước
SELECT * 
FROM `account` ORDER BY DepartmentID;

SELECT * 
FROM `account` GROUP BY DepartmentID;

-- JOIN 2 bảng(important)
SELECT *
FROM `account` ac
JOIN department dp ON dp.DepartmentID = ac.DepartmentID;

SELECT AccountID, Username, DepartmentName
FROM `account` ac
JOIN department dp ON dp.DepartmentID = ac.DepartmentID;

-- Nên dùng alias khi join và chỉ định rõ tên trường lấy ra thuộc bảng nào
SELECT ac.AccountID, ac.Username, dp.DepartmentName, dp.DepartmentID
FROM `account` ac
JOIN department dp ON dp.DepartmentID = ac.DepartmentID;

-- Group By
-- VD: Thống kê xem mỗi phòng ban có bao nhiêu account(chỉ sử dụng bảng account)
SELECT DepartmentID, COUNT(AccountID) AS Total
FROM `account`
GROUP BY DepartmentID;
-- VD: Lẫy những phòng ban có 2 người trở lên(chỉ sử dụng bảng account)
SELECT DepartmentID, COUNT(AccountID) AS Total
FROM `account`
GROUP BY DepartmentID
HAVING Total >= 2;
































































































