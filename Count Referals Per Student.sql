--This query counts the number of referals per student. 

SELECT DISTINCT 
s.studentnumber AS 'StudentNumber', 
s.lastname AS 'Lastname', 
s.firstname AS 'FirstName',
s.grade AS 'Student Grade',
COUNT(be.eventid) AS 'Number of Referals'
--be.resolutionid AS 'Resolution ID', 
--be.staterescode AS 'State Resolution Code', 
--be.resolutionname AS 'Resolution Name', 
--be.resolutionschooldaysduration AS 'Number of Days Suspended'

FROM s
JOIN be ON be.personid = s.personid 

--WHERE 
--be.calendarid = '694' /*MLK 18-19*/
--be.calendarid = '733' /*MLK 19-20*/
--be.calendarid = '709' /*Turner 18-19*/
--be.calendarid = '748' /*Turner 19-20*/
--and s.schoolid = '25'
--and s.endyear ='2020'
--and be.staterescode = '30' /*Suspensions Only*/

GROUP BY 
s.studentnumber, 
s.lastname, 
s.firstname,
s.grade 

ORDER BY s.grade, s.lastname 
