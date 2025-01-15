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
after update , delete
as 
begin
    update Exam
    set Total_Degree = (
        select ISNULL(SUM(QP.Degree), 0)
		from Exam_Question EQ
        join Question_Pool QP on EQ.Q_ID = QP.ID
        where EQ.Exam_ID = Exam.ID
    )
    where ID in (
        select distinct deleted.ID from deleted
        UNION
        select DISTINCT inserted.ID from inserted
    )
end;
Go

 
----------------functions----------------
create function GetStudentGrade (@Score int)
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
END;
Go

select S.ID as StudentID,S.FullName as StudentName, SEA.Score as StudentScore ,
    dbo.GetStudentGrade(SEA.Score) as StudentGrade
from Student_Exam_Answer SEA ,   Student S
where SEA.Std_ID = S.ID;
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
);
Go


SELECT * FROM GetScoreStatistics();
