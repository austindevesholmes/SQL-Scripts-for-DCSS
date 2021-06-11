--This script returns a count of students per grade for every school.

SELECT e.grade as Grade, COUNT(DISTINCT e.personID) as StudentCount, max(e.startdate) As LatestEntry, s.name as SchoolName 

FROM enrollment e 
join calendar cl ON cl.calendarID = e.calendarID
join schoolyear sy ON sy.endYear = cl.endyear
join school s on s.schoolID = cl.schoolID 

WHERE sy.active = 1 
and e.active = 1 
and isnull(e.noshow, 0) = 0 

GROUP BY e.grade, s.name 

ORDER BY s.name, e.grade 