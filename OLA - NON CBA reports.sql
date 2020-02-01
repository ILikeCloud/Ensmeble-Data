-non CBA

SELECT vw_jobs.EngCatDesc, vw_jobs.EngSubCatDesc, vw_jobs.JobNumber, 
vw_jobs.JobDate, vw_jobs.Title, vw_jobs.Place,vw_jobs.HWEmployerName, 
vw_jobs.ScaleName, JobMusicians, vw_jobs.LeaderName, vw_jobs.CreatedDate, 
vw_jobs.CasualGroup, coalesce(vw_jobs.ReferralService, 0) AS ReferralService 
FROM vw_Jobs 
LEFT OUTER JOIN tblJobStats ON vw_jobs.JobNumber = tblJobStats.JobNumber 
WHERE (vw_jobs.JobType = 'performance') 
and vw_jobs.EngCatID IN (21, 22, 24, 27) 
and vw_jobs.createddate BETWEEN CONVERT(DATETIME, '1/1/2020 00:00:00', 102) AND CONVERT(DATETIME, '1/26/2020 23:58:00', 102)  
AND (COALESCE (vw_Jobs.JobDeleted, 0) = 0) 
ORDER BY vw_jobs.EngCatDesc, vw_jobs.EngSubCatDesc, vw_jobs.JobDate 


SELECT top 10 a.EngagementCategoryId, b.EngCatDesc, a.EngSubCatId, c.EngSubCatDesc
,a.JobId, a.JobOriginalDate, a.JobTitle, a.JobLocation
,a.EmployerId, d.EmployerName, a.SignatoryId, e.EmployerName
,a.ScaleHeaderId, G.ScaleName, A.JobLeaderId, h.MemberFirstName, h.MemberLastName
,a.createddate
from Jobs a 
inner join EngagementCategories b on a.EngagementCategoryId = b.EngagementCategoryId
inner join EngagementSubCategories c on c.EngSubCatId = a.EngSubCatId
inner join Employers d on a.EmployerId = d.EmployerId
inner join Employers e on a.SignatoryId = e.EmployerId
inner join ScaleHeaders G ON G.ScaleHeaderId = A.ScaleHeaderId
inner join Members h on a.JobLeaderId = h.MemberId
where a.JobTypeId = 2 --perfromance
and a.EngagementCategoryId IN (21, 22, 24, 27) 
AND a.JobOriginalDate BETWEEN CONVERT(DATETIME, '1/1/2019 00:00:00', 102) AND CONVERT(DATETIME, '1/26/2020 23:58:00', 102) 
ORDER BY b.EngCatDesc, c.EngSubCatDesc, a.JobOriginalDate 


--OLA

SELECT vw_jobs.EngCatDesc, vw_jobs.EngSubCatDesc, vw_jobs.JobNumber, 
vw_jobs.JobDate, vw_jobs.Title, vw_jobs.Place,vw_jobs.HWEmployerName, 
vw_jobs.ScaleName, jobMusicians, vw_jobs.LeaderName, vw_jobs.CreatedDate, 
vw_jobs.CasualGroup, coalesce(dbo.vw_jobs.ReferralService, 0) ReferralService 
FROM vw_jobs 
LEFT OUTER JOIN tblJobStats ON vw_jobs.JobNumber = tblJobStats.JobNumber 
WHERE (vw_jobs.JobType = 'performance') 
AND (vw_jobs.CBACode = 'ola') 
AND vw_jobs.createddate BETWEEN CONVERT(DATETIME, '1/1/2020 00:00:00', 102) AND CONVERT(DATETIME, '1/26/2020 23:58:00', 102) 
AND (COALESCE (vw_Jobs.JobDeleted, 0) = 0) 
ORDER BY vw_jobs.EngCatDesc, vw_jobs.EngSubCatDesc, vw_jobs.JobDate 


SELECT top 10 a.EngagementCategoryId, b.EngCatDesc, a.EngSubCatId, c.EngSubCatDesc
,a.JobId, a.JobOriginalDate, a.JobTitle, a.JobLocation
,a.EmployerId, d.EmployerName, a.SignatoryId, e.EmployerName
,a.ScaleHeaderId, G.ScaleName, A.JobLeaderId, h.MemberFirstName, h.MemberLastName
,a.createddate
from Jobs a 
inner join EngagementCategories b on a.EngagementCategoryId = b.EngagementCategoryId
inner join EngagementSubCategories c on c.EngSubCatId = a.EngSubCatId
inner join Employers d on a.EmployerId = d.EmployerId
inner join Employers e on a.SignatoryId = e.EmployerId
inner join ScaleHeaders G ON G.ScaleHeaderId = A.ScaleHeaderId
inner join Members h on a.JobLeaderId = h.MemberId
where a.JobTypeId = 2 --perfromance
and a.LocalCBACode = 'ola'
AND a.JobOriginalDate BETWEEN CONVERT(DATETIME, '1/1/2019 00:00:00', 102) AND CONVERT(DATETIME, '1/26/2020 23:58:00', 102) 
ORDER BY b.EngCatDesc, c.EngSubCatDesc, a.JobOriginalDate 


-------------------------------------
select object_name(object_id), *
from sys.columns where name like '%cbacode%'

select * From ScaleHeaders where LocalCBACode = 'ola'

select top 10 * from jobs 
where jobid = 252710
order by jobid DESC



