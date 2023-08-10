/*
Table: Insurance

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+
pid is the primary key (column with unique values) for this table.
Each row of this table contains information about one policy where:
pid is the policyholder's policy ID.
tiv_2015 is the total investment value in 2015 and tiv_2016 is the total investment value in 2016.
lat is the latitude of the policy holder's city. It's guaranteed that lat is not NULL.
lon is the longitude of the policy holder's city. It's guaranteed that lon is not NULL.
 

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.
*/

--MS SQL solution
with final as (
select i1.pid
from Insurance i1
join Insurance i2 on i1.pid <> i2.pid and i1.tiv_2015 = i2.tiv_2015 and i1.pid not in (
select distinct i1.pid
from Insurance i1
join Insurance i2 on i1.pid <> i2.pid and i1.lat = i2.lat and i1.lon = i2.lon)
)
select round(sum(tiv_2016),2) as tiv_2016 from Insurance where pid in (select * from final)