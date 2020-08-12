/*This query returns all students and their schedules along with teacher names for each course*/
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
sc.section_num as SectionNumber, 
course_num AS CourseNumber,
period_num AS PeriodNumber ,  
it.lastname as TeacherLastName,
it.firstname as TeacherFirstName, 
ctt.email as TeacherEmail 

FROM  prsn p
join [iden] i on i.identityID = p.currentidentityID
join enroll e on e.personID = p.personID
join calen cl on cl.calendarID = e.calendarID 
join school sl ON sl.schoolid = cl.schoolid 
join schoolyear sy on sy.endyear = e.endyear and sy.active =1
left join contact ct on ct.personID = p.personID
join view_schedules_k12 sc on sc.personID = e.personID and e.calendarID  = sc.calendarID
left join Rost r on r.personID = p.personID
left join Sec se on se.sectionID = r.sectionID
left join prd pd on pd.periodid = se.sectionid 
left join Crse c on c.courseID = se.courseID and c.calendarID = cl.calendarID
join prsn pt on pt.personID = sc.teacherPersonID
join [iden] it on it.identityID= pt.currentIdentityID
left join contact ctt on ctt.personID = pt.personID

WHERE
sy.active = 1 
and e.active = 1
--and e.serviceType = 'P'
and isnull(e.noshow, 0) = 0
and e.enddate is null
and sc.term_num = '1'

ORDER BY 
i.lastname, i.firstname, period_num 
