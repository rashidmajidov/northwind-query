--Ölkəsi Almanya olan müştərilər
SELECT *
FROM public.customers
WHERE country = 'Germany';

--Təcrübəsi 10 ildən çox olan işçilərin sıralaması ( title üzrə ASC)
ALTER TABLE employees 
ALTER COLUMN hiredate TYPE DATE 
USING (hiredate::date);

SELECT
	CONCAT(firstname,' ',lastname) AS name,
	title,
	EXTRACT(YEAR FROM AGE(hiredate)) AS Experience
FROM employees e 
WHERE
	EXTRACT(YEAR FROM AGE(hiredate)) > 10
ORDER BY
	title;

--Hər Produkt üzrə ortalama qiyməti
SELECT 
	productname,
	avg(unitprice) as avg_unitprice
FROM
	products p 
GROUP BY
	p.productname 
ORDER BY avg(unitprice);
	
--
SELECT *
FROM
	products p
ORDER BY 
	unitprice DESC
LIMIT 5;

--
SELECT 
	companyname,
	count(customerid) AS count_of_customers
FROM
	customers c 
GROUP BY
	c.companyname 
ORDER BY
	count(customerid) DESC
LIMIT 10;

