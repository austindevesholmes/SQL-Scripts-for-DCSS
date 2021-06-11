--This query counts the number of withdrawal codes by school for each calendar year.  

SELECT COUNT(DISTINCT e.personID) as withdrawnstudents, s.name as schoolname, e.endyear 

FROM e 
JOIN c on e.calendarID = c.calendarID 
JOIN s on s.schoolID = c.SchoolID 
JOIN sy on sy.endyear = c.endyear 
--join campusdictionary cd on cd.code = e.endstatus
--join campusattribute ca on ca.attributeID = cd.attributeID

WHERE 
 e.endstatus = 'W'
--and sy.active = 1
--and ca.object = 'Enrollment'
--and ca.element = 'endStatus'
 --and e.endyear in ('2019', '2018', '2017','2020')

GROUP BY  s.name, e.endyear

ORDER BY  e.endyear, s.name

