--Ortalamadan baha olan Məhsullar - Subquery
SELECT 
    productname, 
    unitprice
FROM products
WHERE unitprice > (SELECT AVG(unitprice) FROM products);

--CTE
WITH AvgPriceTable AS (
    SELECT AVG(UnitPrice) AS avg_price 
    FROM Products
)
SELECT 
    p.ProductName, 
    p.UnitPrice
FROM Products p, AvgPriceTable apt
WHERE p.unitprice > apt.avg_price;