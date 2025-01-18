use master
create database Examination_system

ON
Primary
(
	NAME = Examination_system_Primary,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PrimaryFile.mdf',
    SIZE = 2MB,
    MAXSIZE = 50,
    FILEGROWTH = 5
),
FileGroup SecondaryFG
(
	
	NAME = Examination_system_SecondaryFG,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SecondFile.ndf',
    SIZE = 2MB,
    MAXSIZE = 50,
    FILEGROWTH = 5
)
LOG ON
(NAME = Examination_system_Log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Exam_Log.ldf',
    SIZE = 5 MB,
    MAXSIZE = 50 MB,
    FILEGROWTH = 5 MB);
GO

--------------------Create Data Types--------------------
create type phone from char(11) not null
create type email from varchar(50) not null 
create type StudentsID as table 
(
	Student_ID int
)
Go

--------------------Create Tables --------------------
create table Student
(
	ID int identity (200,1),
	FullName nvarchar(20) not null,
	Email email,
	Phone phone,
	Track_ID int,
	constraint PK_Student primary key (ID),
	constraint CHK_EmailFormat check (Email like '_%@_%._%'),
	constraint CHK_Phone_No_Digits check (Phone like '[0][0125][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)--on SecondaryFG

create table Course
(
	ID int identity (300,1),
	[Name] nvarchar(20) not null,
	[Description] nvarchar(max),
	Min_Degree tinyint check (Min_Degree > 0),
	Max_Degree tinyint check (Max_Degree > 0),
	constraint PK_Course primary key (ID)
) --on SecondaryFG

create table Student_Course
(
	Std_ID int ,
	Crs_ID int ,
	constraint PK_Student_Course primary key (Std_ID,Crs_ID)
) --on SecondaryFG

create table Track
( 
	ID int ,
	Name nvarchar(20) not null,
	Dept_ID int ,
	Intake_ID int,
	constraint PK_Track primary key (ID)

) --on SecondaryFG

create table Instructor_Student_Exam
(
	Exam_Date date,
	Start_Time time,
	Ins_ID int ,
	Std_ID int ,
	Exam_ID int ,
	constraint PK_Instructor_Student_Exam primary key (Ins_ID , Std_ID , Exam_ID)
	
) on SecondaryFG

create table Manager
(
	ID int identity(1,1),
	FullName nvarchar(20) ,
	Email email,
	Phone phone,
	Salary money ,
	Dept_ID int ,
	constraint PK_Manager primary key (ID),
	constraint CHK_Email_Format check (Email like '_%@_%._%'),
	constraint CHK_Phone_Num_Digits check (Phone like '[0][0125][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

create table Instructor
(
	ID int identity(100,1),
	Mgr_ID int not null,
	FullName nvarchar(20) ,
	Phone nvarchar(20),
	Email nvarchar(30),
	Salary decimal,
	constraint PK_Instructor primary key (ID),
	constraint CHK_Email_ check (Email like '_%@_%._%'),
	constraint CHK_Phone_Digits check (Phone like '[0][0125][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

create table Instructor_Course_Track
(
	Ins_ID int ,
	Crs_ID int ,
	Track_ID int ,
	constraint PK_Instructor_Course_Track primary key (Ins_ID , Crs_ID , Track_ID)
)

create table Instructor_Course_Exam
(
	Ins_ID int ,
	Crs_ID int ,
	Exam_ID int ,
	[Year] date check ([Year] > '1970-01-01'),
	constraint PK_Instructor_Course_Exam primary key (Ins_ID , Crs_ID , Exam_ID)
)

create table Branch
(
    ID int , 
	Name nvarchar(20),
	[Location] nvarchar(30),
	constraint PK_Branch primary key (ID)
)

create table Department
(
	ID int ,
	[Name] nvarchar(20),
	Branch_ID int ,
	constraint PK_Department primary key (ID)
)

create table Intake
(
	ID int ,
	[Year] int ,
	Term nvarchar(20) ,
	constraint PK_Intake primary key (ID)
)

create table Track_Intake 
(	
	Track_ID int ,
	Intake_ID int ,
	constraint Pk_Track_Intake primary key (Track_ID, Intake_ID)
)

create table Exam
(
	ID int ,
	Title nvarchar(30) ,
	Type nvarchar(20) ,
	Total_Time tinyint,
	Total_Degree tinyint  ,
	Crs_ID int ,
	constraint PK_Exam primary key (ID)
)

create table Question_Pool
(
	ID int ,
	Type nvarchar(30),
	Content nvarchar(100) ,
	Model_Answer nvarchar(50) ,
	Degree tinyint,
	Choice_ID int not null,
	constraint PK_Question_Pool primary key (ID)
)

create table Exam_Question
(
	Exam_ID int ,
	Q_ID int ,
	constraint Pk_Exam_Q primary key (Exam_ID, Q_ID)
)

create table Student_Exam_Answer
(
	Std_ID int ,
	Exam_ID int ,
	Ans_ID int ,
	Score tinyint ,
	constraint Pk_Std_Exam_Ans primary key (Exam_ID, Std_ID)
)

create table Answer
(
	ID int ,
	Exam_ID int,
	Content nvarchar(max),
	constraint PK_Answer primary key (ID)
)


create table Choice
(
	ID int ,
	Choice_1 nvarchar(20),
	Choice_2 nvarchar(20),
	Choice_3 nvarchar(20),
	Choice_4 nvarchar(20),
	constraint PK_Choice primary key (ID)
)
Go






--*********************************************************************

--------------------Foreign Key Constraints --------------------

alter table Student
add constraint Fk_Track_ID foreign key (Track_ID) references Track (ID);

alter table Student_Course
add constraint Fk_Std_ID foreign key (Std_ID) references Student (ID);

alter table Student_Course
add constraint Fk_Crs_ID foreign key (Crs_ID) references Course (ID);

alter table Track
add constraint Fk_Dept_ID foreign key (Dept_ID) references Department (ID);

alter table Track
add constraint Fk_Intake_ID foreign key (Intake_ID) references Intake (ID);

alter table Instructor_Student_Exam
add constraint Fk_Ins_Std_Ins_ID foreign key (Ins_ID) references Instructor (ID);

alter table Instructor_Student_Exam
add constraint Fk_Ins_Std_Std_ID foreign key (Std_ID) references Student (ID);

alter table Instructor_Student_Exam
add constraint Fk_Exam_ICE_ID foreign key (Exam_ID) references Exam (ID);

alter table Manager
add constraint Fk_Deptm_ID foreign key (Dept_ID) references Department (ID);

alter table Instructor
add constraint FK_Ins_Mgr foreign key (Mgr_ID) references Manager (ID);

alter table Instructor_Course_Track
add constraint Fk_Instructor_ID foreign key (Ins_ID) references Instructor (ID);

alter table Instructor_Course_Track
add constraint Fk_Course_ID foreign key (Crs_ID) references Course (ID);

alter table Instructor_Course_Track
add constraint Fk_Track_ICT_ID foreign key (Track_ID) references Track (ID);

alter table Instructor_Course_Exam
add constraint Fk_Ins_ICE_ID foreign key (Ins_ID) references Instructor (ID);

alter table Instructor_Course_Exam
add constraint Fk_Crs_ICE_ID foreign key (Crs_ID) references Course (ID);

alter table Instructor_Course_Exam
add constraint Fk_Exam_IC_ID foreign key (Exam_ID) references Exam (ID);

alter table Department
add constraint FK_Branch_ID foreign key (Branch_ID) references Branch (ID);

alter table Track_Intake
add constraint FK_Intake_TI_ID foreign key (Intake_ID) references Intake (ID);

alter table Track_Intake
add constraint FK_Track_TI_ID foreign key (Track_ID) references Track (ID);

alter table Exam
add constraint FK_Crs_E_ID foreign key (Crs_ID) references Course (ID);

alter table Question_Pool
add constraint FK_Choice_ID foreign key (Choice_ID) references Choice (ID);

alter table Exam_Question
add constraint FK_Exam_EQ_ID foreign key (Exam_ID) references Exam (ID);

alter table Exam_Question
add constraint FK_Q_ID foreign key (Q_ID) references Question_Pool (ID);

alter table Student_Exam_Answer
add constraint FK_Std_SEA_ID foreign key (Std_ID) references Student (ID);

alter table Student_Exam_Answer
add constraint FK_Exam_SEA_ID foreign key (Exam_ID) references Exam (ID);

alter table Student_Exam_Answer
add constraint FK_Ans_SEA_ID foreign key (Ans_ID) references Answer (ID);

alter table Answer
add constraint FK_Exam_ANS_ID foreign key (Exam_ID) references Exam (ID);
