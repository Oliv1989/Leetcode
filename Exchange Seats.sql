/*
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.
*/

--MS SQL solution
select
id,
coalesce(case when id % 2 <> 0 then LEAD(s.student) OVER (ORDER BY id) else LAG(s.student) OVER (ORDER BY id) end, x.Student) as student
from Seat s, (select Student from Seat where id = (select max(id) from Seat)) x