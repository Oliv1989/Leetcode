/*
Table Activities:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
 

Write a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

The result format is in the following example.
*/

--MS SQL solution
with cte_distinct as
(
select distinct sell_date, product
from activities
)
select sell_date,
count(product) as num_sold,
string_agg(product, ',') WITHIN GROUP (ORDER BY product) as products
from cte_distinct
group by sell_date
order by sell_date
