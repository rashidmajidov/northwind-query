--1.LEFT JOIN: product və category cədvəlləri birləşdirildi
SELECT
	p.productname,
	p.categoryid,
	c.categoryname,
	p.unitprice,
	c.description
FROM products p
LEFT JOIN categories c
ON p.categoryid = c.categoryid;
	

--2.INNER JOIN customers və orders cədvəlləri birləşdirildi
SELECT
	c.companyname,
	o.orderdate
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid;

--3.INNER JOIN products və suppliers cədvəlləri birləşdirildi
SELECT 
	p.supplierid,
	p.productname,
	s.companyname 
FROM products p 
INNER JOIN suppliers s 
ON s.supplierid = p.supplierid;

--4.Orders <-> Customers; <-> Employee INNER JOIN
SELECT 
    c.CompanyName,
    o.OrderDate,
    e.FirstName,
    e.LastName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID;

--5.Order Details <-> Order; <-> Products INNER JOIN
SELECT 
    od.OrderID,
    p.ProductName,
    od.UnitPrice,
    od.Quantity
FROM "Order Details" od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID;