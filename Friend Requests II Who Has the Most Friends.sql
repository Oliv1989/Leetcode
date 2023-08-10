/*
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.
*/

--MS SQL solution
with final as (
select
requester_id as id,
count(DISTINCT accepter_id) as num
from RequestAccepted
group by 
requester_id
),
final2 as (
select
accepter_id as id,
count(DISTINCT requester_id) as num
from RequestAccepted
group by 
accepter_id
),
final3 as (
select * from final
union all
select * from final2
),
final4 as (
select
id,
sum(num) as num
from final3
group by
id
)
select *
from final4
where num = (select max(num) from final4)