SELECT 
    ProductName,
    CategoryID,
    UnitPrice,
    ROW_NUMBER() OVER (ORDER BY UnitPrice DESC) AS row_num,
    RANK() OVER (ORDER BY UnitPrice DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY UnitPrice DESC) AS dense_rank_num
FROM Products;

SELECT 
    ProductName,
    CategoryID,
    UnitPrice,
    ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS category_rank
FROM Products;

SELECT 
    OrderID,
    ProductID,
    UnitPrice,
    Quantity,
    (UnitPrice * Quantity) AS LineTotal,
    SUM(UnitPrice * Quantity) OVER (
        PARTITION BY OrderID 
        ORDER BY ProductID
    ) AS running_total
FROM "Order Details"
WHERE OrderID = 10248;