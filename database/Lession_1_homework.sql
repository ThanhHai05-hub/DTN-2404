-- Assignment Day 01
create database if not exists Testing_system;
-- trỏ vào database testing_system 
use Testing_system;

create table if not exists Department(
	department_id int primary key auto_increment,
    department_name varchar(50) 
);

create table if not exists positions(
	position_id int primary key auto_increment,
    position_name varchar(50)
);
-- position_name đúng hơn là : enum("Dev", "Test", "Scrum Master", "PM")

create table if not exists accounts (
	account_id int primary key auto_increment,
    email varchar(50) ,
    user_name varchar(50),
	full_name varchar(50),
    department_id int ,
    position_id int ,
    create_at date,
    foreign key (department_id) references department(department_id),
    foreign key (position_id) references positions(position_id)
    
    -- on update cascade on delete cascade
    -- viết sau foreign key để khi xóa phòng ban thì nhân viên cũng bị xóa theo hoặc khi cập nhật phòng ban thì bên bảng nhân viên cũng được cập nhật theo
    -- cha làm gì thì con làm vậy 
    
    
);

create table if not exists groupss(
	group_id int primary key auto_increment,
    group_name varchar(50) , 
    create_id int ,
    create_date date, 
    foreign key (create_id) references accounts(account_id)
);
-- group là một từ khóa trong mysql nên muốn nó làm tên bảng thì viết nó trong một cặp nháy huyền `group`

create table if not exists group_account(
	group_id int primary key ,
    account_id int ,
    joint_date date,
    foreign key (account_id) references accounts(account_id)
);
-- đối với bảng này phải sử dụng group_id và account_id làm khóa chính 
-- ví dụ: 
-- group_id		account_id		joint_date
--  1				2				2024
-- 1				3				2023
--  1				1				2034 (vô lý) 
-- như vậy group_id không thể làm khóa chính trong trường hợp này. khóa chính phải là group_id và account_id
-- một nhân viên có thể tham gia nhiều nhóm và một nhóm có thể có nhiều nhân viên

create table if not exists type_question (
	type_id int primary key auto_increment,
    type_name enum("Essay", "Multiple-Choice")
);

create table if not exists category_question (
	category_id int primary key auto_increment,
    category_name varchar(50)
);

create table if not exists question (
	question_id int primary key auto_increment,
    content varchar(2000) ,
	category_id int ,
    type_id int ,
    creator_id int ,
    create_date date,
    foreign key (category_id) references category_question(category_id),
    foreign key (type_id) references type_question (type_id),
    foreign key (creator_id) references accounts(account_id)
    
    
);

create table if not exists answer(
	answer_id int primary key auto_increment,
    content varchar (2000),
    question_id int ,
    is_correct boolean,
    foreign key (question_id) references question(question_id)
);

create table if not exists exam(
	exam_id int primary key auto_increment,
    code_exam int unique,
    title varchar(50),
    category_id int,
    duration int,
    creator_id int,
    create_date date,
    foreign key (category_id) references category_question(category_id),
    foreign key (creator_id) references accounts(account_id)
);

create table if not exists  exam_question(
	exam_id int primary key ,
    question_id int ,
    foreign key (question_id) references question(question_id)
);

-- 1 bài thi có thể có nhiều câu hỏi nên phải sử dụng khóa chính là exam_id và question_id














