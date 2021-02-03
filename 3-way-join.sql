Select * from Major m
Join MajorClass mc on mc.MajorId = m.Id
Join Class c on c.Id = mc.ClassId
Join Instructor i on i.Id = c.InstructorId;