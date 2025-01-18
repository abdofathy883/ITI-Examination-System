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

select * from GetStudentGrade(1)

select * from [dbo].[GetStudentGrade]

-----------------------Stored Procedures-----------------------
-----------------------Core SPs-----------------------
exec CreateExam @Ex_ID = 20, @Title= 'Exam 3', @Type = 'True/False', 
@Total_Time = 2, @total_Dregree = 40, @crs_id = 301, @Ins_ID = 110, @Std_ID = 205,
@Ex_Date = '2025-01-18', @Ex_Start_Time = '11:45:00'
go

exec AnswerExam @Ans_ID = 21, @Answers = 'False', @Ex_ID = 20
exec AnswerExam @Ans_ID = 22, @Answers = 'True', @Ex_ID = 20
exec AnswerExam @Ans_ID = 23, @Answers = 'True', @Ex_ID = 20
exec AnswerExam @Ans_ID = 24, @Answers = 'False', @Ex_ID = 20
exec AnswerExam @Ans_ID = 25, @Answers = 'True', @Ex_ID = 20
exec AnswerExam @Ans_ID = 26, @Answers = 'False', @Ex_ID = 20
exec AnswerExam @Ans_ID = 27, @Answers = 'True', @Ex_ID = 20
exec AnswerExam @Ans_ID = 28, @Answers = 'True', @Ex_ID = 20
exec AnswerExam @Ans_ID = 29, @Answers = 'False', @Ex_ID = 20

exec CalculateStudentScore @StudentID = 205, @ExamID = 20
go
----------------

exec insert_student @FullName = 'Student test', @Email = 'student@gmail.com', @Track_ID = 4
go

exec update_student @ID = ,@FullName = 'Student test updated', 
	@Email = 'studentUpdated@gmail.com', @Track_Id = 1
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
