--First step is to create table

--Create table customer_detail
CREATE TABLE customer_detail (id VARCHAR(50) PRIMARY KEY,
                             registered_date DATE
);

-- Create table payment_detail
CREATE TABLE payment_detail (id INT PRIMARY KEY,
                             payment_method VARCHAR
);

-- Create table sku_detail
CREATE TABLE sku_detail ( id VARCHAR PRIMARY KEY,
                         sku_name VARCHAR,
						 base_price NUMERIC,
						 cogs NUMERIC,
						 category VARCHAR
);

-- Create table order_detail
CREATE TABLE order_detail (
    id VARCHAR(50),
    customer_id VARCHAR(50),
    order_date DATE,
    sku_id VARCHAR(50),
    price NUMERIC,
    qty_ordered INT,
    before_discount NUMERIC,
    discount_amount NUMERIC,
    after_discount NUMERIC,
    is_gross INT,
    is_valid INT,
    is_net INT,
    payment_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer_detail(id),
    FOREIGN KEY (payment_id) REFERENCES payment_detail(id),
    FOREIGN KEY (sku_id) REFERENCES sku_detail(id)
);

Select*
from customer_detail;

Select*
from order_detail



--1. Valid transactions that occured in both 2021 and 2022, and the discount amount for each month
SELECT EXTRACT(YEAR FROM order_date) AS year,
    TO_CHAR(order_date, 'Month') AS month,
    ROUND(SUM(discount_amount::numeric)) AS total_discount_amount
FROM 
    order_detail
WHERE 
    is_valid = 1
    AND EXTRACT(YEAR FROM order_date) IN (2021, 2022)
GROUP BY  
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
	month
ORDER BY 
    total_discount_amount DESC;

--2. Top 6 payment methods by valid transaction amount in 2021 and 2022
select payment_method, (Sum(order_detail.after_discount))AS transaction_amount
From order_detail
Inner Join payment_detail On order_detail.payment_id = payment_detail.id
Where order_detail.is_valid = 1
Group By payment_method, after_discount
Order By order_detail.after_discount Desc
Limit 5;

--3.Calculate the total dicount and valid total transation amount (after_dicount amount) in 2021 and 2022
Select Extract(year FROM order_date) AS year,
      Round(sum(order_detail.discount_amount)) AS total_discount,
	  Round(sum(order_detail.after_discount)) AS total_transaction_after_discount
From order_detail
Where is_valid = 1
Group By Extract(year from order_date)
Order By year;

--4. Compare total orders and the total transaction amount and also show the average transaction amount 
--for each month in 2021 and 2022
Select EXTRACT(YEAR FROM order_date) AS year,
    TO_CHAR(order_date, 'Month') AS month,
       Count(qty_ordered) AS total_order,
	   Round(Sum(after_discount)) AS total_transaction_amount,
	   Round(AVG(after_discount)) AS average_transaction_amount
From order_detail
Where is_net = 1
Group By year,
          TO_CHAR(order_date, 'Month')
Order By total_transaction_amount DESC;


--Products--
--5. Compare the completed (net) total and average transaction_amount of each category in 2021 to 2022.
--Transaction analysis by Category
Select category,
       ROUND(AVG(CASE WHEN EXTRACT(YEAR FROM order_date) = 2021 THEN after_discount END)) AS ave_transaction_amount_2021,
       ROUND(Avg(CASE WHEN EXTRACT(year FROM order_date) = 2022 THEN after_discount END)) AS ave_transaction_amount_2022,
       ROUND(Sum(CASE WHEN EXTRACT(year FROM order_date) = 2021 THEN after_discount END)) AS total_transaction_amount_2021,
       ROUND(Sum(CASE WHEN EXTRACT(year FROM order_date) = 2022 THEN after_discount END)) AS total_transaction_amount_2022
From order_detail
Inner Join sku_detail ON order_detail.sku_id = sku_detail.id
Where order_detail.is_net=1
Group By category
Order By total_transaction_amount_2022 DESC;

--6. In descending order, the products that were ordered, with focus on only products that customer has made payments.
Select sku_name, category,
       ROUND(Sum(CASE WHEN EXTRACT(year FROM order_date) = 2021 THEN qty_ordered END)) AS total_orders_2021,
       ROUND(Sum(CASE WHEN EXTRACT(year FROM order_date) = 2022 THEN qty_ordered END)) AS total_orders_2022,
	   ROUND(Sum(CASE WHEN EXTRACT(year FROM order_date) IN (2021, 2022) THEN qty_ordered END)) AS total_orders_2021_2022
From order_detail
Inner Join sku_detail ON order_detail.sku_id=sku_detail.id
Where order_detail.is_valid=1
Group By sku_name, category
Order By total_orders_2021_2022 DESC
;

--7. look into the total cost of goods by quantity, the profit made from each productfrom 2021 to 2022
Select*
from sku_detail

SELECT 
    sku_name, category,
    qty_ordered,
    cogs,
    after_discount,
    ROUND((after_discount - cogs)) AS profit
FROM order_detail
INNER JOIN sku_detail ON order_detail.sku_id = sku_detail.id
WHERE order_detail.is_net = 1
ORDER BY profit DESC;
