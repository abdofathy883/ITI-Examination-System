create view V_Branch_Data 
as
select
    B.ID as BranchID, 
    B.Name as BranchName, 
    B.Location as BranchLocation, 
    T.ID as TrackID, 
    T.Name as TrackName, 
    D.ID as DepartmentID, 
    D.Name as DepartmentName
from 
    Branch B,
    Department D,
    Track_Intake TI,
    Track T
where
    D.Branch_ID = B.ID and TI.Track_ID = D.ID and  T.ID = TI.Track_ID;
Go

---
create view V_Manager_Data 
as 
select   
	M.ID as ManagerID, 
    M.FullName as ManagerName, 
    B.ID as BranchID, 
    B.Name as BranchName, 
    D.ID as DepartmentID, 
    D.Name as DepartmentName, 
    T.ID as TrackID, 
    T.Name as TrackName
from
    Manager M, Department D, Branch B, Track T, Track_Intake TI
where
    M.Dept_ID = D.ID and D.Branch_ID = B.ID and D.ID = TI.Track_ID
    and TI.Track_ID = T.ID;
Go
---

create view V_Instructor_Data 
as
select
    I.ID as InstructorID,
    I.FullName as InstructorName,
    B.ID as BranchID,
    B.Name as BranchName, 
    D.ID as DepartmentID,
    D.Name as DepartmentName,
    C.ID as CourseID,
    C.Name as CourseName,
    T.ID as TrackID,
    T.Name as TrackName
from
    Instructor I,
    Instructor_Course_Track ICT,
    Course C,
    Track T,
    Department D,
    Branch B
where 
    I.ID = ICT.Ins_ID and  ICT.Crs_ID = C.ID and  ICT.Track_ID = T.ID and
    T.Dept_ID = D.ID and D.Branch_ID = B.ID;
Go

---- 
create view V_Student_Data 
as 
select
    S.ID as StudentID,
    S.FullName as StudentName,
    C.ID as CourseID,
    C.Name as CourseName,
    C.Min_Degree as MinDegree,
    C.Max_Degree as MaxDegree,
    T.ID as TrackID,
    T.Name as TrackName,
    I.ID as IntakeID,
    I.Year as IntakeYear,
    I.Term as IntakeTerm,
    B.ID as BranchID,
    B.Name as BranchName
from
    Student S,
    Student_Course SC,
    Course C,
    Track T,
    Intake I,
    Department D,
    Branch B
where
    S.ID = SC.Std_ID and SC.Crs_ID = C.ID and S.Track_ID = T.ID and
    T.Intake_ID = I.ID and T.Dept_ID = D.ID and D.Branch_ID = B.ID;
Go
---

create view V_Exam_Data
 as
 select 
    E.ID as ExamID,
    E.Title as ExamTitle,
    C.ID as CourseID,
    C.Name as CourseName,
    I.ID as InstructorID,
    I.FullName as InstructorName,
    A.ID as AnswerID,
    A.Content as AnswerContent
from
    Exam E,
    Course C,
    Instructor_Course_Exam ICE,
    Instructor I,
    Answer A
where 
    E.Crs_ID = C.ID and ICE.Crs_ID = C.ID and ICE.Ins_ID = I.ID and A.Exam_ID = E.ID;
Go
---
create view V_Course_Instructor
as
select 
    C.ID as CourseID,
    C.Name as CourseName,
    I.ID as InstructorID,
    I.FullName as InstructorName
from
    Course C, Instructor I, Instructor_Course_Track ICT
where
    C.ID = ICT.Crs_ID and I.ID = ICT.Ins_ID;
Go

create view ShowExam
as
select E.ID, QP.Content, C.Choice_1, c.Choice_2, c.Choice_3, c.Choice_4
from Exam E join Exam_Question EQ
on E.ID = EQ.Exam_ID
join Question_Pool QP
on QP.ID = EQ.Q_ID
join Choice C
on C.ID = QP.Choice_ID
Go

select * from ShowExam