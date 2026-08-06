select
orderID,
creationTime,

getdate() yesterday, --to get actual/current date
--part extraction
day(creationtime) year,
month(creationtime) month,
year(creationtime) year,
--Datepart examples
datepart(week,creationtime) week,
datepart(quarter,creationtime) quarter,
datepart(hour,creationtime) hour,
datepart(minute,creationtime) minute,
datepart(second,creationtime) second,
--Datename Examples
datename(month,creationtime) month_name,
datename(weekday,creationtime) week_name,
datetrunc(minute,creationtime) minutes_trunc,
datetrunc(day,CreationTime) dat_truuc,
datetrunc(year,CreationTime)year_trunc,
EOMONTH(creationtime) ENDDATE_month,
cast(datetrunc(month,creationtime)as date) startofmonth

From Sales.orders




-- use of  datename condition
select 
Datename(month,creationtime) creation,
count(*) count
from sales.orders
group by Datename(month,creationtime)
 
 -- why do we use?
 --ques:-how many orders were placed in year
 select
 year(creationtime),
 count(*)
 from sales.Orders
 group by year(creationtime)
--ques:-how many orders were placed in name

 select
 datename(month,creationtime),
 count(*)
 from sales.Orders
 group by datename(month,CreationTime)

 --ques: show the order deation only oreder in feburary
 select *
 from sales.orders
 where month(orderdate)=2

--**********************************************************************************************************************************************************************************

select
orderID,
creationTime,
Format(creationtime,'MM-dd-yyyy') USA_format,

format(creationtime,'dd') dd,
format(creationtime,'ddd') ddd,
format(creationtime,'dddd')dddd,
format(creationtime,'MM') MM,
format(creationtime,'MMM') MMM,
format(creationtime,'MMMM')MMMM
from sales.orders

--ques: show CreationTime using the following format
 -- Day wed jan Q1 2025 12:34:56 PM
 select 
 OrderID,
creationtime,
'day' + Format(creationtime,'ddd MMM')+ ' Q'+ Datename(Quarter,creationtime)+ '  '+
Format(CreationTime,'yyyy hh:mm:ss tt') AS CustomeFormat
 from sales.orders

 -- CONVERT() function
 -- SYntax: convert (data type,value,style)

Select
--convert(int,'123') AS [string to INT convert],
 +--convert(date,'2025-08-20') As [string to Date convert],
 creationtime,
 convert(varchar,creationtime,32) AS[ USA std. style:32],-- 344 for the Europe,
 convert(date, creationtime) as [datetime to date convert]
 from sales.orders


 -- CAST() FUNCTION
 --SYNTAX: cast(value AS data_type
 select
 cast('123' as int),
 cast(123 AS varchar) [int to string],
 cast('2002-05-28' AS date),
  cast('2002-05-28' AS datetime) 
  creationtime,
  cast (creationtime as date)
  from sales.orders
 
 -- DATEADD() FUNCTION
 --SYNTAX : Dateadd(part,interval,date)
 select
 orderdate,
 dateadd(year,3,orderdate) orderdate2,
  dateadd(month,5,orderdate),
  datename(weekday,dateadd(year,3,orderdate))-- to find weekday after adding year or 
 from sales.orders
 
-- to find weekday for perticular date afer adding any month ,day and year 
 
 SELECT DATEADD(
           DAY, 10,
           DATEADD(
               MONTH, 3,
               DATEADD(YEAR, 2, orderdate)
           )
       ) AS NewDate,
       datename(weekday,DATEADD(
           DAY, 10,
           DATEADD(
               MONTH, 3,
               DATEADD(YEAR, 2, orderdate)
           )
       ) )
       from sales.orders

       --DATEDIFF() FUNCTION 
       --SYNTAX() : Datediff(part,start date,end date)
       --question: to find the age of employee
       select 
       EmployeeID,
       birthdate,
       datediff(year,birthdate,getdate())
       from sales.employees

       select

      month( orderdate),
     
       AVG(datediff(day,orderdate,shipdate) )as month_diff
       
       from sales.orders
       group by(month(orderdate))

-- ISDATE() FUNCTION
--SYNTAX: ISDATE(VALUE)
SELECT
isdate('2002-05-01')
