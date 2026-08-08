--Ranking Window Functions
-- ROW_number()
select 
 orderID,
 productID,
 sales,
 ROW_NUMBER() over(order BY sales desc) salesrank_row,
  Rank() over(order BY sales desc) rank_row,
   dense_rank() over(order BY sales desc) denserank
 from sales.Orders
 --TOP N ANALYSIS(ROW_NUMBER USE CASE)
  -- find the top highest sales for each product
  select *
  from(
  
  select
  orderID,
  productID,
  sales,
  row_number() over(partition by productID order by sales desc) highestsales
  from sales.Orders) t
  where highestsales = 1
  --BOTTOM N ANALYSIS(ROW_NUMBER USE CASE)
  -- find the lowest 2 customers based on thier total sales
  select*
  from(
  select
  customerID,
  sum(sales) totalsales,
  row_number() over (order by SUM(sales)) rankcustomers
  from sales.orders
  group by
  customerID)t
  where rankCustomers <=2
  -- QUALITY CHECKS: INDETIFY DUPLICATE(ROW_NUMBER USE CASE)
--Identify duplicate rows in table'order aschive'
-- and retur a clean result with out ant duplicates
select *
from(
select
row_number() over( partition by orderID order by creationtime desc)rn,
*
from sales.OrdersArchive
)t
where rn = 1

--NTILE()
SELECT
ORDERID,
SALES,
NTILE(4) over (order by sales desc) onebucket
from sales.Orders

--segment all orders into 3 categories: high ,medium and low sales.

select 
*,
case when sd = 1 then'high'
     when sd = 2then'medium'
     when sd = 3 then'low'
     end salessegment
from(
select 
orderID,
sales,
ntile(3) over(order by sales desc) sd
from sales.Orders)t
--percentage based ranking
-- CUM_DIST()
-- find the products that fall within the highest 40% of the prices
select
*,
CONCAT(distrank*100 ,'%') distrankperc
from(
select 
Product,
price,
cume_dist() over (order by price desc) distrank
from sales.Products)t
where distrank <= 0.4