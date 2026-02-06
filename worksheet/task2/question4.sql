-- List all students along with the names of the courses they are enrolled in.
-- Expected Columns:
-- StudentId, FirstName, LastName, CourseName

SELECT
	Student.StudentId,
	Student.FirstName,
	Student.LastName,
	Course.CourseName
FROM Student
INNER JOIN Enrolment
	ON Enrolment.StudentId = Student.StudentId
INNER JOIN Course
	ON Course.CourseId = Enrolment.CourseId;
