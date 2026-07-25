--SELECT 
--Q1. Display all records from the Orders table.
 Select * 
 from sales.orders
--Q2. Display only OrderID, CustomerID, and Sales.
select
 OrderID, CustomerID, Sales
 from sales.orders
--Q3.Display unique OrderStatus values.
Select distinct
orderStatus
from sales.Orders
--Q4.Display ProductID and Quantity with aliases Product and TotalQuantity.
 Select
 productID as product,
 quantity as TotalQuantity
 from sales.orders
--Q5.Display the first 20 rows.
select TOP(5) *
from sales.orders
      
--Q6.Display OrderID and CreationTime.
Select
OrderID,
CreationTime
from sales.orders
--Q7.Display all orders where ShipAddress is shown.
select 
orderid,
ShipAddress
from sales.orders
where ShipAddress is not  null;
--Q8.Display BillAddress and ShipAddress.
select 
billaddress,shipaddress
from sales.orders
--Q9.Display OrderDate and ShipDate.
 select
 orderdate,shipdate
 from sales.orders
  --Q10.Display every column except Creati
select
orderID,
  [ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      orderdate2
      from sales.orders




 




