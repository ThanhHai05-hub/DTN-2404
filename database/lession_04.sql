-- MỆNH ĐỀ JOIN

-- INNER JOIN : lấy cái chung của 2 thằng
-- on là điều kiện kết hợp

-- VD: LẤY RA TẤT CẢ NHÂN VIÊN VÀ THÔNG TIN PHÒNG BAN
-- on account.department_id  = department.department_id = using(department_id)
-- using là viết tắt của on nếu tên cột trùng nhau và điều kiện là dấu bằng
SELECT *
FROM account
INNER JOIN department using(department_id)
inner join position using(position_id);

-- LEFT/ RIGHT JOIN
-- vd : thống kê số lượng nhân viên trong mỗi phòng ban, phòng ban nào không có người cũng đếm luôn
-- lưu ý : count * là sai luôn vì count * đếm bản ghi sau khi đã join
select department.*, count(account_id) as SoLuongNhanVien
from account 
right join department using(department_id)
group by department_id ;


-- LEFT / RIGHT EXCLUDING JOIN
-- Chỉ lấy phần riêng của bên tay trái hoặc phải
-- vd: lấy ra phòng ban không có nhân viên 
select department.*
from department
left join `account` using (department_id)
where account_id is null ;


-- CROSS JOIN: bắt tay
-- kết hợp 
select *
from account
cross join position;


-- union: hợp hai tập kết quả
-- tìm kiếm account hoặc group chứa ký tự 'n'
select "account" as type , full_name as result
from `account` 
where full_name like "%n%"
union 
select "group" as type  , group_name as result
from `group` 
where group_name like "%n%";
 

-- union all 
-- có bao nhiêu kết qủa in ra hết, không quan trọng trùng nhau hay không 
select 1 as n
union all 
select 1 as n ;














