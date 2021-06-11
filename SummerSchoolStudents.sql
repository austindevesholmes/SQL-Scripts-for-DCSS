--This query brings back all students attending summer school this semester with a start date of 06-02-2021.
SELECT  * 

FROM view_schedules_k12 sv
JOIN student s on s.calendarid = sv.calendarid 
AND s.personid = sv.personid  

WHERE [start_date] = '2021-06-02'

ORDER BY 
calendarname  