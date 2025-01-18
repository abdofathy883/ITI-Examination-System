----------------Triggers---------------- 
create trigger trg_PreventDeleteStudentAnswer
on Answer
instead of delete 
as 
begin
    print 'Deletion of student answers is not allowed.'
    rollback transaction;
end;
Go

--- 
create or alter trigger trg_UpdateExamTotalDegree
on Exam 
after insert, update
as 
begin
    update Exam
    set Total_Degree = (
        select SUM(QP.Degree)
		from Exam_Question EQ
        join Question_Pool QP on EQ.Q_ID = QP.ID
        where EQ.Exam_ID = Exam.ID
    )
    where ID in (
        select DISTINCT inserted.ID from inserted
    )
end
Go

create or alter trigger trg_Create_Corrective_Exam
on Student_Exam_Answer
after insert, update
as
begin
	declare @Ex_ID int, @Total_Score int, @Min_Degree int,
		 @Instructor_ID int, @Course_ID int
	
	select 
		@Ex_ID = inserted.Exam_ID,
		@Total_Score = inserted.Score,
		@Instructor_ID = ICS.Ins_ID, 
		@Course_ID = ICS.Crs_ID
	from inserted inner join Instructor_Course_Exam ICS
	on ICS.Exam_ID = inserted.Exam_ID

	declare @Student_IDs StudentsID 

	insert into @Student_IDs
	select inserted.Std_ID
	from inserted
	join Student_Exam_Answer SEA
	on SEA.Exam_ID = inserted.Exam_ID 
	where SEA.Score < 15

	declare @New_Ex_ID int = (select isnull(max(ID), 0) + 1 from Exam)

	if exists (select 1 from @Student_IDs)
		begin
			exec CreateCorrectiveExam 
				@Ex_ID = @New_Ex_ID,
				@Title = 'Corrictive Exam',
				@Type = 'Multiple Choice',
				@Total_Time = 2 ,
				@crs_id = @Course_ID,
				@Ins_ID = @Instructor_ID,
				@Std_IDs = @Student_IDs,
				@Ex_Date = '2025-01-18',
				@Ex_Start_Time = '12:00:00'
		end
end
go

 
----------------functions----------------
create or alter function dbo.GetStudentGrade (@Score int)
returns nvarchar(2)
as 
begin
    declare @Grade nvarchar(2);

    if @Score >= 90
        set @Grade = 'A';
    else if @Score >= 80
        set @Grade = 'B';
    else if @Score >= 70
        set @Grade = 'C';
    else if @Score >= 60
        set @Grade = 'D';
    else
        set @Grade = 'F';

    return @Grade;
end
Go
----

create function GetScoreStatistics()
returns table
as
return
(
    select
        AVG(Score) as AverageScore,  MIN(Score) as LowestScore, MAX(Score) as TopScore
    from  Student_Exam_Answer
)
Go
