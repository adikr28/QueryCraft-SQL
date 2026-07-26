Select  
c.firstname,
c.lastname,
o.OrderDate,
o.OrderID
from sales.customers c
join sales.Orders o
On c.customerID = o.CustomerID
select * from sales.Orders
select * from sales.customers
--Find the customer who spent the most money.
SELECT TOP 1
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.Sales) AS TotalSales
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY TotalSales DESC;
--Find average sales for each customer.
select
c.CustomerID,
avg(o.sales) as avg_sales
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
 group by c.customerID
 order  by avg_sales 
 --Find customers who purchased more than 20 items.

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.Quantity) AS Total_Items
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
HAVING SUM(o.Quantity) > 20;
 --Display the last order date for every customer
SELECT
    c.CustomerID,
    c.FirstName,
 coalesce(lastname,'') as LASTNAME,
 
    MAX(o.OrderDate) AS Last_Order_Date,
     datename(weekday, MAX(o.OrderDate)) as weed_day
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName

