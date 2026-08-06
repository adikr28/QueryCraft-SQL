--Find the average scores of the coustomers
select 
CustomerID,
score,
avg(score) over () avg_score,
avg(coalesce(score,0)) over () avg_new
from sales.customers
--combine first and last name of the customers and
-- add bonus 10 to the  score
select 
firstName,
lastName,
firstname + ' ' + coalesce(lastName, '') fullname,
score,
coalesce(score,0)+ 10 As bonus_score
from sales.customers
-- sort the customers from lowest to highest scores with nulls appearing last
select
customerID,
score
From sales.customers
order by case when score is NULL then 1 else 0 END
-- NULL IF 
-- FIND the sales price for each order by dividing sales by queantity
select 
orderID,
sales,
quantity,
sales/NULLIF(quantity,0) as price
from sales.orders
-- IS NULL
--list all deatils for customers who have not placed any orders
select
c.*,
o.orderID
from sales.customers c
left join sales.orders o
ON c.customerID = o.CustomerID
where o.CustomerID is null
