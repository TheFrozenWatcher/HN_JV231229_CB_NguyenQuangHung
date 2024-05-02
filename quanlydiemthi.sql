create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;

CREATE TABLE Student (
    studentId VARCHAR(4) PRIMARY KEY NOT NULL,
    studentName VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    gender BIT(1) NOT NULL,
    address TEXT NOT NULL,
    phoneNumber VARCHAR(45) unique
);

CREATE TABLE Subject (
    subjectId VARCHAR(4) PRIMARY KEY NOT NULL,
    subjectName VARCHAR(45) NOT NULL,
    priority INT(11) NOT NULL
);

CREATE TABLE Mark (
    subjectId VARCHAR(4) NOT NULL,
    studentId VARCHAR(4) NOT NULL,
    point FLOAT(11) NOT NULL,
    primary key (subjectId,studentId),
    FOREIGN KEY (studentId)
        REFERENCES Student (studentId),
    FOREIGN KEY (subjectId)
        REFERENCES Subject (subjectId)
);

-- Bài 2: Thêm , sửa , xoá dữ liệu
-- Thêm thông tin học sinh
INSERT INTO Student (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES
('S001', 'Nguyễn Thế Anh', '1999-01-11', b'1', 'Hà Nội', '984678082'),
('S002', 'Đặng Bảo Trâm', '1998-12-22', b'0', 'Lào Cai', '904982654'),
('S003', 'Trần Hà Phương', '2000-05-05', b'0', 'Nghệ An', '947645363'),
('S004', 'Đỗ Tiến Mạnh', '1999-03-26', b'1', 'Hà Nội', '983665353'),
('S005', 'Phạm Duy Nhất', '1998-10-04', b'1', 'Tuyên Quang', '987242678'),
('S006', 'Mai Văn Thái', '2002-06-22', b'1', 'Nam Định', '982654268'),
('S007', 'Giang Gia Hân', '1996-11-10', b'0', 'Phú Thọ', '982364753'),
('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', b'0', 'Hà Nam', '927867453'),
('S009', 'Nguyễn Tiến Đạt', '1998-08-07', b'1', 'Tuyên Quang', '989274673'),
('S010', 'Nguyễn Thiều Quang', '2000-09-18', b'1', 'Hà Nội', '984378291');

-- Thêm thông tin môn học

INSERT INTO Subject(subjectId,subjectName,priority) values 
('MH01', 'Toán',2),
('MH02','Vật lý',2),
('MH03','Hóa học',1),
('MH04','Ngữ Văn',1),
('MH05', 'Tiếng Anh',2);

-- Thêm thông tin điểm

INSERT INTO Mark (subjectId, studentId, point)
VALUES
('MH01', 'S001', 8.5),
('MH02', 'S001', 7),
('MH03', 'S001', 9),
('MH04', 'S001', 9),
('MH05', 'S001', 5),

('MH01', 'S002', 9),
('MH02', 'S002', 8),
('MH03', 'S002', 6.5),
('MH04', 'S002', 8),
('MH05', 'S002', 6),

('MH01', 'S003', 7.5),
('MH02', 'S003', 6.5),
('MH03', 'S003', 8),
('MH04', 'S003', 7),
('MH05', 'S003', 7),

('MH01', 'S004', 6),
('MH02', 'S004', 7),
('MH03', 'S004', 5),
('MH04', 'S004', 6.5),
('MH05', 'S004', 8),

('MH01', 'S005', 5.5),
('MH02', 'S005', 8),
('MH03', 'S005', 7.5),
('MH04', 'S005', 8.5),
('MH05', 'S005', 9),

('MH01', 'S006', 8),
('MH02', 'S006', 10),
('MH03', 'S006', 9),
('MH04', 'S006', 7.5),
('MH05', 'S006', 6.5),

('MH01', 'S007', 9.5),
('MH02', 'S007', 9),
('MH03', 'S007', 6),
('MH04', 'S007', 9),
('MH05', 'S007', 4),

('MH01', 'S008', 10),
('MH02', 'S008', 8.5),
('MH03', 'S008', 8.5),
('MH04', 'S008', 6),
('MH05', 'S008', 9.5),

('MH01', 'S009', 7.5),
('MH02', 'S009', 7),
('MH03', 'S009', 9),
('MH04', 'S009', 5),
('MH05', 'S009', 10),

('MH01', 'S010', 6.5),
('MH02', 'S010', 8),
('MH03', 'S010', 5.5),
('MH04', 'S010', 4),
('MH05', 'S010', 7);

-- 2. Cập nhật dữ liệu [10 điểm]:
-- - Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh
UPDATE Student 
SET 
    studentName = 'Đỗ Đức Mạnh'
WHERE
    studentId = 'S004';
    
-- Kiểm tra
SELECT 
    *
FROM
    student
WHERE
    studentId = 'S004';

    
-- - Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
UPDATE Subject 
SET 
    subjectName = 'Ngoại Ngữ'
WHERE
    subjectId = 'MH05';
UPDATE Subject 
SET 
    priority = 1
WHERE
    subjectId = 'MH05';
-- - Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
UPDATE Mark
SET point = CASE
    WHEN subjectId = 'MH01' THEN 8.5
    WHEN subjectId = 'MH02' THEN 7
    WHEN subjectId = 'MH03' THEN 5.5
    WHEN subjectId = 'MH04' THEN 6
    WHEN subjectId = 'MH05' THEN 9
END
WHERE studentId = 'S009';

-- Chạy thử
SELECT 
    *
FROM
    Mark
WHERE
    studentId = 'S009';


-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT
DELETE FROM Mark 
WHERE
    studentId = 'S010';
DELETE FROM Student 
WHERE
    studentId = 'S010';

-- Bài 3: Truy vấn dữ liệu [25 điểm]:
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
SELECT 
    *
FROM
    student;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
SELECT 
    *
FROM
    subject
WHERE
    priority = 1;
-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
SELECT 
    studentId as 'Id',
    studentName as 'Tên học sinh',
    YEAR(CURRENT_DATE()) - YEAR(birthday) AS Tuổi,
    CASE
        WHEN gender = 1 THEN 'Nam'
        WHEN gender = 0 THEN 'Nữ'
    END AS 'Giới tính',
    address AS 'Quê quán'
FROM
    student;
-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần. [4 điểm]
SELECT 
    s.studentName AS 'Tên học sinh', sub.subjectName as 'Tên môn học', m.point as 'Điểm'
FROM
    Mark m
        JOIN
    Student s ON m.studentId = s.studentId
        JOIN
    Subject sub ON m.subjectId = sub.subjectId
WHERE
    sub.subjectName = 'Toán'
ORDER BY m.point DESC;
-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng). [4 điểm]
SELECT 
    CASE
        WHEN gender = 1 THEN 'Nam'
        WHEN gender = 0 THEN 'Nữ'
    END AS 'Giới tính',
    COUNT(*) as 'Số lượng'
FROM
    student
GROUP BY gender;
-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
SELECT 
    s.studentId as 'Mã học sinh',
    studentName as 'Tên học sinh',
    SUM(point) AS 'Tổng điểm',
    AVG(point) AS 'Điểm trung bình'
FROM
    student s
        JOIN
    mark m ON s.studentId = m.studentId
GROUP BY s.studentId;

-- Bài 4: Tạo View, Index, Procedure [20 điểm]:
-- 1.
-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao
-- gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán .
-- [3 điểm]

create view STUDENT_VIEW as
select studentId as 'Mã học sinh',
studentName as 'Tên học sinh',
case when gender=1 then 'Nam' when gender=0 then 'Nữ' end as 'Giới tính',
address as 'Quê quán'
from student;

SELECT 
    *
FROM
    STUDENT_VIEW;
-- 2.
-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học .
-- [3 điểm]
CREATE VIEW AVERAGE_MARK_VIEW AS
    SELECT 
        s.studentId as 'Mã học sinh',
        studentName as 'Tên học sinh',
        AVG(point) AS 'Điểm trung bình'
    FROM
        student s
            JOIN
        mark m ON s.studentId = m.studentId
    GROUP BY s.studentId, s.studentName;

SELECT 
    *
FROM
    AVERAGE_MARK_VIEW;
-- 3.
-- Đánh Index cho trường `phoneNumber` của bảng STUDENT.
-- [2 điểm]
CREATE INDEX idx_phoneNumber ON Student(phoneNumber);

-- 4.
-- Tạo
-- các PROCEDURE sau:
-- -
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
-- thông tin học sinh đó.
-- [3 điểm]

DELIMITER //

CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN p_studentId VARCHAR(4),
    IN p_studentName VARCHAR(100),
    IN p_birthday DATE,
    IN p_gender BIT(1),
    IN p_address TEXT,
    IN p_phoneNumber VARCHAR(45)
)
BEGIN
    INSERT INTO Student (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
END //
DELIMITER;



DELIMITER ;

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
-- [3 điểm]
DELIMITER //

CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN p_subjectId VARCHAR(4),
    IN p_newSubjectName VARCHAR(100)
)
BEGIN
    UPDATE Subject
    SET subjectName = p_newSubjectName
    WHERE subjectId = p_subjectId;
END //

DELIMITER ;

-- Chạy thử 
SELECT 
    *
FROM
    subject;
call PROC_UPDATESUBJECT('MH05','Tiếng Nhật');
SELECT 
    *
FROM
    subject;


-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh. [3 điểm]
DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK(
    IN p_studentId varchar(4)
)
BEGIN
    DELETE FROM Mark WHERE studentId = p_studentId;
END //
DELIMITER ;


-- Chạy thử

call PROC_INSERTSTUDENT('S010', 'Nguyễn Thiều Quang', '2000-09-18', b'1', 'Hà Nội', '984378291');
insert into Mark values ('MH01', 'S010', 6.5),
('MH02', 'S010', 8),
('MH03', 'S010', 5.5),
('MH04', 'S010', 4),
('MH05', 'S010', 7);
SELECT 
    *
FROM
    student;
SELECT 
    *
FROM
    Mark;
 call PROC_DELETEMARK('S010');
SELECT 
    *
FROM
    Mark;


