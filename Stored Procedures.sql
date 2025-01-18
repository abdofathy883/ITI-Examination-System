create or alter proc CreateExam
    @Ex_ID int,
	@Title nvarchar(50),
	@Type nvarchar(50),
	@Total_Time int ,
	--@Total_Dregree int ,
	@crs_id int,
	@Ins_ID int,
	@Std_IDs StudentsID readonly, 
	@Ex_Date date,
	@Ex_Start_Time time
as
begin try
	if not exists (select * from course where ID = @crs_id)
		begin
			select 'Course does not exist' as 'error message'
		end
	if not exists (select * from Instructor where ID = @Ins_Id)
		begin
			select 'Instructor does not exist' as 'error message'
		end
	if exists (select * from @Std_IDs S where not exists (select * from Student where ID = S.Student_ID))
		begin 
			select 'Student does not exist' as 'error message'
		end
	if exists (select * from Exam where ID = @Ex_ID)
		begin
			select 'Exam with this ID already exists' as 'error message'
		end

	insert into exam (ID, Title, Type, Total_Time , Total_Degree ,Crs_ID)
	values (@EX_ID, @Title, @Type, @Total_time ,default , @crs_id)

	if(@Type = 'True/False')
		begin
			insert into Exam_Question (Exam_ID, Q_ID)
			select top (10) @Ex_ID, q.ID
			from Question_Pool q
			where q.type = 'True/False'
			order by newid()
		end
	else if(@Type = 'Multiple Choice')
		begin
			insert into Exam_Question (Exam_ID,Q_ID)
			select top (10) @Ex_ID, q.ID
			from Question_Pool q
			where q.Type = 'Multiple Choice'
			order by newid()
		end

		insert into Instructor_Course_Exam
		values(@Ins_ID, @crs_id, @Ex_ID, GETDATE())

		insert into Instructor_Student_Exam
		select @Ex_Date, @Ex_Start_Time, @Ins_ID, Student_ID, @Ex_ID
		from @Std_IDs
end try
begin catch
    select error_message() as errormessage
end catch
Go

create or alter proc CreateCorrectiveExam
    @Ex_ID int,
	@Title nvarchar(50),
	@Type nvarchar(50),
	@Total_Time int ,
	@crs_id int,
	@Ins_ID int,
	@Std_IDs StudentsID readonly, 
	@Ex_Date date,
	@Ex_Start_Time time
as
begin try
	if not exists (select * from course where ID = @crs_id)
		begin
			select 'Course does not exist' as 'error message'
		end
	if not exists (select * from Instructor where ID = @Ins_Id)
		begin
			select 'Instructor does not exist' as 'error message'
		end
	if exists (select * from @Std_IDs S where not exists (select * from Student where ID = S.Student_ID))
		begin 
			select 'Student does not exist' as 'error message'
		end
	if exists (select * from Exam where ID = @Ex_ID)
		begin
			select 'Exam with this ID already exists' as 'error message'
		end

	insert into exam (ID, Title, Type, Total_Time , Total_Degree ,Crs_ID)
	values (@EX_ID, @Title, @Type, @Total_time ,default , @crs_id)

	if(@Type = 'True/False')
		begin
			insert into Exam_Question (Exam_ID, Q_ID)
			select top (10) @Ex_ID, q.ID
			from Question_Pool q
			where q.type = 'True/False'
			order by newid()
		end
	else if(@Type = 'Multiple Choice')
		begin
			insert into Exam_Question (Exam_ID,Q_ID)
			select top (10) @Ex_ID, q.ID
			from Question_Pool q
			where q.Type = 'Multiple Choice'
			order by newid()
		end

		insert into Instructor_Course_Exam
		values(@Ins_ID, @crs_id, @Ex_ID, GETDATE())

		insert into Instructor_Student_Exam
		select @Ex_Date, @Ex_Start_Time, @Ins_ID, Student_ID, @Ex_ID
		from @Std_IDs
end try
begin catch
    select error_message() as errormessage
end catch
Go
----------------------

create or alter procedure AnswerExam 
	@Ans_ID int, @Answers nvarchar(100), @Ex_ID int
as
begin
	begin try
		if not exists (select 1 from Exam where ID = @Ex_ID)
			begin
				select 'Exam does not exists'
			end

		declare @Answer_Table table (Content nvarchar(100))
		insert into @Answer_Table
		select value
		from string_split(@Answers, ',')

		insert into Answer
		select @Ans_ID, @Ex_ID, Content
		from @Answer_Table
	end try
	begin catch
	    select error_message() as errormessage
	end catch
end
go
---------------------

create or alter procedure CalculateStudentScore
    @StudentID int,
    @ExamID int
as
begin
    declare @CorrectAnswer nvarchar(100)
    declare @StudentAnswer nvarchar(100)
    declare @Score int = 0
    declare @QuestionID int
    
    declare answer_cursor cursor for
    select Q.ID, Q.Model_Answer
    from Question_Pool Q
    join Exam_Question EQ 
	on Q.ID = EQ.Q_ID
    where EQ.Exam_ID = @ExamID

    open answer_cursor
    fetch next from answer_cursor into @QuestionID, @CorrectAnswer
    while @@fetch_status = 0
    begin

        select @StudentAnswer = A.Content
        from Answer A 
       where A.ID=@QuestionID and A.Exam_ID=@ExamID

        if @StudentAnswer = @CorrectAnswer
        begin
            select @Score = @Score + Q.Degree
            from Question_Pool Q
            where Q.ID = @QuestionID
        end
	fetch next from answer_cursor into @QuestionID, @CorrectAnswer
    end

    close answer_cursor
    deallocate answer_cursor

    insert into Student_Exam_Answer(Std_ID,Exam_ID, Score)
    values(@StudentID,@ExamID, @Score)

    print 'Final Score for Student ID ' + cast(@StudentID as nvarchar(10)) + ' is ' + cast(@Score as nvarchar(10))
end
go





