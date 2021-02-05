select * from student;

INSERT Student
(Firstname, Lastname, SAT, GPA, MajorId)
VALUES
('Kaela', 'Dhaus', 5000, 4.5, (Select Id From Major Where Description = 'Engineering'));

Update student Set
Firstname = 'Thomas', SAT = 555, GPA = 2.2 Where id = 196;

delete from student
 Where GPA = 2.20
 AND firstname = 'Greg'
 AND lastname = 'Doud';