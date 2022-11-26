# 习题3.1
CREATE VIEW  ViewPractice5_1
AS
SELECT
	product_name,
	sale_price,
	regist_date
FROM
	product
WHERE
	sale_price >= 1000
AND
	regist_date = '2009-09-20';


# 习题3.2
INSERT INTO  ViewPractice5_1 VALUES('刀子',300,'2009-11-02')
插入时会报错
视图插入数据时，原表也会插入数据。而原表数据插入时不满足约束条件，所以会报错


# 习题3.3
SELECT
	product_id,
	product_name,
	product_type,
	sale_price,
	(SELECT AVG(sale_price)  FROM product) AS sale_price_all
FROM
	product;


# 习题3.4
CREATE VIEW AvgPriceByType
AS
SELECT
	product_id,
	product_name,
	producr.product_type,
	sale_price,
	(SELECT
		AVG(sale_price)
	FROM
		product p2
	WHERE 
		p1.product_type = p2.product_type
	GROUP BY
		p1.product_type) AS avg_sale_price
FROM
	product p1;


# 习题3.5
不一定 当运算符为<=>时，结果可能出现null以外的值


# 习题3.7
SELECT 
	SUM(CASE WHEN sale_price <= 1000 THEN 1 ELSE 0 END) AS low_price,
	SUM(CASE WHEN sale_price BETWEEN 1001 AND 3000 THEN 1 ELSE 0 END) AS mid_price,
	SUM(CASE WHEN sale_price >= 3001 THEN 1 ELSE 0 END) AS high_price
FROM
	product;
