--ORDER BY
--Q1.Display all orders sorted by Sales in ascending order.
select
OrderID,Sales
from sales.Orders
order by sales asc
--Q2. Display all orders sorted by Sales in descending order.
select
OrderID,Sales
from sales.Orders
order by sales desc
--Q3.Display OrderID, Quantity, and Sales sorted by Quantity (highest first). If two orders have the same quantity, sort them by Sales (highest first)
select
orderid,quantity,sales
from sales.Orders
order by Quantity desc,Sales desc

-- Q4.Display all orders sorted by:
--OrderStatus in ascending order.
--Within the same status, sort by Sales in descending order.
select orderid,orderstatus,sales
from sales.orders
order by OrderStatus asc, sales desc

--Q5.Display all orders sorted by OrderDate, showing the latest orders first.
select orderdate
from sales.orders
order by orderdate desc



