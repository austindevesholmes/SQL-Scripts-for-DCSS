SELECT *
FROM PublicHousing 

JOIN GuardianHousing ON PublicHousing.StudentID = GuardianHousing.StudentID

WHERE (contacts_addressLine1 LIKE ('%Tift%') 
OR contacts_addressLine1 LIKE ('%Stadium%')
OR contacts_addressLine1 LIKE ('%Davis%')
OR contacts_addressLine1 LIKE ('%Society%')
OR contacts_addressLine1 LIKE ('%Residence%')
OR contacts_addressLine1 LIKE ('%Madison%')
OR contacts_addressLine1 LIKE ('%Cherry%')
OR contacts_addressLine1 LIKE ('%Cleveland%')
OR contacts_addressLine1 LIKE ('%Corn%')
OR contacts_addressLine1 LIKE ('%Harding%')
OR contacts_addressLine1 LIKE ('%Holloway%')
OR contacts_addressLine1 LIKE ('%Whitney%')
OR contacts_addressLine1 LIKE ('%Van Buren%')
OR contacts_addressLine1 LIKE ('%McKinley%')
OR contacts_addressLine1 LIKE ('%Lincoln%')
OR contacts_addressLine1 LIKE ('%Gordon%')
OR contacts_addressLine1 LIKE ('%Newton%')
OR contacts_addressLine1 LIKE ('%Tulsa%')
OR contacts_addressLine1 LIKE ('%Jefferies%')
OR contacts_addressLine1 LIKE ('%Gadsen%')
OR contacts_addressLine1 LIKE ('%Flint%')
OR contacts_addressLine1 LIKE ('%Whittlesey%')
OR contacts_addressLine1 LIKE ('%Wetherbee%')
OR contacts_addressLine1 LIKE ('%Seay%')
OR contacts_addressLine1 LIKE ('%Arbor%')
OR contacts_addressLine1 LIKE ('%Clark%')
OR contacts_addressLine1 LIKE ('%Sycamore%')
OR contacts_addressLine1 LIKE ('%Thistle%')
OR contacts_addressLine1 LIKE ('%Turner%')
OR contacts_addressLine1 LIKE ('%Colquitt%')
OR contacts_addressLine1 LIKE ('%Mercedes%')
OR contacts_addressLine1 LIKE ('%Crawford%')
OR contacts_addressLine1 LIKE ('%Cameo%')
OR contacts_addressLine1 LIKE ('%Vintage%')
OR contacts_addressLine1 LIKE ('%Thornwood%')
OR contacts_addressLine1 LIKE ('%Westover%')
OR contacts_addressLine1 LIKE ('%Chippington%')
OR contacts_addressLine1 LIKE ('%Kingbury%')
OR contacts_addressLine1 LIKE ('%Mercer%')
OR contacts_addressLine1 LIKE ('%Georgetown%')
OR contacts_addressLine1 LIKE ('%Landings%')
OR contacts_addressLine1 LIKE ('%Jackson%')
OR contacts_addressLine1 LIKE ('%Habersham%')
OR contacts_addressLine1 LIKE ('%Monroe%')
OR contacts_addressLine1 LIKE ('%4th%')
OR contacts_addressLine1 LIKE ('%Fourth%'))

AND GuardianHousing.Relation != 'Sibling' 
AND GuardianHousing.Relation != 'Self'


ORDER BY student_lastname
