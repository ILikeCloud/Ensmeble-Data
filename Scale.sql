select * from jobs where scaleheaderid = 430 order by jobid desc

select * from ScaleHeaders where scaleheaderid = 430
select * From EngagementCategories

select * from Scales where scaleheaderid = 430
select * From ScaleRoleCodes

select s.ScaleHeaderId, sr.ScaleRoleId, sh.MinHours, sr.ScaleRoleDesc, s.ScaleRate, sh.WDPercent, sh.EPFPercent, sh.EMSD_Percent
, sh.HW1Percent, sh.HW1Dollars, sh.HW1Count, sh.HW2Percent, sh.HW2Dollars, sh.HW2Count
from Scales  s
inner join ScaleRoleCodes sr on s.ScaleRoleId = sr.ScaleRoleId
inner join ScaleHeaders sh on sh.ScaleHeaderId = s.ScaleHeaderId
where s.ScaleHeaderId = 430 and s.IsActive = 1 and sr.IsActive = 1 and sh.IsActive = 1 
order by s.SortOrder

--select * From jobs where jobid = 259970
select * From JobDetails where jobid = 259970 order by ScaleRoleId, sortorder

select * from members where memberssn = 232737647
update members set IsEMSDinJobsEffective=1 where memberssn = 232737647


