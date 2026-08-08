   -- WINDOW AGGREGATE FUNTIONS 
   -- COUNT()
   --FIND  the toatal number of orders
   -- find the total number of orders for each customers
   select 
   
    customerID,
   count(*) over()rders,
   count(*) over(partition by customerID)orderBYCustomers
   from sales.Orders
   
   --check whether the table orders contains any duplicate rows
   select 
   orderID ,
   count(*) over (partition by orderID) checkPK
   from sales.orders
  
  /*select 
   orderID ,
   count(*) over (partition by orderID) checkPK
   from sales.OrdersArchive*/

-- SUM()
-- FIND the total sales across all orders
-- and the total sales for each product
 select 
orderID,
orderdate,
ProductID,
sum(sales) over()totalsales,
sum(sales) over(partition by productID) salesByproduct
from sales.Orders

--Find the percentage contribution of each product'sales to the total sales
select 
orderID,
productid,
sales,
sum(sales) over () totalsales,
round(cast (sales as float)/ sum(sales) over() * 100,2)percentagoftotal
from sales.orders
-- AVG()
--find the average scores of customers(HANDLING NULL)
select
customerID,
coalesce(lastname, 'n/a'),
coalesce(score,0) customerscore,
avg(coalesce(score,0)) over() avgscorewithoutsales
from sales.Customers
-- FIND ALL THE ORDER WHERE SALES ARE HIGHER THAN THE AVERAGE SALES ACCROSS ALL ORDERS
SELECT
*
FROM(
Select 
orderid,
productid,
sales,
avg(sales) over() avgsales
from sales.orders)t
where sales>avgsales

--MIN() AND MAX()

SELECT 
orderID,
orderdate,
productID,
sales,
max(sales) over() highestsales,
min(sales) over()lowestsales,
max(sales) over(partition by productID),
min(sales)over (partition by productID)
from sales.orders
--show the employess who have the highest salary 
select
*
from(
select 
*,
max(salary) over()highestSalary
from sales.Employees)t
where Salary = highestSalary
-- find the deviation  of each sales from the minimum and maximum sales amounts
SELECT 
orderID,
orderdate,
productID,
sales,
max(sales) over() highestsales,
min(sales) over()lowestsales,
sales-min(sales) over()deviationfrommin,
max(sales) over()- sales deviationformmax
from sales.orders

-- calculate the moving average of sales for each product over time  and includeing only next order
select 
orderID,
productID,
orderdate,
sales,
avg(sales) over (partition by productID) AVGBYProduct,
avg(sales)over (partition by productID order BY Orderdate
Rows between current row and 1 following) movingavg 
from sales.orders