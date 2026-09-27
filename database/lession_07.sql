-- local variable: biến cục bộ 
-- phạm vi: trong khối begin-end 
-- từ khóa declare 
-- vd: declare v_count int 


-- SESSION VARIABLE: biến session 
-- phạm vi trong một session( phiên làm việc)
-- từ khóa: set 
-- vd: tạo biến session có giá trị khởi tạo = 18 
set @age = 18;
select @age;
-- vd sử dụng biến session 
drop procedure if exists sp_1;
Delimiter $$
create procedure sp_1(in v_department_id int , out v_department_name varchar(50))
begin 
	select department_name into v_department_name
    from department
    where department_id = v_department_id;
end $$
Delimiter ;

set @department_name_session = "";
call sp_1(1, @department_name_session);
select @department_name_session;

-- GLOBAL VARIABLE: biến toàn cục, chỉ thay đổi giá trị của biến hệ thống có sẵn chứ không tạo ra được 
-- phạm vi : toàn bộ mysql 
-- từ khóa : set global 
-- vd; thay đổi connect_timeout thành 3s
show variables;

set global connect_timeout = 3;


-- trigger 
-- được chạy tự động trước khi thực hiện công việc liên quan
-- thời điểm : before, after
-- trước hoặc sau câu lệnh insert, delete, update
-- tham chiếu: new ( dữ liệu mới ) , old ( dữ liệu cũ đã có trong database ) 
-- new và old là tham chiếu, giá trị của nó dựa vào bảng mà mình đang tham chiếu

-- vd: tạo trigger xử lý join_date bảng group_account
DROP TRIGGER IF EXISTS trigger_01;

DELIMITER $$

CREATE TRIGGER trigger_01
BEFORE INSERT ON group_account
FOR EACH ROW
-- FOR EACH ROW chính là cơ chế để trigger xử lý từng dòng.
-- new là giá trị mới đang được thêm vào 
BEGIN
    IF NEW.joined_date > current_date() THEN
        SET NEW.joined_date = CURRENT_DATE();
    END IF;
END $$

DELIMITER ;

insert into group_account (group_id, account_id, joined_date)
					values (7 , 2, "2030-09-27");

















