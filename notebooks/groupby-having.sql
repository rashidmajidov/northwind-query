--1.Ssenari: Hər bir kateqoriya üzrə neçə ədəd məhsul olduğunu və 
--ortalama qiymətini tapaq.
 --Amma yalnız məhsul sayı 5-dən çox olan kateqoriyaları göstərək.
SELECT
	c.categoryname,
	count(c.categoryid) AS produkt_sayi,
	avg(p.unitprice) AS avg_qiymet
FROM categories c 
INNER JOIN products p 
ON c.categoryid = p.categoryid 
GROUP BY c.categoryname
HAVING count(c.categoryid)  > 5;

--
ALTER TABLE orders 
ALTER COLUMN orderdate TYPE DATE 
USING (orderdate::date);

SELECT 
	EXTRACT(MONTH FROM o.orderdate) AS ay,
	COUNT(o.orderid) AS ayliq_satis_sayi,
	SUM(ord.unitprice * ord.quantity) AS ayliq_umumi_satis	
FROM orders o 
INNER JOIN "Order Details" ord
ON o.orderid = ord.orderid
WHERE EXTRACT(YEAR FROM o.orderdate) = 2016
GROUP BY EXTRACT(MONTH FROM o.orderdate)
ORDER BY EXTRACT(MONTH FROM o.orderdate);
