DROP DATABASE IF EXISTS assignment_06;

CREATE DATABASE assignment_06;
USE assignment_06;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(50) 
);

-- Tạo bảng position
DROP TABLE IF EXISTS position;
CREATE TABLE position (
  position_id INT PRIMARY KEY AUTO_INCREMENT,
  position_name ENUM("Dev", "Test", "Scrum Master", "PM") 
);

-- Tạo bảng account
DROP TABLE IF EXISTS account;
CREATE TABLE account (
  account_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(50) ,
  username VARCHAR(50) ,
  full_name VARCHAR(50) ,
  department_id INT,
  position_id INT,
  created_date DATE ,
  FOREIGN KEY (department_id) REFERENCES department (department_id),
  FOREIGN KEY (position_id) REFERENCES position (position_id)
);

-- Tạo bảng group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  group_id INT PRIMARY KEY AUTO_INCREMENT,
  group_name VARCHAR(50) ,
  creator_id INT,
  created_date timestamp default current_timestamp,
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng group_account
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
  group_id INT,
  account_id INT,
  joined_date timestamp DEFAULT current_timestamp,
  PRIMARY KEY (group_id, account_id),
  FOREIGN KEY (group_id) REFERENCES `group` (group_id),
  FOREIGN KEY (account_id) REFERENCES account (account_id)
);

-- Tạo bảng type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
  type_id INT PRIMARY KEY AUTO_INCREMENT,
  type_name ENUM("Essay", "Multiple-Choice") 
);

-- Tạo bảng category_question
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(50) 
);

-- Tạo bảng question
DROP TABLE IF EXISTS question;
CREATE TABLE question (
  question_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(50) ,
  category_id INT,
  type_id INT,
  creator_id INT,
  created_date timestamp DEFAULT current_timestamp,
  FOREIGN KEY (category_id) REFERENCES category_question (category_id),
  FOREIGN KEY (type_id) REFERENCES type_question (type_id),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
  answer_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(50),
  question_id INT,
  is_correct BOOLEAN ,
  FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Tạo bảng exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
  exam_id INT PRIMARY KEY AUTO_INCREMENT,
  code CHAR(10),
  title VARCHAR(50) ,
  category_id INT,	
  duration INT,
  creator_id INT,
  created_date timestamp DEFAULT current_timestamp,
  FOREIGN KEY (category_id) REFERENCES category_question (category_id),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng exam_question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
  exam_id INT,
  question_id INT,
  PRIMARY KEY (exam_id, question_id),
  FOREIGN KEY (exam_id) REFERENCES exam (exam_id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Thêm dữ liệu cho bảng department
INSERT INTO department (department_name)
VALUES         ("Marketing"  ),
            ("Sale"     ),
            ("Bảo vệ"    ),
            ("Nhân sự"   ),
            ("Kỹ thuật"   ),
            ("Tài chính"  ),
            ("Phó giám đốc" ),
            ("Giám đốc"   ),
            ("Thư kí"    ),
            ("Bán hàng"   ); 

-- Thêm dữ liệu cho bảng position
INSERT INTO position  (position_name )
VALUES         ("Dev"     ),
            ("Test"    ),
            ("Scrum Master"),
            ("PM"     );

-- Thêm dữ liệu cho bảng account
INSERT INTO account (email              , username   , full_name      , department_id, position_id, created_date)
VALUES       ("haidang29productions@gmail.com", "dangblack"  , "Nguyen Hai Dang"  , 5      , 1     , "2020-03-05"),
          ("account1@gmail.com"      , "quanganh"  , "Tong Quang Anh"  , 1      , 2     , "2020-03-05"),
          ("account2@gmail.com"      , "vanchien"  , "Nguyen Van Chien" , 2      , 3     , "2020-03-07"),
          ("account3@gmail.com"      , "cocoduongqua", "Duong Do"     , 3      , 4     , "2020-03-08"),
          ("account4@gmail.com"      , "doccocaubai" , "Nguyen Chien Thang", 4      , 4     , "2020-03-10"),
          ("dapphatchetngay@gmail.com"   , "khabanh"   , "Ngo Ba Kha"    , 6      , 3     , "2020-04-05"),
          ("songcodaoly@gmail.com"     , "huanhoahong" , "Bui Xuan Huan"   , 2      , 2     , "2020-04-05"),
          ("sontungmtp@gmail.com"     , "tungnui"   , "Nguyen Thanh Tung" , 8      , 1     , "2020-04-07"),
          ("duongghuu@gmail.com"      , "duongghuu"  , "Duong Van Huu"   , 9      , 2     , "2020-04-07"),
          ("vtiaccademy@gmail.com"     , "vtiaccademy" , "Vi Ti Ai"     , 10      , 1     , "2020-04-09");

-- Thêm dữ liệu cho bảng group
INSERT INTO `group` (group_name     , creator_id, created_date)
VALUES       ("Testing System"  , 5     , "2019-03-05"),
          ("Developement"   , 1     , "2020-03-07"),
          ("VTI Sale 01"   , 2     , "2020-03-09"),
          ("VTI Sale 02"   , 3     , "2020-03-10"),
          ("VTI Sale 03"   , 4     , "2020-03-28"),
          ("VTI Creator"   , 6     , "2020-04-06"),
          ("VTI Marketing 01" , 7     , "2020-04-07"),
          ("Management"    , 8     , "2020-04-08"),
          ("Chat with love"  , 9     , "2020-04-09"),
          ("Vi Ti Ai"     , 10    , "2020-04-10");

-- Thêm dữ liệu cho bảng group_account
INSERT INTO group_account  (group_id, account_id, joined_date )
VALUES           (1    , 1     , "2019-03-05"),
              (2    , 1     , "2020-03-07"),
              (3    , 1     , "2020-03-09"),
              (2    , 4     , "2020-03-10"),
              (5    , 5     , "2020-03-28"),
              (2    , 6     , "2020-04-06"),
              (7    , 7     , "2020-04-07"),
              (3    , 8     , "2020-04-08"),
              (2    , 9     , "2020-04-09"),
              (10   , 10    , "2020-04-10");

-- Thêm dữ liệu cho bảng type_question
INSERT INTO type_question (type_name) VALUES ("Essay"), ("Multiple-Choice"); 

-- Thêm dữ liệu cho bảng category_question
INSERT INTO category_question  (category_name)
VALUES             ("Java"    ),
                ("ASP.NET"  ),
                ("ADO.NET"  ),
                ("SQL"    ),
                ("Postman"  ),
                ("Ruby"    ),
                ("Python"   ),
                ("C++"    ),
                ("C Sharp"  ),
                ("PHP"    ); 

-- Thêm dữ liệu cho bảng question
INSERT INTO question  (content     , category_id, type_id, creator_id, created_date)
VALUES         ("Câu hỏi về Java", 1     , 1   , 1     , "2020-04-05"),
            ("Câu Hỏi về PHP" , 10     , 2   , 2     , "2020-04-05"),
            ("Hỏi về C#"   , 9     , 2   , 3     , "2020-04-06"),
            ("Hỏi về Ruby"  , 6     , 1   , 2     , "2020-04-06"),
            ("Hỏi về Postman" , 5     , 1   , 3     , "2020-04-06"),
            ("Hỏi về ADO.NET" , 3     , 2   , 6     , "2020-04-06"),
            ("Hỏi về ASP.NET" , 2     , 1   , 2     , "2020-04-06"),
            ("Hỏi về C++"   , 8     , 1   , 8     , "2020-04-07"),
            ("Hỏi về SQL"   , 4     , 2   , 3     , "2020-04-07"),
            ("Hỏi về Python" , 7     , 1   , 10    , "2020-04-07");

-- Thêm dữ liệu cho bảng answer
INSERT INTO answer (content   , question_id, is_correct)
VALUES       ("Trả lời 01", 1     , 0     ),
          ("Trả lời 02", 1     , 1     ),
          ("Trả lời 03", 1     , 0     ),
          ("Trả lời 04", 1     , 1     ),
          ("Trả lời 05", 2     , 1     ),
          ("Trả lời 06", 3     , 1     ),
          ("Trả lời 07", 4     , 0     ),
          ("Trả lời 08", 8     , 0     ),
          ("Trả lời 09", 9     , 1     ),
          ("Trả lời 10", 10     , 1     );

-- Thêm dữ liệu cho bảng exam
INSERT INTO exam  (code  , title      , category_id, duration, creator_id, created_date)
VALUES       ("VTIQ001", "Đề thi C#"   , 1     , 60   , 3     , "2019-04-05"),
          ("VTIQ002", "Đề thi PHP"  , 10     , 60   , 1     , "2019-04-05"),
          ("VTIQ003", "Đề thi C++"  , 9     , 120   , 2     , "2019-04-07"),
          ("VTIQ004", "Đề thi Java"  , 7     , 60   , 3     , "2020-04-08"),
          ("VTIQ005", "Đề thi Ruby"  , 5     , 120   , 4     , "2020-04-10"),
          ("VTIQ006", "Đề thi Postman", 8     , 60   , 6     , "2020-04-05"),
          ("VTIQ007", "Đề thi SQL"  , 7     , 60   , 1     , "2020-04-05"),
          ("VTIQ008", "Đề thi Python" , 8     , 60   , 8     , "2020-04-07"),
          ("VTIQ009", "Đề thi ADO.NET", 4     , 90   , 3     , "2020-04-07"),
          ("VTIQ010", "Đề thi ASP.NET", 7     , 90   , 10    , "2020-04-08");

-- Thêm dữ liệu cho bảng exam_question
INSERT INTO exam_question  (question_id, exam_id)
VALUES           (1     , 1   ),
              (2     , 2   ),
              (3     , 1   ),
              (4     , 4   ),
              (5     , 1   ),
              (6     , 2   ),
              (7     , 1   ),
              (8     , 8   ),
              (9     , 2   ),
              (10     , 10    );
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó.
use assignment_06;
drop procedure if exists sp_02;
 Delimiter $$
 create procedure sp_02 (in department_name_in varchar(50))
 begin 
	select `account`.* 
    from `account`
    where department_id = (select department_id
							from department
                            where department_name = department_name_in);
 end $$
 Delimiter ;
 
 Call sp_02("Marketing");     
 
-- Question 2: Tạo store để in ra số lượng account trong mỗi group.
Delimiter $$
create  procedure sp_03()
begin 
	select `group`.* , count(account_id) as SoLuongNhanVien
    from `group` 
    left join group_account using (group_id) 
    group by group_id;
end $$
Delimiter ;

call sp_03();

drop procedure sp_03;
         
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại.
drop procedure if exists sp_04;
Delimiter $$
create procedure sp_04()
begin 
	with c1 as (
    select question.* 
    from question
    where month(current_date()) = month(created_date)) 
    
    select type_question.* , count(question_id)
    from type_question
    left join c1 using(type_id)
    group by type_id;
    
    
end $$
Delimiter ;
		
call sp_04();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất.
drop function if exists fn_04;
Delimiter $$
create function fn_04() returns int 
deterministic
begin 
	declare v_id_type_question int ;
	with c1 as(
				select *, count(question_id) as SoLuongCauHoi
                from type_question
                left join question using (type_id)
                group by type_id)
	select type_id into v_id_type_question
    from c1
    where SoLuongCauHoi = (select max(SoLuongCauHoi)
							from c1);
	return v_id_type_question;
                
end $$
Delimiter ;

select fn_04();


-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question.


drop procedure if exists sp_06;
Delimiter $$
create procedure sp_06()
begin 
	select type_name
	from type_question
	where type_id = fn_04();
end $$
Delimiter ;

call sp_06();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào.
drop procedure if exists sp_07;
Delimiter $$
create procedure sp_07(in user_in varchar(50))
begin 
	declare pattern varchar(50) default concat("%" , user_in ,"%");
	select 'group' as type, group_name as result 
    from `group` 
    where group_name like pattern
    union 
    select 'account' as type, username  as result 
    from `account` 
    where username like pattern;
end $$
Delimiter ;

call sp_07("n");
  
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
drop procedure if exists sp_08;
Delimiter $$
create procedure sp_08(in full_name_in varchar(50), in email_in varchar(50))

begin 
	declare user_name varchar(50) default substring_index(email_in, "@" , 1);
    declare position_id_in int;
    declare department_id_in int;
    
    select position_id into position_id_in
    from position 
    where position_name = "Dev";
    
    select department_id 
    from department 
    where department_name = "Phòng chờ";
    
	insert into  account(email, username,full_name, department_id, position_id  ) 
	values (email_in, user_name,full_name_in, department_id_in, position_id);
end $$

Delimiter ;

call sp_08("Hồ Ngọc Ngân " , "hongocngan563@gmail.com");

select *
from `account`;
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
drop procedure if exists sp_09;

Delimiter $$
create procedure sp_05(in kind_question_name enum("essay" , "Multiple-choice"))
begin 
	declare v_type_id int ;
    
	select type_id into v_type_id
    from type_question
    where type_name = kind_question_name;
    
    with c1 as (
    select `question`.* , char_length(content) as length_content
    from question
    where type_id = v_type_id )
    
    select *
    from c1 
    where length_content = (select max(length_content)
							from c1);
							
    
end $$
Delimiter ;
		
call sp_05("multiple-choice");
	
         
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID         
drop procedure if exists sp_10;
Delimiter $$
	create procedure  sp_10(in v_id_in int)
    begin 
		declare id_u int ;
        delete 
        from exam 
        where exam_id = v_id_in;
        
    end $$
Delimiter ;

call sp_10(1);
-- Question 10: Tìm ra các exam được tạo từ 5 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi
-- removing
drop procedure if exists sp_11;
delimiter $$
create procedure sp_11()
begin 
	declare v_count int ;
    

	with c1 as (select exam_id 
    from exam 
	where created_date = current_date() - interval 5 year), c2 as (
    select exam_id
    from exam_question
    where exam_id = any ((
						select exam_id
                        from c1 ))), c3 as (
											select exam_id
                                            from c1
                                            union all
                                            select exam_id
                                            from c2
                                             
											)
                        
                        
	select count(exam_id) into v_count
    from c3;
		
	delete from exam
    where created_date = current_date() - interval 5 year;
    
    
    
    
    
    
    select concat("Số lượng bản ghi bị xóa là: " , v_count);
    
	
    
    
end $$
delimiter ;
select version();

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
drop procedure if exists sp_11;
Delimiter $$
create procedure sp_11(in name_de varchar(50))
begin 
	declare id_cho_viec int ;
    declare id_phongban int ;
    
    
    select department_id into id_phongban
    from department
    where department_name  = name_de;
    
	select department_id into id_cho_viec
    from department
    where department_name  = "Chờ Việc";
    
    update `account`
    set department_id = id_cho_viec
    where department_id = id_phongban;
    
    delete from department where department_id = id_phongban;
    
    
end $$
Delimiter ;

call sp_11("Sale");
select *
from department;

select *
from account;
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

drop procedure if exists sp_13;

Delimiter $$
create procedure sp_13()
begin 
	declare year_now int default year(current_date());
	with recursive c1 (month) as(
	select 1 
    union 
    select month +1  from c1 where month < 12), c2 as 
													(select *, month(created_date) as month 
													from question
                                                    where created_date = year_now
)

select c1.*, count(question_id) as SoLuongCauHoi
from c1 
left join c2 using (month)
group by month;
end $$
Delimiter ;

call sp_13();





    

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")         
drop procedure if exists sp_14;

Delimiter $$
create procedure sp_14()
begin 
	with recursive c1(date) as  (
	select current_date  - interval 1 month
	union  all 
	select date  - interval 1  month  from c1 where date > current_date - interval 6 month ) , 
															c2 as (
															select year(date) as year , month(date) as month 
															from c1), 
                                                            c3 as (
                                                            select *,year(created_date) as year , month(created_date) as month 
                                                            from question
                                                            )
	select c2.*, if(count(question_id) = 0, 'Không có câu hỏi nào trong tháng' , count(question_id)) as SoLuongCauHoi
	from c2
	left join c3 using (year,month)
	group by year,month ;
end $$
Delimiter ;

                                                

 call sp_14;        
         



         

         
         
         
         
         
         
         
              
              
              
              
              
              
              
              
              
              
              
	