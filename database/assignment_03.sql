 /* Question 1: Thêm ít nhất 10 record vào mỗi table
Question 2: lấy ra tất cả các phòng ban
Question 3: lấy ra id của phòng ban "Sale"
Question 4: lấy ra thông tin account có full name dài nhất
Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
Question 7: Lấy ra ID của question có >= 4 câu trả lời
Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày
20/12/2019
Question 9: Lấy ra 5 group được tạo gần đây nhất
Question 10: Đếm số nhân viên thuộc department có id = 2
Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
email thành loc.nguyenba@vti.com.vn
Question 15: update account có id = 5 sẽ thuộc group có id = 4 */
-- làm câu 2,3,4,5,6,8,9,11
-- ques 2:
select *
from department ;
-- ques 3:
select department_id
from department
where department_name = "Sale";

select * 
from account;
-- ques 4 lấy ra thông tin account có full name dài nhất
select *
from account
order by char_length(full_name) desc
limit 1;
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
select *
from account
where  department_id = 3  
order by char_length(full_name) desc
limit 1;
-- ques 6
select group_name
from `group`
where created_date  <'2019-12-20';

-- ques 8 Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
select code
from exam
where duration >= 60 and created_date < '2019-12-20';
-- ques 9 Lấy ra 5 group được tạo gần đây nhất
select * 
from `group`
order by created_date desc 
limit 5;
-- ques 11 Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
-- hàm substring_index : đối số 1: là chuỗi cần cắt, đối số 2 là ký tự bắt đầu cắt,
-- đối số thứ 3 là chữ số để cắt từ phải sang trái hay trái sang phải
 
select *
from account
where substring_index(full_name," ", -1 ) like "D%o";
-- ques 7 Lấy ra ID của question có >= 4 câu trả lời
select question_id
from answer
group by question_id
having count(question_id) >=4;


-- ques 10  Đếm số nhân viên thuộc department có id = 2
-- cách 1
select count(department_id) as SoNhanVien
from account
group by department_id 
having department_id =2;

-- cách 2
select count(*) as SoLuongNV
from account
where department_id = 2;

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

delete from exam 
where created_date < "2019-12-20";

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
delete from question
where content like "Câu hỏi%";

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn
update account
set full_name = "Nguyễn Bá Lộc", email = "loc.nguyenba@vti.com.vn"
where id = 5;


-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
update group_account
set group_id =4
where account_id = 5;





