--Q1. Display all orders where Sales is greater than 30.
select 
OrderID,sales
from sales.orders
where sales > 30

--Q2. Display all orders where Quantity is equal to 2.
select
orderid
from sales.orders
where Quantity =2;

--Q3. Display all orders whose OrderStatus is 'Delivered'.
select
OrderID,OrderStatus
from sales.orders
where OrderStatus ='delivered'

--Q4. Display all orders placed by CustomerID = 3.
select
orderid
from sales.orders
where CustomerID = 3

--Q5. Display all orders where ShipAddress is NULL.
select
orderid
from sales.orders
where ShipAddress is NULL

--Q6. Display all orders where BillAddress is NOT NULL.
select
orderid
from sales.orders
where BillAddress is NOT NULL

--Q7. Display all orders where Sales is between 20 and 60.
select
orderid
from sales.orders
where Sales between 20 and 60
--Q8. Display all orders where ShipAddress starts with '1'.
select orderid
from sales.Orders
where ShipAddress like '1%'
--Q9.Display all orders where ShipAddress contains 'Court'
select orderid, ShipAddress
from sales.Orders
where ShipAddress like '%court%'
--Q10.Display all orders where BillAddress contains the word 'Book'
select orderID,BillAddress
from sales.orders
where BillAddress like '%book%'

--Q11.Display all orders where SalesPersonID is 3 or 5.
select
OrderID,SalesPersonID
from sales.orders
where SalesPersonID  in (3,5)


--Q12.display all orders where orderstatus ='shipped' or sales>50
select
OrderID
from sales.orders
where orderstatus ='shipped' or sales>50


--Q13. Display all orders where BillAddress is NULL and ShipAddress is NOT NULL.
select 
orderid
from sales.orders
where billaddress is null and ShipAddress is NOT NULL

--Q14. Display all orders where ProductID is NOT IN (101, 102).
select
orderid,ProductID
from sales.orders
where ProductID != 101 and ProductID != 102

