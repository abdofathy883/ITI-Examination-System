create proc CreateExam
    @Ex_ID int,
	@Title nvarchar(50),
	@Type nvarchar(50),
	@Total_Time int ,
	@Total_Dregree int ,
	@crs_id int
as
begin try
	if not exists (select * from course where ID = @crs_id)
		begin
			select 'the course does not exist' as 'errmessage'
		end
	else
		begin
			insert into exam (ID, Title, Type, Total_Time , Total_Degree ,Crs_ID)
			values (@EX_ID, @Title, @Type, @Total_time ,@Total_Dregree, @crs_id);

			if(@Type = 't/f')
				begin
					insert into Exam_Question (Exam_ID,Q_ID)
					select top (10) @Ex_ID, q.ID
					from Question_Pool q
					where q.type = 't/f'
					order by newid();
				end
			else if(@Type = 'mcq')
				begin
			
				insert into Exam_Question (Exam_ID,Q_ID)
				select top (10) @Ex_id, q.ID
				from Question_Pool q
				where q.Type = 'mcq'
				order by newid();
			end
		end
end try
begin catch
    select error_message() as errormessage
end catch
Go
----------------------
create procedure CalculateStudentScore
    @StudentID int,
    @ExamID int
as
begin
    declare @CorrectAnswer nvarchar(100);
    declare @StudentAnswer nvarchar(100);
    declare @Score int = 0;
    declare @QuestionID int;
    
    declare answer_cursor cursor for
    select Q.ID, Q.Model_Answer
    from Question_Pool Q
    join Exam_Question EQ 
	on Q.ID = EQ.Q_ID
    where EQ.Exam_ID = @ExamID;

    open answer_cursor;
    fetch next from answer_cursor into @QuestionID, @CorrectAnswer;
    while @@fetch_status = 0
    begin
        select @StudentAnswer = A.Content
        from Student_Exam_Answer SEA
        join Answer A 
		on SEA.Ans_ID = A.ID
        where SEA.Std_ID = @StudentID and SEA.Exam_ID = @ExamID and SEA.Ans_ID = @QuestionID;

        if @StudentAnswer = @CorrectAnswer
        begin
            select @Score = @Score + Q.Degree
            from Question_Pool Q
            where Q.ID = @QuestionID;
        end
	fetch next from answer_cursor into @QuestionID, @CorrectAnswer;
    end;

    close answer_cursor;
    deallocate answer_cursor;

    update Student_Exam_Answer
    set Score = @Score
    where Std_ID = @StudentID and Exam_ID = @ExamID;

    print 'Final Score for Student ID ' + cast(@StudentID as nvarchar(10)) + ' is ' + cast(@Score as nvarchar(10));
end;
go