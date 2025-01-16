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

-------------------------------------------------------------
select * from Choice
insert into Choice (Id, Choice_1, Choice_2, Choice_3, Choice_4)
values
(1, 'a', 'b', 'c', 'd'),
(2, 'a', 'b', 'c', 'd'),
(3, 'a', 'b', 'c', 'd'),
(4, 'a', 'b', 'c', 'd'),
(5, 'a', 'b', 'c', 'd'),
(6, 'a', 'b', 'c', 'd'),
(7, 'a', 'b', 'c', 'd'),
(8, 'a', 'b', 'c', 'd'),
(9, 'a', 'b', 'c', 'd'),
(10, 'a', 'b', 'c', 'd'),
(11, 'a', 'b', 'c', 'd'),
(12, 'a', 'b', 'c', 'd'),
(13, 'a', 'b', 'c', 'd'),
(14, 'a', 'b', 'c', 'd'),
(15, 'a', 'b', 'c', 'd'),
(16, 'a', 'b', 'c', 'd'),
(17, 'a', 'b', 'c', 'd'),
(18, 'a', 'b', 'c', 'd'),
(19, 'a', 'b', 'c', 'd'),
(20, 'a', 'b', 'c', 'd')

insert into Question_Pool (ID, Type, Content, Model_Answer, Degree,Choice_ID)
values
(1, 'Multiple Choice', 'What does HTML stand for?', 'a', 5,19),
(2, 'Multiple Choice', 'Which CSS property is used to change text color?', 'c', 4,18),
(3, 'Multiple Choice', 'What is the default display value of <div> in HTML?', 'b', 3,20),
(4, 'Multiple Choice', 'Which HTML tag is used to include JavaScript?', 'a', 4,4),
(5, 'Multiple Choice', 'Which keyword is used to declare a variable in JavaScript?', 'a', 3,1),
(6, 'Multiple Choice', 'What does SQL stand for?', 'b', 5,2),
(7, 'Multiple Choice', 'Which protocol is used by web browsers to access websites?', 'c', 3,3),
(8, 'Multiple Choice', 'Which property is used to change the background color in CSS?', 'd', 4,17),
(9, 'Multiple Choice', 'What is the correct syntax for a comment in HTML?', 'a', 2,16),
(10, 'Multiple Choice', 'What does DOM stand for?', 'd', 3,15),
(11, 'Multiple Choice', 'Which JavaScript method is used to add an element at the end of an array?', 'c', 4,13),
(12, 'Multiple Choice', 'What does API stand for?', 'a', 3,14),
(13, 'Multiple Choice', 'Which HTML tag is used to define an unordered list?', 'a', 2,11),
(14, 'Multiple Choice', 'Which CSS property is used to make the text bold?', 'c', 4,10),
(15, 'Multiple Choice', 'Which method is used to send data to a server in HTTP?', 'd', 5,9),
(16, 'Multiple Choice', 'Which HTML tag is used for the largest heading?', 'a', 3,6),
(17, 'Multiple Choice', 'What does JSON stand for?', 'b', 5,5),
(18, 'Multiple Choice', 'Which CSS property is used to set the width of an element?', 'a', 4,7),
(19, 'Multiple Choice', 'Which operator is used for strict equality in JavaScript?', 'd', 3,8),
(20, 'Multiple Choice', 'Which HTML element is used to include metadata?', 'c', 3,12),
(21, 'True/False', 'HTML is a programming language.', 'False', 2,1),
(22, 'True/False', 'CSS can be used for animations.', 'True', 3,2),
(23, 'True/False', 'JavaScript is a compiled language.', 'False', 3,3),
(24, 'True/False', 'SQL is case-sensitive.', 'False', 2,4),
(25, 'True/False', 'An <iframe> can be used to embed another webpage.', 'True', 3,5),
(26, 'True/False', 'The <body> tag is mandatory in HTML.', 'True', 3,6),
(27, 'True/False', 'JavaScript can run outside the browser.', 'True', 4,7),
(28, 'True/False', 'CSS stands for Creative Style Sheets.', 'False', 2,8),
(29, 'True/False', 'Bootstrap is a CSS framework.', 'True', 3,9),
(30, 'True/False', 'PHP is a frontend programming language.', 'False', 3,10),
(31, 'True/False', 'The <title> tag is used to set the webpage title.', 'True', 2,11),
(32, 'True/False', 'A <div> element is an inline element by default.', 'False', 3,12),
(33, 'True/False', 'Cookies can store data on the client side.', 'True', 3,13),
(34, 'True/False', 'JavaScript is a case-sensitive language.', 'True', 4,14),
(35, 'True/False', 'The <link> tag is used to link external CSS files.', 'True', 2,15),
(36, 'True/False', 'JSON is only used for web development.', 'False', 3,16),
(37, 'True/False', 'HTTP stands for HyperText Transfer Protocol.', 'True', 2,17),
(38, 'True/False', 'CSS Grid is a framework.', 'False', 3,18),
(39, 'True/False', 'The <header> tag can only be used once per page.', 'False', 2,19),
(40, 'True/False', 'React is a JavaScript library.', 'True', 4,20)