-- This query returns students' courses and grades. Filter by school, grade, endyear, or grades.  

SELECT DISTINCT
s.studentnumber AS 'StudentNumber / Dataset ID',
s.lastname AS 'LastName',
s.firstname AS 'FirstName',
s.middlename AS 'MiddleName',
sl.name AS 'SchoolName',
s.grade AS 'StudentGrade',
crs.number AS 'CourseNumber',
crs.name AS 'CourseName' ,
t.name as 'Term',
gt.name as 'Grading Task',
gc.score as 'Score'

FROM student s WITH(NOEXPAND)
JOIN gradingscore gc ON gc.personid = s.personid and gc.calendarID = s.calendarID
JOIN section sec ON sec.sectionID = gc.sectionID
JOIN course crs ON crs.courseID = sec.courseID
JOIN term t ON t.termID = gc.termID
JOIN gradingTask gt ON gt.taskID = gc.taskID
JOIN school sl ON sl.schoolid = s.schoolid
	
WHERE
s.schoolid = '25'
AND s.endyear = '2019'
--AND s.grade = '05'
AND gc.score <> 'NULL'
--and gc.score <> 'NA' 

ORDER BY
t.name, s.lastname, s.firstname,  gt.name