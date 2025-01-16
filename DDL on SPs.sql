--------------------------Student-------------------------------
create or alter procedure insert_student
	@FullName nvarchar(20) ,
	@Email nvarchar(30),
	@Track_ID int
as
begin
    insert into Student(FullName, Email, Track_ID)
    values (@FullName, @Email, @Track_ID)
end
go


create or alter procedure update_student
    @ID int ,
	@FullName nvarchar(20) ,
	@Email nvarchar(30),
	@Track_ID int
as
begin
    update Student
    set FullName = @FullName,
        Email = @Email,
        Track_ID = @Track_ID
    where ID = @ID
end
go


create or alter procedure delete_student @ID int
as
begin
    delete from Student
    where ID = @ID
end
go
--------------------------course-------------------------------

create or alter procedure insert_course
	@Name nvarchar(20) ,
	@Descrption text,
	@Min_Degree int,
	@Max_Degree int
as
begin
    insert into Course(Name, Description, Min_Degree , Max_Degree )
    values (@name , @Descrption , @Min_Degree , @Max_Degree)
end
go


create or alter procedure update_course
    @ID int ,
	@Name nvarchar(20) ,
	@Description text,
	@Min_Degree int,
	@Max_Degree int
as
begin
    update Course
    set Name = @Name  ,
		Description = @Description ,
		Min_Degree = @Min_Degree ,
		Max_Degree = @Max_Degree 
    where ID = @ID
end
go


create or alter procedure delete_course @ID int
as
begin
    delete from Course
    where ID = @ID
end
Go
--------------------------student_course-------------------------------

create or alter procedure insert_student_course
    @std_id int ,
	@crs_id int
as
begin
    insert into student_course(std_id, crs_id)
    values (@std_id, @crs_id)
end
go


create or alter procedure update_student_course
    @std_id int ,
	@crs_id int
as
begin
    update student_course
    set Std_ID = @std_id  ,
		Crs_ID = @crs_id 	
    where Std_ID = @std_id and Crs_ID = @crs_id 
end
go


create or alter procedure delete_student_course @std_id  int , @crs_id int
as
begin
    delete from student_course
    where Std_ID = @std_id and Crs_ID = @crs_id 
end
go

--------------------------track-------------------------------
create procedure insert_track
    @ID int ,
	@Name nvarchar(20) ,
	@Dept_ID int ,
	@Intake_ID int
as
begin
    insert into Track(ID, Name, Dept_ID, Intake_ID)
    values (@ID, @Name, @Dept_ID, @Intake_ID)
end
go


create procedure update_track
    @ID int ,
	@Name nvarchar(20) ,
	@Dept_ID int ,
	@Intake_ID int
as
begin
    update Track
    set name = @Name ,
		Dept_ID = @Dept_ID ,
		Intake_Id = @Intake_ID
    where ID = @ID
end
go


create procedure delete_track @ID int
as
begin
    delete from Track
    where ID = @ID
end
go

--------------------------Instructor_Student_Exam-------------------------------
create procedure insert_Instructor_Student_Exam
    @Exam_Date date,
	@Start_Time time,
	@Ins_ID int ,
	@Std_ID int ,
	@Exam_ID int 
as
begin
    insert into Instructor_Student_Exam(Exam_Date , Start_Time ,Ins_ID, Std_ID ,Exam_ID )
    values (@Exam_Date , @Start_Time ,@Ins_ID, @Std_ID ,@Exam_ID )
end
go


create procedure update_Instructor_Student_Exam
    @Exam_Date date,
	@Start_Time time,
	@Ins_ID int ,
	@Std_ID int ,
	@Exam_ID int 
as
begin
    update Instructor_Student_Exam
    set Exam_Date = @Exam_Date ,
	    Start_Time = @Start_Time ,
		ins_id = @Ins_ID ,
		std_id = @Std_ID  ,
		exam_id = @Exam_ID  
    where Ins_ID = @Ins_ID and Std_id = @Std_ID  and Exam_id = @Exam_ID  
end
go


create procedure delete_Instructor_Student_Exam @Ins_ID int , @Std_ID int ,  @Exam_ID int
as
begin
    delete from Instructor_Student_Exam 
    where Ins_ID = @Ins_ID and Std_id = @Std_ID  and Exam_id = @Exam_ID  
end
go

--------------------------Manager-------------------------------
create or alter procedure insert_Manager
	@FullName nvarchar(20) ,
	@Email nvarchar(30) ,
	@Salary decimal ,
	@Phone nvarchar(20) ,
	@Dept_ID int 
as
begin
    insert into Manager(FullName ,Email, Salary ,Phone,Dept_ID )
    values (@FullName ,@Email, @Salary ,@Phone,@Dept_ID )
end
go


create or alter procedure update_Manager
    @ID int ,
	@FullName nvarchar(20) ,
	@Email nvarchar(30) ,
	@Salary decimal ,
	@Phone nvarchar(20) ,
	@Dept_ID int 
as
begin
    update Manager
    set FullName = @FullName ,
		Email = @Email  ,
		Salary = @Salary  ,
		Phone = @Phone ,
		Dept_ID = @Dept_ID  
    where ID = @ID 
end
go

create or alter procedure delete_Manager @iD int
as
begin
    delete from Manager 
    where ID = @ID 
end
go

--------------------------Instructor-------------------------------
create or alter procedure insert_Instructor
	@FullName nvarchar(20) ,
	@Phone nvarchar(20),
	@Email nvarchar(30),
	@Salary decimal
as
begin
    insert into Instructor(FullName ,Phone, Email ,Salary)
    values (@FullName ,@Phone, @Email ,@Salary )
end
go


create or alter procedure update_Instructor
    @ID int ,
	@FullName nvarchar(20) ,
	@Phone nvarchar(20),
	@Email nvarchar(30),
	@Salary decimal
as
begin
    update Instructor
    set FullName = @FullName ,
		Email = @Email  ,
		Salary = @Salary  ,
		Phone = @Phone  
    where ID = @ID 
end
go


create or alter procedure delete_Instructor @iD int
as
begin
    delete from Instructor 
    where ID = @ID 
end
go

--------------------------Instructor_Course_Track-------------------------------
create or alter procedure insert_Instructor_Course_Track
    @Ins_ID int ,
	@Crs_ID int ,
	@Track_ID int 
as
begin
    insert into Instructor_Course_Track(Ins_ID , Crs_ID, Track_ID )
    values (@Ins_ID , @Crs_ID, @Track_ID )
end
go


create or alter procedure update_Instructor_Course_Track
    @Ins_ID int ,
	@Crs_ID int ,
	@Track_ID int 
as
begin
    update Instructor_Course_Track
    set Ins_ID = @Ins_ID ,
		Crs_id = @Crs_ID ,
		Track_ID = @Track_ID   
    where Ins_ID = @Ins_ID and Crs_id = @Crs_ID and Track_ID = @Track_ID
end
go


create or alter procedure delete_Instructor_Course_Track 
    @Ins_ID int ,
	@Crs_ID int ,
	@Track_ID int 
as
begin
    delete from Instructor_Course_Track  
     where Ins_ID = @Ins_ID and Crs_id = @Crs_ID and Track_ID = @Track_ID
end
go

--------------------------Instructor_Course_Exam-------------------------------
create or alter procedure insert_Instructor_Course_Exam
    @Ins_ID int ,
	@Crs_ID int ,
	@Exam_ID int ,
	@Year date
as
begin
    insert into Instructor_Course_Exam(Ins_ID , Crs_ID, Exam_ID, Year )
    values (@Ins_ID , @Crs_ID, @Exam_ID ,@Year )
end
go


create or alter procedure update_Instructor_Course_Exam
    @Ins_ID int ,
	@Crs_ID int ,
	@Exam_ID int ,
	@Year date
as
begin
    update Instructor_Course_Exam
    set Ins_ID = @Ins_ID ,
		Crs_id = @Crs_ID ,
		Exam_ID = @Exam_ID ,
		Year = @Year
    where Ins_ID = @Ins_ID and Crs_id = @Crs_ID and Exam_ID = @Exam_ID
end
go


create or alter procedure delete_Instructor_Course_Exam 
    @Ins_ID int ,
	@Crs_ID int ,
	@Exam_ID int 
as
begin
    delete from Instructor_Course_Exam  
     where Ins_ID = @Ins_ID and Crs_id = @Crs_ID and Exam_ID = @Exam_ID
end
go

--------------------------Branch-------------------------------


create or alter procedure insert_Branch
    @ID int , 
	@Name nvarchar(20),
	@Location nvarchar(30)
as
begin
    insert into Branch(ID , Name , [Location] )
    values (@ID , @Name , @Location )
end;

go
create or alter procedure update_Branch
    @ID int , 
	@Name nvarchar(20),
	@Location nvarchar(30)
as
begin
    update Branch
    set ID = @ID  , 
		Name = @Name ,
		[Location] = @Location 
    where ID = @ID 
end
go


create or alter procedure delete_Branch @ID int
as
begin
    delete from Branch  
    where ID = @ID 
end
go

--------------------------Department-------------------------------
create or alter procedure insert_Department
    @ID int , 
	@Name nvarchar(20),
	@Branch_ID int
as
begin
    insert into Department(ID , Name , Branch_ID )
    values (@ID , @Name , @Branch_ID  )
end
go


create or alter procedure update_Department
    @ID int , 
	@Name nvarchar(20),
	@Branch_ID int
as
begin
    update Department
    set ID = @ID  , 
		Name = @Name ,
		Branch_ID = @Branch_ID 
    where ID = @ID 
end
go


create or alter procedure delete_Department @ID int
as
begin
    delete from Branch  
    where ID = @ID 
end
Go

------**********************************-------
create procedure insert_intake   @id int, @year int, @term nvarchar(20)
as
begin
    insert into Intake (ID, [Year], Term)
    values (@id, @year, @term)
end
Go


create procedure update_intake  @id int, @year int, @term nvarchar(20)
as
begin
    update Intake
    set [Year] = @year,
        Term = @term
    where ID = @id
end
Go


create procedure delete_intake  @id int
as
begin
    delete from Intake
    where ID = @id
end
Go


------------------
create procedure insert_track_intake   @Track_ID int, @Intake_ID int
as
begin
    insert into Track_Intake (Track_ID, Intake_ID)
    values (@Track_ID, @Intake_ID)
end
Go


create procedure update_track_intake   @Old_Track_ID int, @Old_Intake_ID int, @New_Track_ID int, @New_Intake_ID int
as
begin
    update Track_Intake
    set Track_ID = @New_Track_ID,
        Intake_ID = @New_Intake_ID
    where Track_ID = @Old_Track_ID and Intake_ID = @Old_Intake_ID
end
Go


create procedure delete_track_intake
    @Track_ID int,
    @Intake_ID int
as
begin
    delete from Track_Intake
    where Track_ID = @Track_ID and Intake_ID = @Intake_ID
end
Go

------------------------
create procedure insert_exam   @ID int, @Title nvarchar(30),@Type nvarchar(50), @Total_Time int, @Total_Degree int, @Crs_ID int
as
begin
    insert into Exam (ID, Title, Type, Total_Time, Total_Degree, Crs_ID)
    values (@ID, @Title, @Type, @Total_Time, @Total_Degree, @Crs_ID)
end
Go

create procedure update_exam   @ID int, @Title nvarchar(30), @Type nvarchar(50), @Total_Time int, @Total_Degree int, @Crs_ID int
as
begin
    update Exam
    set Title = @Title,
        Type = @Type,
        Total_Time = @Total_Time,
        Total_Degree = @Total_Degree,
        Crs_ID = @Crs_ID
    where ID = @ID
end
Go

create procedure delete_exam @ID int
as
begin
    delete from Exam
    where ID = @ID
end
Go

-----------------------------------------
create procedure insert_question_pool  @ID int,@Type nvarchar(30),@Content nvarchar(100), @Model_Answer nvarchar(20),@Degree int, @Choice_ID int
as
begin
    insert into Question_Pool (ID, Type, Content, Model_Answer, Degree, Choice_ID)
    values (@ID, @Type, @Content, @Model_Answer, @Degree, @Choice_ID)
end
Go

create procedure update_question_pool  @ID int,@Type nvarchar(30),@Content nvarchar(100),@Model_Answer nvarchar(20), @Degree int,@Choice_ID int
as
begin
    update Question_Pool
    set Type = @Type,
        Content = @Content,
        Model_Answer = @Model_Answer,
        Degree = @Degree,
        Choice_ID = @Choice_ID
    where ID = @ID
end
Go

create procedure delete_question_pool  @ID int
as
begin
    delete from Question_Pool
    where ID = @ID
end
Go
--------------------------------------
create procedure insert_exam_question  @Exam_ID int, @Q_ID int
as
begin
    insert into Exam_Question (Exam_ID, Q_ID)
    values (@Exam_ID, @Q_ID)
end
Go

create procedure update_exam_question @Old_Exam_ID int, @Old_Q_ID int, @New_Exam_ID int, @New_Q_ID int
as
begin
    update Exam_Question
    set Exam_ID = @New_Exam_ID,
        Q_ID = @New_Q_ID
    where Exam_ID = @Old_Exam_ID and Q_ID = @Old_Q_ID
end
Go

create procedure delete_exam_question  @Exam_ID int, @Q_ID int
as
begin
    delete from Exam_Question
    where Exam_ID = @Exam_ID and Q_ID = @Q_ID
end
Go

-----------------------------------
create procedure insert_student_exam_answer @Std_ID int,@Exam_ID int,@Ans_ID int, @Score int
as
begin
    insert into Student_Exam_Answer (Std_ID, Exam_ID, Ans_ID, Score)
    values (@Std_ID, @Exam_ID, @Ans_ID, @Score)
end
Go

create procedure update_student_exam_answer @Old_Std_ID int,@Old_Exam_ID int,@Old_Ans_ID int,@New_Std_ID int,@New_Exam_ID int,@New_Ans_ID int, @New_Score int
as
begin
    update Student_Exam_Answer
    set Std_ID = @New_Std_ID,
        Exam_ID = @New_Exam_ID,
        Ans_ID = @New_Ans_ID,
        Score = @New_Score
    where Std_ID = @Old_Std_ID and Exam_ID = @Old_Exam_ID and Ans_ID = @Old_Ans_ID
end
Go

create procedure delete_student_exam_answer  @Std_ID int, @Exam_ID int, @Ans_ID int
as
begin
    delete from Student_Exam_Answer
    where Std_ID = @Std_ID and Exam_ID = @Exam_ID and Ans_ID = @Ans_ID
end
Go

-------------------------------------------------------
create procedure insert_answer  @ID int, @Exam_ID int, @Content nvarchar(20)
as
begin
    insert into Answer (ID, Exam_ID, Content)
    values (@ID, @Exam_ID, @Content)
end
Go

create procedure update_answer  @Old_ID int,@Old_Exam_ID int, @New_ID int,@New_Exam_ID int, @New_Content nvarchar(20)
as
begin
    update Answer
    set ID = @New_ID,
        Exam_ID = @New_Exam_ID,
        Content = @New_Content
    where ID = @Old_ID and Exam_ID = @Old_Exam_ID
end
Go

create procedure delete_answer  @ID int, @Exam_ID int
as
begin
    delete from Answer
    where ID = @ID and Exam_ID = @Exam_ID
end
Go
-------------------------------------------------------
create procedure insert_choice  @ID int, @Choice_1 nvarchar(20), @Choice_2 nvarchar(20),@Choice_3 nvarchar(20),@Choice_4 nvarchar(20)
as
begin
    insert into Choice (ID, Choice_1, Choice_2, Choice_3, Choice_4)
    values (@ID, @Choice_1, @Choice_2, @Choice_3, @Choice_4)
end
Go

create procedure update_choice  @Old_ID int, @New_ID int, @Choice_1 nvarchar(20),@Choice_2 nvarchar(20),@Choice_3 nvarchar(20), @Choice_4 nvarchar(20)
as
begin
    update Choice
    set ID = @New_ID,
        Choice_1 = @Choice_1,
        Choice_2 = @Choice_2,
        Choice_3 = @Choice_3,
        Choice_4 = @Choice_4
    where ID = @Old_ID
end
Go

create procedure delete_choice  @ID int
as
begin
    delete from Choice
    where ID = @ID
end
Go