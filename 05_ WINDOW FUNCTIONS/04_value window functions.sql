select 
orderID,
orderdate,
sales,
orderstatus,
lead(sales) over(order by orderID) aasas,
lag(sales) over(order by orderID)
from sales.Orders
--Analyze the month-over-month performance by finding the percentage chage
--in sales between th ecurrent and previous months
select
*,
currentmonthsales-previous_month as mom,
ROUND(CAST((CurrentMonthSales-Previous_Month) AS FLOAT)/Previous_Month *100,1) AS MoM_Perc
from (
select
month(orderdate) asad,
sum(sales) currentmonthsales,

lag(sum(Sales))over(order by month(orderdate))previous_month
From sales.Orders
group by
month(orderdate)
)t



