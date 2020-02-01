


SELECT DB_NAME()
Ensemble_as_01232020

This DB has the converted data references for DocumentPathBlob



select top 10 * 
from Documents
where DocumentPathBlob != '.'

select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2011\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2012\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2013\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2014\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2015\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2016\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2017\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2018\%'
select count(*) from Documents where DocumentPathlocal like 'c:\temp\ensemble\2019\%'


