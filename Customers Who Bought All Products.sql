/*
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

The result format is in the following example.
*/

-- MS SQL solution
select
customer_id
from (
select
c.customer_id,
count(distinct p.product_key) as products
from Product p
join Customer c on p.product_key = c.product_key
group by
c.customer_id
) x
where products = (select count(product_key) from Product)