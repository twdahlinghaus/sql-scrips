Select c.Subject, c.Section, CONCAT(i.Lastname, ', ', i.Firstname) Name, i.YearsExperience, i.IsTenured from Class c
Join Instructor i on i.id = c.InstructorId
Where i.YearsExperience > 9
Order by i.Lastname, c.Subject;