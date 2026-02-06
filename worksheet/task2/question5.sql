-- For each student, calculate the total number of credits from courses they passed. Assume a passing grade is 40 or higher.
-- Expected Columns:
-- StudentId, FirstName, LastName, TotalCreditsPassed

SELECT
	s.StudentId,
	s.FirstName,
	s.LastName,
	SUM(c.Credits) AS TotalCreditsPassed
FROM Student AS s
JOIN (
	SELECT
		e.StudentId,
		e.CourseId
	FROM Enrolment AS e
	GROUP BY
		e.StudentId,
		e.CourseId
	HAVING MAX(e.Grade) >= 40
) AS passed
	ON passed.StudentId = s.StudentId
JOIN Course AS c
	ON c.CourseId = passed.CourseId
GROUP BY
	s.StudentId,
	s.FirstName,
	s.LastName;
