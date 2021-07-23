/*This script returns all students and their schedules along with teacher names for each course*/

SELECT DISTINCT 

cl.name AS CalendarName,
i.lastname AS StudentLastName,
i.firstname AS StudentFirstName,
i.middlename AS MiddleName,
ct.email AS StudentEmail,
e.grade AS StudentGrade, 
sl.name AS SchoolName, 
sl.schoolid AS SchoolID,  
course_name AS CourseName,
sc.section_num AS SectionNumber, 
course_num AS CourseNumber,
period_num AS PeriodNumber ,  
it.lastname AS TeacherLastName,
it.firstname AS TeacherFirstName, 
ctt.email AS TeacherEmail 

FROM p
JOIN i ON i.identityID = p.currentidentityID
JOIN e ON e.personID = p.personID
JOIN cl ON cl.calendarID = e.calendarID 
JOIN sl ON sl.schoolid = cl.schoolid 
JOIN sy ON sy.endyear = e.endyear AND sy.active =1
LEFT JOIN ct ON ct.personID = p.personID
JOIN view_k12 sc ON sc.personID = e.personID AND e.calendarID  = sc.calendarID
LEFT JOIN r ON r.personID = p.personID
LEFT JOIN se ON se.sectionID = r.sectionID
LEFT JOIN pd ON pd.periodid = se.sectionid 
LEFT JOIN c ON c.courseID = se.courseID AND c.calendarID = cl.calendarID
JOIN pt ON pt.personID = sc.teacherPersonID
JOIN it ON it.identityID= pt.currentIdentityID
LEFT JOIN cont ctt ON ctt.personID = pt.personID

WHERE
sy.active = 1 
AND e.active = 1
AND e.serviceType = 'P'
AND isnull(e.noshow, 0) = 0
AND e.enddate is null
AND sc.term_num = '1'

ORDER BY 
i.lastname, i.firstname, period_num 
