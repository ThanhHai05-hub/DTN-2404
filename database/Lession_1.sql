-- Hai dấu gạch ngang để comment 
-- XÓA DATABASE [nếu tồn tại]
DROP DATABASE IF EXISTS lesstion_1;
-- Tạo databasse nếu không  tồn tại alter
CREATE DATABASE IF NOT EXISTS  lesstion_1;

-- Chọn database để bắt đầu thao tác 
USE lesstion_1;

-- * Kiểu dữ liệu 
-- - Kiểu số nguyên TINYINT (1 BYTE) , SMALLINT (2 BYTE) , MEDIUMINT (3 BYTE) , INT (4 BYTE)
-- 		,BIGINT (8 BYTE)
-- - Kiểu số thực: FLOAT (4 BYTE), DOUBLE (8 BYTE)
-- - Kiểu chuỗi : CHAR  và VARCHAR
-- - Kiểu logic: BOOLEAN 
-- - Kiểu thời gian : DATE ( năm-tháng-ngày ) , TIME (GIỜ PHÚT GIÂY), DATETIME ( năm-tháng-ngày VÀ GIỜ PHÚT GIÂY)
-- - Kiểu enum: ENUM ('MALE' , 'FEMALE' , 'UNKNOW') (giới hạn lại trạng thái nhận vào ) 

-- TẠO BẢNG
-- UNSIGNED : lấy số dương
-- varchar(50) : lấy tối đa 50 ký tự 


CREATE TABLE department(
	id INT UNSIGNED ,
    name VARCHAR(50),
    create_at DATETIME
    
    
);
 
-- TẠO BẢNG NẾU TỒN TẠI 
DROP TABLE IF EXISTS department;

-- THÊM DỮ LIỆU 
-- CHUỖI THÌ THÊM BẰNG NGÁY ĐƠN HAY KÉP ĐỀU ĐƯỢC ) 
INSERT INTO department(id, name		, create_at)
VALUES 				  (1, "Giám đốc", CURRENT_TIMESTAMP),
					  (2, 'Bảo vệ'  , '2023-04-23 10:23:23');
-- TRUY VẤN DỮ LIỆU 
SELECT * FROM department;

-- RÀNG BUỘC DỮ LIỆU 
--  PRIMARY KEY : KHÓA CHÍNH = UNIQUE + NOT NULL 
-- TỪ KHÓA: AUTO INCREMENT  ĐỂ TỰ ĐỘNG TĂNG 
-- 1. MỘT BẢNG CÓ TỐI ĐA 1 KHÓA CHÍNH 
-- 2. GIÁ TRỊ LÀ DUY NHẤT VÀ KHÁC NULL 
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(50)
    
    
);
INSERT INTO customer( name)
VALUES 				('Hồ Thanh Hải'),
					("Hồ Gia Bảo");


-- VD: KHÓA CHÍNH CÓ 2 TRƯỜNG 
CREATE TABLE group_account(
		group_id INT ,
        account_id INT,
        joined_at DATETIME,
        PRIMARY KEY (group_id, account_id)
);
-- UNIQUE KEY : RÀNG BUỘC DUY NHẤT 
-- Từ khóa này giúp ngăn chặn việc nhập hai dữ liệu giống hệt nhau 
-- vào cùng một trường dữ liệu, ví dụ như số điện thoại hoặc email của người dùng
CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT ,
    user_name VARCHAR(50),
    email VARCHAR(50) UNIQUE    
    
);
INSERT INTO account( email)
VALUES 				('khoa.vn@gmai.com'),
					('khoa.vn@gmai.com');

-- NOT NULL : KHÔNG ĐƯỢC PHÉP ĐỂ TRỐNG
-- NULL : KHÔNG CÓ VÍ LUÔN 
-- "" : CÓ VÍ MÀ KHÔNG CÓ TIỀN 

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	price DOUBLE NOT NULL 
      
    
);
INSERT INTO product (price)
VALUE 				(NULL );
-- NẾU KHÔNG CẤU HÌNH THÌ CÓ THỂ NULL ĐƯỢC 


-- DEFAULT: GIÁ TRỊ MẶC ĐỊNH 
-- NẾU NGƯỜI DÙNG KHÔNG THÊM DỮ LIỆU THÌ TỰ ĐỘNG THÊM GIÁ TRỊ MẶC ĐỊNH 

CREATE TABLE post(
	id INT PRIMARY KEY AUTO_INCREMENT ,
    title VARCHAR(50),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
INSERT INTO post( title )
VALUES 			("BÁO MỚI")
;


-- CHECK : KIỂM TRA 

CREATE TABLE users(
		id INT PRIMARY KEY AUTO_INCREMENT,
        age  INT   NOT NULL CHECK ( age >= 18) 
);

INSERT INTO users (age)
VALUES 			 (12);



-- FOREIGN KEY : KHÓA
CREATE TABLE student (
	id INT PRIMARY KEY AUTO_INCREMENT,
	post_id INT,
    FOREIGN KEY (post_id) REFERENCES  post(id) 
    
    
);
INSERT INTO student(post_id)
VALUES 				(2);





