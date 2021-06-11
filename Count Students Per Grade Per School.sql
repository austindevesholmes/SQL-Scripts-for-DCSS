--This script returns a count of students per grade for every school.

SELECT e.grade as Grade, COUNT(DISTINCT e.personID) as StudentCount, max(e.startdate) As LatestEntry, s.name as SchoolName 

FROM e 
JOIN cl ON cl.calendarID = e.calendarID
JOIN sy ON sy.endYear = cl.endyear
JOIN s on s.schoolID = cl.schoolID 

WHERE sy.active = 1 
AND e.active = 1 
AND isnull(e.noshow, 0) = 0 

GROUP BY e.grade, s.name 

ORDER BY s.name, e.grade 
