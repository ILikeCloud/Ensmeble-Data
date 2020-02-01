--Sample on how to loop through records in SQL


-- select * from jobdetails 
-- where joboriginaldate > '12/01/2019'

-- select distinct MemberId from jobdetails 
-- where joboriginaldate > '12/01/2019'

DECLARE @MyCursor CURSOR;
DECLARE @memberid int;
DECLARE @Startdate DATE
DECLARE @enddate DATE
DECLARE @processdate DATE
DECLARE @desc VARCHAR(100)

set @Startdate = '2019-12-01'
set @enddate = '2019-12-31'
set @processdate = '2020-01-01'
set @desc = 'Statement for - '+ datename(MONTH,@Startdate)

BEGIN
    SET @MyCursor = CURSOR FOR
    select distinct MemberId from jobdetails where joboriginaldate >= @Startdate   

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @memberid

    WHILE @@FETCH_STATUS = 0
    BEGIN
        print @memberid

        --all above dues in one proc
        exec [sp_process_member_dues_all] @memberid, @Startdate, @enddate, @processdate
        --apply credits from past
        exec [sp_process_member_credit] @memberid,  @processdate
        --balance as of end of the month before
        exec [sp_process_member_balance] @memberid,  @processdate
        --statements
        exec [sp_process_member_statements] @memberid, @Startdate, @enddate, @processdate, @desc

      FETCH NEXT FROM @MyCursor 
      INTO @memberid 
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;
