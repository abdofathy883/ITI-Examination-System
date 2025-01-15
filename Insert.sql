use Examination_system

insert into Intake
(ID,Year,term)
values(1,2023,'Intake45'),
(2,2022,'Intake44'),
(3,2021,'Intake43'),
(4,2019,'Intake31')

insert into Branch
(Id,Name,Location)
values(1,'ITI Mini','Mini university'),
(2,'ITI Mansoura','Mansora university'),
(3,'Smart Valige ITI','Mansora university'),
(4,'ITI Qena','south valley university')

insert into Department
(Id,name,Branch_ID)
values(1,'Software Development',2),
(2,'computer network',1),
(3,'electronics',3),
(4,'mobile development',4)

insert into Track
(Id,Name,Dept_Id,Intake_Id)
values(1,'Full Stack .net',1,1),
(2,'Full stack python',1,2),
(3,'Full stack mern',1,3),
(4,'Android development',4,1)

insert into Track_Intake
(Track_ID,Intake_ID)
values(1,2),
(2,2),
(3,3),
(4,1)

insert into Instructor
(FullName, Mgr_ID, Phone,Email,Salary)
values('Mohammed hassan', 6, '01025698434','mohAhmed@gmail.com',5000),
('mona ali', 6, '01025698434','mona@gamil.com',6000),
('aymen mhros', 7, '01025698434','aymen@gmail.com',7000),
('krestin', 7, '01025698434','krestin@gmail.com',4000),
('ali tarek', 8, '01025698434','aliTarek@gmail.com',1000),
('mahmoud ali', 8, '01025698434','ahmoud22@gmail.com',9000),
('ali samir', 9, '01025698434','samir9@gmail.com',6000),
('alla ibrahim', 9, '01025698434','allaa01@gmail.com',10000)


insert into Manager
(FullName,Email,Salary,Phone,Dept_ID)
values('aymen mhros ','aymen@gmail.com',7000,'01025698434',2),--manger computer network
('krestin','krestin@gmail.com',4000,'01125698437',1), --manger software developemnt
('ali tarek ','aliTarek@gmail.com',1000,'01225698432',4), --manger mobile develoment
('mahmoud ali ','ahmoud22@gmail.com',9000,'01525698431',3) --manger electronics

insert into Student
(FullName,Email,Phone, Track_Id)
values('ahmed ibrahim','ahmed052@gmail.com','01025698434', 1) ,
('ahmed ibrahim','ibrah665@gmail.com','01025698434', 4),
('ahmed ala alldin','ala66@gmail.com','01025698434', 3) ,
('ola mohmmed','ola07@gmail.com','01025698434', 4) ,
('mona ahmed','wal740@gmail.com','01025698434', 2) ,
('ahmed tarek','ahmed_0_1@gmail.com','01025698434', 3), 
('youssef ali','youss_0@gmail.com','01025698434', 2) ,
('osama ibrahim','osama023@gmail.com','01025698434', 1), 
('eman mohammed','eman505@gmail.com','01025698434', 1),
('kloudy hany','klaw701@gmail.com','01025698434', 1),
('khaled mohammed','khaled788@gmail.com','01025698434', 1),
('salma ali','salma780@gmail.com','01025698434', 1),
('ahmed karm','salma780@gmail.com','01025698434', 1),
('abdo fatihy','salma780@gmail.com','01025698434', 1)
 
 insert into Course
 ([Name], [Description] ,Min_Degree, Max_Degree)
 values('Html&Css','learn the client side tech',15,30),
 ('Html&Css&Js','learn the client side tech',20,40),
 ('C#','learn C# and oop and advanced',20,40),
 ('Sql server','learn DB and DB objects',25,50),
 ('python','learn python for web',15,30),
 ('Javascript','learn js for mern stack',30,60),
 ('java','learn java for android',9,18),
 ('ccna','learn fundmnatul of network',10,20),
 ('arduino','learn for embeded system',25,50)

insert into Instructor_Course_Track
(Ins_ID, Crs_ID, Track_ID)
values(113,302,1),
(109,305,3),
(110,303,1),
(111,304,2),
(112,306,4)

insert into Student_Course
(Std_ID,Crs_ID)
values(200,302),
(201,306),
(202,308),
(203,306),
(204,307),
(205,308),
(206,307),
(207,303),
(207,301),
(208,302),
(210,302),
(211,303),
(212,303),
(213,302)

