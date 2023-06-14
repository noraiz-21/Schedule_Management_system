create database externaldb
use externaldb

Create Table dbo.plannedActivity(
Id int identity(1,1) primary key,
Empid int,
Activityname varchar(100),
schedule date,
startdate date,
enddate date
)
alter table dbo.plannedActivity alter column Startdate datetime
alter table dbo.plannedActivity alter column enddate datetime
select * from dbo.plannedActivity

--schedule for 1 , 9-6, 11,11:15 Break  1:00-1:30 Lunch ,4:00 - 4:15 Break 

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Working','2023-08-30','2023-08-30 9:00', '2023-08-30 11:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Break','2023-08-30','2023-08-30 11:00', '2023-08-30 11:15'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Working','2023-08-30','2023-08-30 11:15', '2023-08-30 13:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Lunch','2023-08-30','2023-08-30 13:00', '2023-08-30 13:30'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Working','2023-08-30','2023-08-30 13:30', '2023-08-30 16:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Break','2023-08-30','2023-08-30 16:00', '2023-08-30 16:15'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 1,'Working','2023-08-30','2023-08-30 16:15', '2023-08-30 18:00'


--schedule for 2 , 9-6, 11,11:15 Break  1:00-1:30 Lunch ,4:00 - 4:15 Break 

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Working','2023-08-30','2023-08-30 9:00', '2023-08-30 11:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Break','2023-08-30','2023-08-30 11:00', '2023-08-30 11:15'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Working','2023-08-30','2023-08-30 11:15', '2023-08-30 13:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Lunch','2023-08-30','2023-08-30 13:00', '2023-08-30 13:30'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Working','2023-08-30','2023-08-30 13:30', '2023-08-30 16:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Break','2023-08-30','2023-08-30 16:00', '2023-08-30 16:15'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 2,'Working','2023-08-30','2023-08-30 16:15', '2023-08-30 18:00'

--schedule for 3 , 18:00- 3:00 , 20:00-20:15 Break  22:00-22:30 Lunch ,1:00 - 1:15 Break 



Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Working','2023-08-30','2023-08-30 18:00', '2023-08-30 20:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Break','2023-08-30','2023-08-30 20:00', '2023-08-30 20:15'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Working','2023-08-30','2023-08-30 20:15', '2023-08-30 22:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Lunch','2023-08-30','2023-08-30 22:00', '2023-08-30 22:30'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Working','2023-08-30','2023-08-30 22:30', '2023-08-30 1:00'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Break','2023-08-30','2023-08-31 1:00', '2023-08-30 1:15'

Insert into dbo.plannedActivity(Empid,Activityname,schedule,startdate,enddate) select 3,'Working','2023-08-30','2023-08-30 1:15', '2023-08-30 3:00'

truncate table dbo.plannedActivity
select * from dbo.plannedActivity 

select DATEDIFF(MINUTE,startdate,enddate),startdate,enddate,activityname As Differenece  from dbo.plannedActivity

select sum(DATEDIFF(MINUTE,startdate,enddate)) as TotalSum from dbo.plannedActivity 

select activityname, sum(DATEDIFF(minute,startdate,enddate)) as ActivitySum from dbo.plannedActivity
group by Activityname

select  Empid, Activityname, sum(datediff(minute,startdate,enddate)) as Totalsum 
from dbo.plannedactivity 
group by empid,activityname
order by empid

select sum(datediff(minute, startdate,enddate)) as totalsum,Activityname,startdate,enddate
from externaldb.dbo.plannedActivity
group by Activityname
order by empid, Activityname


create database activitytype;
drop database activitytype
use a

use activitytype




---------------- New database created --------------------


create database schedulemanagement;

use schedulemanagement

Create table dbo.activitytype
(
	activitytypeid tinyint primary key,
	activitytype varchar(20)
)

insert into dbo.activitytype( activitytypeid,activitytype) select 1,'Break'

insert into dbo.activitytype( activitytypeid,activitytype) select 2,'Lunch'

insert into dbo.activitytype( activitytypeid,activitytype) select 3,'training'

-----------------Schedule table -------------------------

Create table dbo.schedules
(
	scheduleid bigint identity(1,1) primary key,
	employeeid int not null,
	scheduledate date not null,
	starttime datetime,
	enddate datetime,
)


----------- database owner  dbo ------------------

create table dbo.scheduleactivities
(
	schactid bigint identity(1,1) primary key,
	scheduleID bigint,
	activitytypeid tinyint,
	starttime tinyint,
	endtime datetime
)

alter table dbo.scheduleactivities alter column starttime datetime



------------- Import data from external database 

  select * from externaldb.dbo.plannedActivity

  select * from dbo.activitytype

  select * from dbo.schedules 

  select empid,schedule, min(startdate),max(enddate)
  from externaldb.dbo.plannedActivity
  group by Empid,schedule

  select * from externaldb.dbo.plannedActivity


   ---- Creation of temp table

   Create table #tempactivities 
   (
	employeeid int,
	activityname varchar(100),
	scheduledate date,
	startdate datetime,
	enddate datetime 
   )
   insert into #tempactivities(employeeid,activityname,scheduledate,startdate,enddate)
   select Empid,Activityname,schedule,startdate,enddate from externaldb.dbo.plannedActivity
   select * from #tempactivities 

   select employeeid,scheduledate, min(startdate),max(enddate)
   from #tempactivities
   group by employeeid,scheduledate

   insert into dbo.schedules(employeeid,scheduledate,starttime,enddate)
   select employeeid,scheduledate, min(startdate),max(enddate) from #tempactivities
group by employeeid,scheduledate 

select * from dbo.schedules

select*from dbo.scheduleactivities  

delete from #tempactivities where activityname = 'working'
 update #tempactivities set activityname ='1' where activityname = 'Break'
 update #tempactivities set activityname = '2' where activityname = 'Lunch' 
 update #tempactivities set activityname ='3' where activityname = 'Training ' 

 select * from #tempactivities   
 select * from dbo.schedules

 select s.scheduleid,t.startdate,t.enddate,t.activityname
 from #tempactivities t inner join
 dbo.schedules s
 on t.scheduledate = s.scheduledate and t.employeeid = s.employeeid


 insert into scheduleactivities(scheduleID,starttime,endtime,activitytypeid)
 select s.scheduleid,t.startdate,t.enddate,t.activityname
 from #tempactivities t 
 inner join 
 dbo.schedules s
 on t.scheduledate = s.scheduledate and t.employeeid = s.employeeid



 select * from dbo.scheduleactivities

 select  s.scheduleid,s.employeeid, sa.starttime,sa.endtime,att.activitytype,e.employeeid  from dbo.schedules s

left join dbo.scheduleactivities sa on s.scheduleid = sa.scheduleid 
inner join 
dbo.activitytype att on sa.activitytypeid = att.activitytypeid
inner join
dbo.schedules e on e.employeeid = s.scheduleid
select * from dbo.scheduleactivities
 

Create view dbo.e mpschedwithactivities 
as 
select  s.scheduleid,s.employeeid, sa.starttime,sa.endtime,att.activitytype,e.employeeid  from dbo.schedules s
left join dbo.scheduleactivities sa on s.scheduleid = sa.scheduleid 
inner join 
dbo.activitytype att on sa.activitytypeid = att.activitytypeid
inner join
dbo.schedules e on e.employeeid = s.scheduleid
select * from dbo.scheduleactivitiess