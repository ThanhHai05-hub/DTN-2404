-- store procedure: thủ tục lưu trữ
-- từ khóa: in , out , inout

-- vd : tạo thủ tục lấy ra phòng ban theo id 
-- Delimiter $$ từ nay kết thúc một truy vấn hoàn chỉnh là dấu $$ bởi vì trong khi tạo thủ tục sẽ có câu lệnh 
-- kết thúc bằng ; nhưng đó chưa thật sự là dấu chấm hết của một thủ tục trong mysql 

-- Delimiter $$ : tạm thời kết thúc câu lệnh bằng $$ 
-- vd: lấy ra phòng ban theo id được nhập vào từ người dùng
Delimiter $$
create procedure sp_01 (in department_id_input int)
begin 
	select *
	from department
	where department_id = department_id_input;
end $$
Delimiter ;

-- gọi thử tục 
call sp_01(1);
-- xóa thủ tục 
drop procedure sp_01;

-- FUNTION: hàm
-- trả về duy nhất một giá trị 
-- vd: 
DROP FUNCTION IF EXISTS fn_01;
delimiter $$
create function fn_01(v_department_id int ) returns varchar(50) 
DETERMINISTIC
begin 
	declare v_department_name varchar(50);
    
    select department_name into v_department_name
    from department
    where department_id = v_department_id;
    
    return v_department_name;
end $$

delimiter ;


-- sử dụng function 
select *
from department 
where department_name = fn_01(1);
-- xóa function 
drop function fn_01;
































