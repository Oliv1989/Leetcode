/*
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The query result format is in the following example.
*/

--MS SQL solution
with frst as (
select DISTINCT
product_id,
FIRST_VALUE(new_price) over (partition by product_id order by change_date DESC) as price
from Products
where change_date <= cast('2019-08-16' as date)
),
scnd as (
select DISTINCT
product_id,
10 as price
from Products
where change_date > cast('2019-08-16' as date)
and product_id not in (select product_id from frst)
)
select * from frst union select * from scnd