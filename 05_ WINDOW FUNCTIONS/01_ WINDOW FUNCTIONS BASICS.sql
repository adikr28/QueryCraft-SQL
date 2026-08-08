--PARTITION BY CLAUSE
--find total sales across all orders
-- Additionally provide details such order ID ,order date
select 
orderID,
orderdate,
ProductID,
sum(sales) over()totalsales,
sum(sales) over(partition by productID) salesByproduct,
sum(sales)over(partition  BY productID,orderstatus) salesBYproductandstatus
from sales.Orders

select * from sales.Orders
-- ORDER BY CLAUSE
select 
orderID,
orderdate,
sales,
RANk() over(order by sales desc)
from sales.Orders
--FRAME CLAUSE 
select 
orderID,
OrderStatus,
OrderDate,
sales,
sum(sales) over(partition by orderstatus order by orderdate rows between current row and 2 following) totalsales
from sales.Orders
-- PRECEDING
select 
orderID,
OrderStatus,
OrderDate,
sales,
sum(sales) over(partition by orderstatus order by orderdate 
rows between 2 preceding and current row) totalsales
from sales.Orders

-- RANK CUSTOMERS BASED ON THEIR TOTAL SALES
--(using group by and window function)
select 
customerID,
sum(sales) totalsales,
rank() over( order by sum(sales) desc) rankcustomer
from sales.Orders
Group BY customerID