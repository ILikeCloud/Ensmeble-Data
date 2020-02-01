DECLARE @Startdate DATE
DECLARE @enddate DATE
DECLARE @processdate DATE
DECLARE @memberid INT
DECLARE @desc VARCHAR(100)

set @Startdate = '2019-12-01'
set @enddate = '2019-12-31'
set @processdate = '2020-01-01'
set @memberid = 183920
set @desc = 'Statement for - '+ datename(MONTH,@Startdate)

--all above dues in one proc
exec [sp_process_member_dues_all] @memberid, @Startdate, @enddate, @processdate
--apply credits from past
exec [sp_process_member_credit] @memberid,  @processdate
--balance as of end of the month before
exec [sp_process_member_balance] @memberid,  @processdate
--statements
exec [sp_process_member_statements] @memberid, @Startdate, @enddate, @processdate, @desc


select * from MemberStatements where MemberStatementId = 1238 
select * from MemberStatementDetails where MemberStatementId = 1238 
 
select * from JobDetails where JobId = 259901 and MemberId = 183920 
 
select * From Ledgers where MemberId = 183920 