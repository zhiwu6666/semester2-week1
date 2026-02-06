-- For each department, calculate the number of enrolments in its courses.
-- Expected Columns:
-- DepartmentName, TotalEnrolments

SELECT
	Department.DepartmentName,
	COUNT(Enrolment.EnrolmentId) AS TotalEnrolments
FROM Department
LEFT JOIN Course
	ON Course.DepartmentId = Department.DepartmentId
LEFT JOIN Enrolment
	ON Enrolment.CourseId = Course.CourseId
GROUP BY Department.DepartmentName;
