select m.Description, avg(gpa) 'Ave GPA' from student s
join major m on m.Id = s.MajorId
group by m.Description
having avg(gpa) >= 3;