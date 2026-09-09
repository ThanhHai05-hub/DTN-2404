use assignment_03;
-- mệnh đề select 
 SELECT pi(), 1+1, current_date(), now(), current_timestamp();
 
 -- MỆNH ĐỀ FROM
 select department_id,department_name
 from department;
 
 select department_name
 from department;
 -- * đại diện cho tất cả các cột
 select *
 from department;
 -- mệnh đề where: điều kiện cho từng bản ghi
 -- toán tử : > , >=, <, <=, =, !=
 -- vd: lấy ra phòng ban có id = 5
 select *
 from department
 where department_id =5;
 
 -- toán tử: AND, OR
 -- VD: lấy ra phòng ban có id >= 3 và <= 7
 select *
 from department
 where department_id >=3 and  department_id <=7;
 -- toán tử: between...and
 select *
 from department
 where department_id between 3 and 7;
 -- toán tử in
 -- lấy ra phòng ban có id là số chẵn từ 2 đến 8
 select *
 from department
 where department_id in (2,4,6,8);
 -- đảo ngược lại 
  select *
 from department
 where department_id not in (2,4,6,8);
 
 -- toán tử like 
 -- _ : đại diện cho  1 ký tự bất kỳ 
 -- % : đại diện cho 0 hoặc nhiều ký tự bất kỳ
 
 -- lấy ra phòng ban có tên chứa ký tự  'n'
 -- not like là đảo ngược của like
select *
from department
where department_name like "%n%";
 
 -- toán tử is null  và is not null 
 -- khi thao tác với null thì chỉ dùng is not null hoặc is null chứ không được = null hoặc != null
 -- vd lấy ra phòng ban có tên 
 select *
from department
where department_name is not null ;
 
 -- mệnh đề order by: sắp xếp
 -- hướng tăng dần: asc (Ascending) , giảm dần: desc (Descending) 
 -- mặc định là tăng dần
 -- vd lấy ra tất cả đề thi sắp xếp theo thứ tự giảm dần của thời gian thi
 -- có tiêu chí phụ 
 
 select *
 from exam
 order by duration desc, created_date desc;
 
 -- mệnh đề limit
 -- vd lấy ra 5 phòng ban, nằm sau order by 
 select *
 from department
 limit 5;
 
 
 -- các hàm tổng hợp: count , sum, min, max, avg
 -- count(*): đếm số dòng
 -- count(id) : đếm số dòng có id khác null 
 -- ví dụ đếm số lương bản ghi 
 select count(*)
 from department;
 
 select sum(duration), avg(duration)
 from exam;
 
 -- mệnh đề group by : nằm ở trước order by để gom nhóm
 -- vd nhóm thời gian thi với bài thi, mỗi thời gian thi cho biết có bao nhiêu bài thi tương ứng 
 select duration, count(exam_id)
 from exam
 group by duration;
 
 
 -- mệnh đề having: điều kiện cho từng nhóm 
 -- vd:  vd nhóm thời gian thi với bài thi, mỗi thời gian thi cho biết có bao nhiêu bài thi tương ứng và chỉ lấy nhóm có số lượng bài thi lớn hơn 3 
 select duration, count(exam_id)
 from exam
 group by duration
 having  count(exam_id) >3;
 
 
 -- alias : đặt tên bảng hoặc tên cột tạm thời 
 select count(*) as department_count
 from department;
 
 -- câu lệnh cập nhật 
 update department
 set department_name = "Phòng chờ"
 where department_id = 1;
 -- có thể cập nhật được nhiều cột cùng một lúc bằng , key = value
 
 -- xóa dữ liệu 
 delete  from department
 where department_id = 3;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 