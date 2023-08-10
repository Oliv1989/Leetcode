/*
Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.
*/

--MS SQL solution
with final as (
select 
visited_on,
sum(amount) as amount
from Customer
group by
visited_on
),
final2 as (
select *,
LAG(amount,1) OVER (ORDER BY visited_on) as minus_1,
LAG(amount,2) OVER (ORDER BY visited_on) as minus_2,
LAG(amount,3) OVER (ORDER BY visited_on) as minus_3,
LAG(amount,4) OVER (ORDER BY visited_on) as minus_4,
LAG(amount,5) OVER (ORDER BY visited_on) as minus_5,
LAG(amount,6) OVER (ORDER BY visited_on) as minus_6
from final
),
final3 as (
select
visited_on,
sum(amount+minus_1+minus_2+minus_3+minus_4+minus_5+minus_6) as amount,
round(sum(amount+minus_1+minus_2+minus_3+minus_4+minus_5+minus_6)*1.0/7,2) as average_amount
from final2
group by
visited_on
)
select * from final3 where visited_on >= DATEADD(day,6,(select min(visited_on) from final3))
order by 1