-- For each student, calculate the total number of credits from courses they passed. Assume a passing grade is 40 or higher.
-- Expected Columns:
-- StudentId, FirstName, LastName, TotalCreditsPassed

SELECT
	Student.StudentId,
	Student.FirstName,
	Student.LastName,
	COALESCE(
		SUM(
			CASE
				WHEN Enrolment.Grade >= 40 THEN Course.Credits
				ELSE 0
			END
		),
		0
	) AS TotalCreditsPassed
FROM Student
LEFT JOIN Enrolment
	ON Enrolment.StudentId = Student.StudentId
LEFT JOIN Course
	ON Course.CourseId = Enrolment.CourseId
GROUP BY
	Student.StudentId,
	Student.FirstName,
	Student.LastName;
