Create database Academic_Management_System;
use  Academic_Management_System;

create table StudentInfo (STU_ID int primary key
, STU_NAME varchar (100) Not NUll
, DOB Date
, PHONE_NO Varchar (10)
, EMAIL_ID Varchar (100)
,ADDRESS Varchar (100)
);
Insert into StudentInfo values (1,'Anirban','1997-10-24','9804032545','anirban@','CCU'),(2,'Aditya','1998-11-24','9804032525','Aditya@','BLR'),(3,'Soumya','2000-10-24','8804032545','Soumya@','DEL');

Create table CoursesInfo ( COURSE_ID int Primary key
, COURSE_NAME varchar(20) Not Null
,COURSE_INSTRUCTOR_NAME Varchar (100) Not NUll
);
Insert into CoursesInfo values (1,'Commerce','Soumili'),(2,'Science','Neha'),(3,'Arts','Padma');

Create table EnrollmentInfo ( ENROLLMENT_ID int primary key
,STU_ID int
,COURSE_ID int
,ENROLL_STATUS Enum('Enrolled','Not Enrolled') Not Null
,Foreign key (STU_ID) references StudentInfo(STU_ID)
,Foreign key (COURSE_ID) references CoursesInfo(COURSE_ID)
);
Insert into EnrollmentInfo values (1,1,2,'Enrolled'),(2,2,3,'Enrolled'),(3,3,1,'Not Enrolled');

-- Retrieve the Student Information
-- Task a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.
Select * from StudentInfo s
left join EnrollmentInfo e 
on s.STU_ID = e.STU_ID
;
-- Task b) Write a query to retrieve a list of courses in which a specific student is enrolled.
Select s.*, c.COURSE_NAME,e.ENROLL_STATUS from StudentInfo s
left join EnrollmentInfo e 
on s.STU_ID = e.STU_ID
left join CoursesInfo c 
on e.COURSE_ID = c.COURSE_ID
where s.STU_ID = 2 
and 
e.ENROLL_STATUS = 'Enrolled'
;

-- Task c) Write a query to retrieve course information, including course name, instructor information. 
Select c.*, e.* from CoursesInfo c
left join EnrollmentInfo e
on C.COURSE_ID = e.COURSE_ID;

-- Task d) Write a query to retrieve course information for a specific course .
Select c.*, e.* from CoursesInfo c
left join EnrollmentInfo e
on C.COURSE_ID = e.COURSE_ID
where COURSE_NAME = 'Science';

-- Task e) Write a query to retrieve course information for multiple courses. 
Select c.*, e.* from CoursesInfo c
left join EnrollmentInfo e
on C.COURSE_ID = e.COURSE_ID;

-- 4. Reporting and Analytics (Using joining queries) 
-- a) Write a query to retrieve the number of students enrolled in each course 
Select count(e.STU_ID) as Number_of_Student, c.* from CoursesInfo c
left join EnrollmentInfo e
on C.COURSE_ID = e.COURSE_ID
Group by C.COURSE_ID
;
-- b) Write a query to retrieve the list of students enrolled in a specific course
select count(s.STU_ID),e.* from StudentInfo s
left join EnrollmentInfo e 
on s.STU_ID = e.STU_ID
Group by s.STU_ID
;