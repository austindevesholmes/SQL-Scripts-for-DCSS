--This query returns an incident report for students. Filter by calendarid, school, endyear, or grade.  

SELECT DISTINCT 
s.studentnumber AS 'StudentNumber', 
s.lastname AS 'Lastname', 
s.firstname AS 'FirstName',
s.grade AS 'Student Grade',  
be.eventid AS 'EventID', 
be.resolutionid AS 'Resolution ID', 
be.staterescode AS 'State Resolution Code', 
be.resolutionname AS 'Resolution Name', 
be.resolutionschooldaysduration AS 'Number of Days Suspended'

FROM student s
JOIN v_behaviordetail be ON be.personid = s.personid 

--WHERE 
--be.calendarid = '694' /*MLK 18-19*/
--be.calendarid = '733' /*MLK 19-20*/
--be.calendarid = '709' /*Turner 18-19*/
--be.calendarid = '748' /*Turner 19-20*/
--and s.schoolid = '25'
--and s.endyear ='2020'
--and s.grade = '05'

ORDER BY s.grade, s.lastname 




