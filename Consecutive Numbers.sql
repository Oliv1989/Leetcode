/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.
*/

-- MS SQL solution
select DISTINCT
l1.num as ConsecutiveNums
from Logs l1
left join Logs l2 on l1.id = l2.id-1
left join Logs l3 on l1.id = l3.id-2
where l1.num = l2.num and l1.num = l3.num