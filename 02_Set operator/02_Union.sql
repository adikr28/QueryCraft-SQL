-- LEFT anti join ( Return Row from left that has No match in right)
/* select*
from  orders as o
left  join customers as c
on o.customer_id= c */
--SET operators (union)
Select
FirstName,
Lastname
from sales.customers
UNION all
Select 
FirstName,
lastname
from sales.employees
select *
from sales.customers
