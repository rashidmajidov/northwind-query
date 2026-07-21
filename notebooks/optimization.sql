-- Indeks yaradılması
CREATE INDEX idx_orders_orderdate ON orders(orderdate);

-- Artıq bu sorğu Full Table Scan əvəzinə yaradılmış indeksdən istifadə edəcək:
SELECT * 
FROM orders 
WHERE orderdate = '1997-01-01';

SELECT 
    o.orderid,
    o.orderdate,
    (SELECT SUM(ord.unitprice * ord.quantity) 
     FROM "Order Details" ord 
     WHERE ord.orderid = o.orderid) AS total_amount
FROM orders o;

SELECT 
    o.orderid,
    o.orderdate,
    SUM(ord.unitprice * ord.quantity) AS total_amount
FROM orders o
INNER JOIN "Order Details" ord ON o.orderid = ord.orderid
GROUP BY o.orderid, o.orderdate;