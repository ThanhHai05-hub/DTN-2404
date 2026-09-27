use assignment_04;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
select *
from `account` 
inner join department using(department_id);
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select *
from `account`
where created_date > "2010-12-20";
-- Question 3: Viết lệnh để lấy ra tất cả các developer
select *
from `account`
inner join position on account.position_id = position.position_id
where position_name = "Dev";
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

select department.*
from `account` 
right join department using (department_id)
group by department_id
having count(account_id) > 3;



-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select question.*
from question 
left join exam_question using (question_id)
group by question_id
order by  count(exam_id) desc
limit 1;



-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
select category_question.*, count(question_id) as SoLuongCauHoi
from category_question 
left join question using (category_id)
group by category_id;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select question.*, count(exam_id) as SoLuongExam
from question 
left join exam_question using(question_id)
group by question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
select question.*
from question 
left join answer using (question_id)
group by question_id
order by count(answer_id) desc
limit 1;
-- Question 9: Thống kê số lượng account trong mỗi group
select `group`.* , count(account_id) as SoLuongNhanVien
from `group`
left join group_account using(group_id)
group by group_id;
-- Question 10: Tìm chức vụ có ít người nhất
select `position`.* 
from `position`
left join account using(position_id)
group by position_id
order by count(account_id) asc
limit 1;
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
select department_name , position_name, count(account_id)
from department
cross join `position` 
left join account using (department_id , position_id)
group by department_id, position_id;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
select *
from question 
inner join type_question using(type_id) 
inner join account on question.creator_id = account.account_id
inner join answer using(question_id);
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select type_question.*, count(question_id) as SoLuongCauHoi
from type_question
left join question using(type_id)
group by  type_id;
-- Question 15: Lấy ra group không có account nào
select `group`.*
from `group` 
left join group_account  using(group_id)
where account_id is null ;


-- Question 16: Lấy ra question không có answer nào.
select question.*
from question
left join answer using(question_id)
where answer_id is null;

-- 2. Union.
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
select `account`.* 
from `account`
inner join group_account using(account_id)
where  group_id = 1;
-- b) Lấy các account thuộc nhóm thứ 2
select `account`.* 
from `account`
inner join group_account using(account_id)
where  group_id = 2;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
select `account`.* 
from `account`
inner join group_account using(account_id)
where  group_id = 1
union 
select `account`.* 
from `account`
inner join group_account using(account_id)
where  group_id = 2;

-- Question 18:
-- a) Lấy các group có lớn hơn 1 thành viên
select `group`.*
from `group`
left join group_account using(group_id)
group by group_id
having count(account_id) >1;
-- b) Lấy các group có nhỏ hơn 3 thành viên
select `group`.*
from `group`
left join group_account using(group_id)
group by group_id
having count(account_id) <3;
-- c) Ghép 2 kết quả từ câu a) và câu b).
select `group`.*
from `group`
left join group_account using(group_id)
group by group_id
having count(account_id) >1
union all 
select `group`.*
from `group`
left join group_account using(group_id)
group by group_id
having count(account_id) <3;
















