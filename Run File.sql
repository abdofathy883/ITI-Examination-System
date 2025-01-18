-----------------------Views-----------------------
select * from V_Branch_Data

select * from V_Manager_Data

select * from V_Instructor_Data

select * from V_Student_Data

select * from V_Exam_Data

select * from V_Course_Instructor

select * from ShowExam

-----------------------Functions-----------------------
select * from GetScoreStatistics()

select dbo.GetStudentGrade(11) 

select S.ID as StudentID,S.FullName as StudentName, SEA.Score as StudentScore ,
    dbo.GetStudentGrade(SEA.Score) as StudentGrade
from Student_Exam_Answer SEA ,   Student S
where SEA.Std_ID = S.ID
Go

-----------------------Stored Procedures-----------------------
-----------------------Core SPs-----------------------
declare @Student_List StudentsID

insert into @Student_List (Student_ID)
values (206), (207), (208), (209), (210)

exec CreateExam @Ex_ID = 50, @Title= 'Exam 500', @Type = 'True/False', 
@Total_Time = 2, @crs_id = 304, @Ins_ID = 112, @Std_IDs = @Student_List,
@Ex_Date = '2025-01-18', @Ex_Start_Time = '11:45:00'
go

select * from ShowExam
exec AnswerExam @Ans_ID = 23, @Answers = 'Flase', @Ex_ID = 40
exec AnswerExam @Ans_ID = 24, @Answers = 'True', @Ex_ID =40
exec AnswerExam @Ans_ID = 29, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 31, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 33, @Answers = 'False', @Ex_ID =40
exec AnswerExam @Ans_ID = 34, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 37, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 38, @Answers = 'False', @Ex_ID =40
exec AnswerExam @Ans_ID = 39, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 40, @Answers = 'True', @Ex_ID = 40

exec AnswerExam @Ans_ID = 23, @Answers = 'Flase', @Ex_ID = 40
exec AnswerExam @Ans_ID = 24, @Answers = 'True', @Ex_ID =40
exec AnswerExam @Ans_ID = 29, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 31, @Answers = 'True', @Ex_ID = 40
exec AnswerExam @Ans_ID = 33, @Answers = 'False', @Ex_ID =40
exec AnswerExam @Ans_ID = 34, @Answers = 'False', @Ex_ID = 40
exec AnswerExam @Ans_ID = 37, @Answers = 'False', @Ex_ID = 40
exec AnswerExam @Ans_ID = 38, @Answers = 'True', @Ex_ID =40
exec AnswerExam @Ans_ID = 39, @Answers = 'False', @Ex_ID = 40
exec AnswerExam @Ans_ID = 40, @Answers = 'False', @Ex_ID = 40


exec CalculateStudentScore @StudentID = 207, @ExamID = 40
go
----------------

exec insert_student @FullName = 'Student test', @Email = 'student@gmail.com', @Track_ID = 4
go

exec update_student @ID = ,@FullName = 'Student test updated', 
	@Email = 'studentUpdated@gmail.com'
go

exec delete_student @ID = 
go

exec insert_course @Name = 'course test', @Descrption = 'Description for course test', 
	@Min_Degree = 20, @Max_Degree = 50
go

exec insert_Manager @FullName = 'Student test', @Email = 'student@gmail.com', 
	@Salary = , @Phone = '', @Dept_ID =
go

exec update_Manager @ID = ,@FullName = 'Student test', @Email = 'student@gmail.com', 
	@Salary = , @Phone = '', @Dept_ID = 
go

exec delete_Manager @ID = 
go

exec insert_Instructor @FullName = 'Student test', @Email = 'student@gmail.com', 
	@Salary = , @Phone = ''
go

exec update_Instructor @ID = ,@FullName = 'Student test', @Email = 'student@gmail.com', 
	@Salary = , @Phone = ''
go

exec delete_Instructor @iD = 
go

exec insert_Instructor_Course_Track @Ins_ID = ,@Crs_ID = ,@Track_Id = 
go

exec update_Instructor_Course_Track @Ins_ID = ,@Crs_ID = ,@Track_Id = 
go

exec delete_Instructor_Course_Track @Ins_ID = ,@Crs_ID = ,@Track_Id = 
go

exec insert_Branch @ID = ,@Name = '', @Location = ''
go

exec update_Branch @ID = ,@Name = '', @Location = ''
go

exec delete_Branch @ID = 
go

exec insert_Department @ID = ,@Name = '', @Branch_ID = 
go

exec update_Department @ID = ,@Name = '', @Branch_ID = 
go

exec delete_Department @ID = 
go

exec insert_intake @id = ,@year = , @term = ''
go

exec update_intake @id = ,@year = , @term = ''
go

exec delete_intake @id = 
go

exec insert_track_intake @Track_ID = ,@Intake_ID = 
go

exec update_track_intake @Old_Track_ID= , @Old_Intake_ID = , @New_Track_ID = , @New_Intake_ID = 
go

exec delete_track_intake @Track_ID = ,@Intake_ID = 
go

exec insert_question_pool  @ID = ,@Type = '',@Content = '', 
	@Model_Answer = '',@Degree = , @Choice_ID = 
go

exec update_question_pool  @ID = ,@Type = '',@Content = '', 
	@Model_Answer = '',@Degree = , @Choice_ID = 
go

exec delete_question_pool @ID = 
go

exec insert_choice  @ID = , @Choice_1 = '', @Choice_2 = '',
	@Choice_3 = '', @Choice_4 = ''
go

exec update_choice  @Old_ID = , @New_ID = , @Choice_1 = '',@Choice_2 = '',
	@Choice_3 = '', @Choice_4 = ''
go

exec delete_choice  @ID = 
go
