# E-Commerce-Sales-Analysis
Project Overview

This project involves analyzing transactional data from an e-commerce platform using PostgreSQL. The dataset comprises information on orders, products, customers, and payment methods, enabling deep insight into sales performance, customer behavior, discount trends, and product profitability across 2021 and 2022.

Dataset Used

•	order_detail:
o	id: Unique number of the order / order ID.

o	customer_id: Unique number of the customer.

o	order_date: Date when the transaction was made.

o	sku_id: Unique number of the product.

o	price: Price listed on the price tag.

o	qty_ordered: Quantity of items purchased by the customer.

o	before_discount: Total price value of the product (price * qty_ordered).

o	discount_amount: Total discount amount of the product.

o	after_discount: Total price value of the product after discount.

o	is_gross: Indicates whether the customer has not paid the order.

o	is_valid: Indicates whether the customer has made the payment.

o	is_net: Indicates whether the transaction is completed.

o	payment_id: Unique number of the payment method.

•	sku_detail:

o	id: Unique number of the product.

o	sku_name: Name of the product.

o	base_price: Price of the item listed on the price tag.

o	cogs: Cost of goods sold.

o	category: Product category.

•	customer_detail:

o	id: Unique number of the customer.

o	registered_date: Date when the customer started registering as a member.

•	payment_detail:

o	id: Unique number of the payment method.

o	payment_method: Payment method used.

Creating a Database and Tables for Datasets
  ![image](https://github.com/user-attachments/assets/19c024d5-97d3-4d5f-9b3d-8263619b8f86)

![image](https://github.com/user-attachments/assets/dc3ad94c-ee53-41f8-81a7-f4db219860f0)

Tasks / Data Exploration

How did the total discount amount perform for each month in 2021 and 2022?
![image](https://github.com/user-attachments/assets/6c3032fe-79cd-43fd-8018-d8db62ead3c4)
 

What are the top 5 payment methods by valid transaction amount in 2021 and 2022?
 ![image](https://github.com/user-attachments/assets/d1275b72-88e8-4585-a9e7-6ffb56e62ac7)


Calculate the total discount and total transaction amount (after_dicount amount) in 2021 and 2022?
 ![image](https://github.com/user-attachments/assets/2fc0cb19-c0c2-4851-b9bb-9443ee1f6937)


Compare total orders and the total transaction amount and also show the average transaction amount for each month in 2021 and 2022?
 ![image](https://github.com/user-attachments/assets/24c62272-7c0d-46b9-b8ee-96f2ea753970)

Compare the completed (net) total and average transaction amount of each category in 2021 to 2022?
 ![image](https://github.com/user-attachments/assets/551d86f6-98c7-43d9-b792-c7d9a852854c)

Find the top 10 products and categories that were ordered most in 2021 and 2022, with focus on only products that customer has made complete payments?
 ![image](https://github.com/user-attachments/assets/462c5705-eea5-4701-b9f1-04d402330819)


look into the total cost of goods by quantity, the profit made from each product from 2021 to 2022?
 ![image](https://github.com/user-attachments/assets/f8910d9f-152c-4df2-9b5f-e7cb524492f5)

Insights and Observation

1.	Monthly Discount Performance in 2021 and 2022:
The highest discount occurred in November 2021 with a total amount of 7,178,397 and the next in line was on December 2022 with the amount of 1,658,148. The first 10 months in descending order was mostly in the year 2022 (up to 8 out of 10).
Recommendation: Evaluate the ROI of increased discounts in 2022—especially during Q4—to ensure they drive profitability. Consider targeted promotions rather than broad discounts.
2.	Top Payment Method in 2021 and 2022:
Jazz voucher is the most used payment method and the transactions made with is up to 518,752,000. Followed by cash at doorstep, then Mc blite, Pay axis, and finance settlement.
Recommendation: Prioritize integration and user experience optimization for Jazz Voucher. Explore incentive partnerships with alternative platforms to diversify payment method usage..
3.	Yearly performance of total discount and total transaction:
The year 2021 had higher discount of 8,008,122 than 2022 which was 7,891,420 which led to lower transaction amount received in 2021 (1,322,726,913) than in 2022 which had a higher total transaction amount after discount which was 2,344,848,413.
Recommendation: Maintain discount levels while optimizing pricing and product availability to maximize conversions and average order value.
4.	Average Transaction Amount by Months:
The highest average transaction amount by month occurred in the September 2022 with a sum of 13,433,680 with a total of 537,347,204 transaction amount made in the same month. Also, there was significant increase in the average transactions from 2021to 2022.
Recommendation Further investigate high-ticket purchases in low-order months. This can uncover B2B or bulk purchasing trends worth expanding.
5.  Orders vs. Transaction Value Correlation:
There are months with high transaction amount despite fewer orders, indicating high-value transactions. The month of September 2022 had the highest total transaction with 40 orders, while the second highest month April 2022 with 143 orders.
Recommendation: Segment customer tiers and offer tailored incentives to replicate high-value behaviors. Consider premium bundle promotions.
6.	Top category by Revenue:
Mobile and Tablets had the highest transaction amount in 2022 with a total of 667,686,372.
Appliances had the highest transaction amount in 2021 with a total of 110,569,959, it had a strong good performance in both years. While, Books had the lowest transaction amount in both 2021 and 2022.
Recommendation: Maintain focus on high-performing categories but optimize marketing or bundle offers to boost underperforming ones (e.g., books).
7.	Most Ordered Products:
IDROID_BALRX7-Gold which is under the mobile an tablets category had the highest order of 1000 in 2022. While RB_Dettol Germ Busting Kit led 2021 with 200 orders.
Recommendation: Increase visibility and stock of top performers during high-traffic periods. Introduce variants or accessories to capitalize further.
8.	Profitability Analysis:
Products under the Mobile & Tablets category not only topped in sales but also in profit margins, with IDROID_BALRX7-Gold as the standout product. 
Recommendation: Conduct regular COGS reviews on top SKUs. Expand profitable product lines and consider upsell strategies.

Summary

This SQL-based transactional analysis reveals that 2022 outperformed 2021 in revenue despite similar discount levels. High-value purchases, top-performing mobile products, and effective payment methods contributed significantly to profitability.

For continuous improvement:

•	Double down on profitable SKUs

•	Optimize discount strategy

•	Analyze customer segments for personalized offers

•	Invest in better-performing payment integrations
