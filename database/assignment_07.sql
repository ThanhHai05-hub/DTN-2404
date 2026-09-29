DROP DATABASE IF EXISTS assignment_07;

CREATE DATABASE assignment_07;
USE assignment_07;

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
              
              
              
--  Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo
-- trước 1 năm trước
drop trigger if exists trigger_as_1;
delimiter $$
create trigger trigger_as_1
before insert on `group`
for each row
begin 
	if new.created_date < current_date() - interval 1 year  then 
		signal sqlstate '12345'
        -- SIGNAL chủ động tạo ra lỗi 
        set message_text = 'Cấm tạo group có ngày tạo trước 1 năm trước';
    end if;
end $$
delimiter ;


-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"
drop trigger if exists trigger_as_2;
delimiter $$
create trigger trigger_as_2
before insert on `account` 
for each row
begin 
	declare v_department_name varchar(50) default "Sale";
    declare v_department_id int ;
    
    select department_id into v_department_id
    from department 
    where department_name = v_department_name;
    
    
	if new.department_id = v_department_id then 
		signal sqlstate "12345"
        set message_text = "Sale cannot add more user";
        
	end if ;
end $$
delimiter ;

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user

drop trigger if exists trigger_as_3;
delimiter $$
create trigger trigger_as_3
before insert on group_account
for each row
begin 
	declare  count_emp int;
    
    with c1 as (select group_id, count(account_id) as count_employee
	from group_account 
	group by group_id) 
    
    select count_employee into count_emp
                            from c1
                            where group_id = new.group_id  ;
	
     
    
    if count_emp >= 5 then 
		signal sqlstate "12345"
        set message_text = "Số lượng nhân viên tối đa là 5";
    end if;
end $$
delimiter ;

-- test 
insert into group_account(group_id, account_id)
					values (7, 5);

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

drop trigger if exists trigger_as_4;
delimiter $$
create trigger trigger_as_4
before insert on exam_question
for each row
begin 
	declare v_count_question int;
    select count(question_id) into v_count_question
	from exam_question
	where exam_id = new.exam_id;
    
    if v_count_question >=10 then 
		signal sqlstate '12345'
        set message_text = "1 bài thi có nhiều nhất là 10 Question";
    end if;
end $$
delimiter ;



-- question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com 

drop trigger if exists trigger_as_5;
delimiter $$
create trigger trigger_as_5
before delete on `account`
for each row
begin 
	if old.email = "admin@gmail.com" then 
		signal sqlstate '12345'
        set message_text = "Không được phép xóa tài khoản";
    end if;
end $$
delimiter ;


-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"


drop trigger if exists trigger_as_6;
delimiter $$
create trigger trigger_as_6
before insert  on `account`
for each row
begin 
	if new.department_id is null  then 
		set new.department_id = (select department_id
							from department 
                            where department_name = "waiting Department");
    end if;
end $$
delimiter ;


-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.
drop trigger if exists trigger_as_7;
delimiter $$
create trigger trigger_as_7
before delete  on exam 
for each row
begin 
	declare count_answer int;
    declare count_answer_iscorect int;
	select count(question_id) into count_answer
    from answer
    where question_id = old.question_id;
    
    if count_answer >=4 then 
    signal sqlstate '12345'
	set message_text = "tối đa 4 câu hỏi cho mỗi question";
    end if;
    
    select count(question_id) into count_answer_iscorect
    from answer
    where question_id = old.question_id and iscorect = true;
    
	if count_answer_iscorect >=2 then 
    signal sqlstate '12345'
	set message_text = "tối đa 2 câu trả lời đúng cho mỗi question";
    end if;
    
    
end $$
delimiter ;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
drop trigger if exists trigger_as_9;

delimiter $$
create trigger trigger_as_9
before delete  on exam 
for each row
begin 
	if old.created_date >= current_date() - interval 2 day
    then signal sqlstate '12345'
        set message_text = "Không được phép xóa bài thi";
	end if;
end $$
delimiter ;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào

select question_id 
from  exam_question;
drop trigger if exists trigger_as_10_delete;
delimiter $$
create trigger trigger_as_10_delete
before delete  on question
for each row
begin 
	if old.question_id in (select question_id 
						from  exam_question) 
	then signal sqlstate '12345'
        set message_text = "Question đã nằm trong exam";
	end if;
                        
end %%
delimiter ;


select question_id 
from  exam_question;
drop trigger if exists trigger_as_10_update;
delimiter $$
create trigger trigger_as_10_update
before update on question
for each row
begin 
	if old.question_id in (select question_id 
						from  exam_question) 
	then signal sqlstate '12345'
        set message_text = "Question đã nằm trong exam";
	end if;
                        
end %%
delimiter ;


-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"


select *,
	case
    
		when duration <= 30 then 'Short time' 
		when duration <= 60  then 'Medium time' 
        else 'Long time'
    end as duration_type
from exam ;

    
-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher

with c1 as (select `group`.*, count(account_id) as SoLuongNhanVien
from `group`
left join group_account using (group_id)
group by group_id )

select *, 
	case 
		when SoLuongNhanVien <= 5 then 'few'
        when SoLuongNhanVien <= 20  then 'normal'
        else 'higher'
    end as the_number_user_amount
from c1;
	 
-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
with c1 as (select department.*, count(account_id) as countNV
from department
left join `account` using (department_id)
group by department_id)

select department_name, 
	case
		when countNV = 0 then "Không có User"
        else countNV
	end as SoLuongNhanVien
from c1;






















