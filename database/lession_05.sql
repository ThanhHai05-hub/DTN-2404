-- subquery: truy vấn con 
-- vd: lấy ra tất cả nhân viên có chức vụ là  dev
-- cách bình thường
select `account`.*
from `account`
inner join position using (position_id)
where position_name = "Dev";
-- cách truy vấn con 
-- ý tưởng: lấy ra position_id có tên là dev trước sau đó truy vấn đến bảng account

select account.*
from account
where position_id = (
		select position_id
		from `position`
		where position_name = "Dev");
        
-- Toán tử: All : thoả mãn tất cả , Any: bất kỳ( thoả mãn 1)  , exists: tồn tại ( phải có dữ liệu) 
-- vd: lấy ra nhân viên có chức vụ khác dev 
select `account`.*
from `account`
where  position_id in  
					(select position_id
					from `position`
					where position_name != "dev");
        
        
-- view: bảng ảo, không chứa dữ liệu thật ( tương tự funtion trong code, lưu code thoi chứ không lưu dữ liệu)
-- vd: tạo view chứa tất cả phòng ban 

create or replace View  View_01 as 
					select *
                    from department;
                    
-- truy vấn dữ liệu từ view 
select *
from view_01;

-- CTE (common table expresstion) : Bảng tạm 
-- vd: lấy ra phòng ban có nhiều nhân viên nhất 
with c1 as (
			select department.*, count(account_id) as count_account
            from department
            left join `account` using (department_id)
            group by department_id)
select department_id , department_name 
from c1 
where count_account = (select max(count_account)
					from c1) ;

-- lấy ra câu hỏi có nhiều câu trả lời nhất
with c2 as (
select question.* , count(answer_id) as count_answer
from question
left join answer using (question_id)
group by question_id)

select *
from c2
where  count_answer = (select max(count_answer)
						from c2);
							
-- tìm chức vụ có ít người nhất 
with c3 as (
select position.*, count(account_id) as count_account
from position
left join account using (position_id)
group by position_id) 

select *
from c3
where count_account = (select min(count_account)
						from c3);
      
        
 -- thống kê slg nhân viên theo từng tháng       
 with recursive c1 (month) as (
					select 1 
                    union 
                    select month+1  from c1 where month< 12) , c2 as  
                    (select * , month(created_date) as month
					from `account`)
select month, count(account_id)
from c1 
left join c2 using (month)
group by month;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        