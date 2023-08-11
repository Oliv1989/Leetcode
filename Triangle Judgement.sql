/*
Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.
*/

-- MS SQL solution
select
*,
case when x<0 or y<0 or z<0 then 'No'
when (x+y-z)*(x+z-y)*(y+z-x)>0 then 'Yes' else 'No' end as triangle
from Triangle