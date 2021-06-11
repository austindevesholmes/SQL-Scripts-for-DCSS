--This query counts the total number of failing grades per student. Filter by school, endyear, and terms. 

SELECT DISTINCT
s.studentnumber AS 'StudentNumber/Dataset ID', 
s.lastname AS 'LastName',
s.firstname AS 'FirstName',
s.middlename AS 'MiddleName',
s.grade As 'Student Grade Level',
COUNT(s.studentnumber) AS 'Total Number of Failing Grades'

FROM s WITH(NOEXPAND)
JOIN gc ON gc.personid = s.personid and gc.calendarID = s.calendarID
JOIN sec ON sec.sectionID = gc.sectionID
JOIN crs ON crs.courseID = sec.courseID
JOIN t ON t.termID = gc.termID
JOIN gt ON gt.taskID = gc.taskID
JOIN sl ON sl.schoolid = s.schoolid

WHERE
gc.score BETWEEN '0' and '69' AND gc.score <> '100'
----AND s.schoolid = '25'
----AND s.endyear = '2020'
----AND t.name IN ('x','x')

GROUP BY 
s.lastname,
s.firstname,
s.middlename,
s.studentnumber, 
s.grade

ORDER BY
s.grade,s.lastname, s.firstname
