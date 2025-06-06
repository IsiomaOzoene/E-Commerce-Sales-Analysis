--Table for visualization--
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    TO_CHAR(order_date, 'Month') AS month,
    sku_name, category, payment_method, qty_ordered, cogs, discount_amount, after_discount,
    ROUND((after_discount - cogs)) AS profit
FROM order_detail
INNER JOIN sku_detail ON order_detail.sku_id = sku_detail.id
Inner Join payment_detail On order_detail.payment_id = payment_detail.id
WHERE order_detail.is_net = 1
ORDER BY profit DESC;