/*
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
 

Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.
*/

--MS SQL solution
WITH CTE AS (
	
	SELECT
		*,
		COUNT([user_id]) OVER(PARTITION BY [user_id]) CountUser,
		SUM(IIF(YEAR(created_at) = 2020 AND MONTH(created_at) = 2, rating, NULL)) OVER(PARTITION BY movie_id)
		/ 
		CAST(COUNT(IIF(YEAR(created_at) = 2020 AND MONTH(created_at) = 2, rating, NULL)) OVER(PARTITION BY movie_id) AS DECIMAL(10,2)) SumRate
	FROM
		MovieRating
	)
,CTE1 AS (
	SELECT 
		[user_id] = ( SELECT [name] FROM Users WHERE Users.[user_id] = CTE.[user_id])
	FROM
		CTE
	WHERE
		CountUser = ( SELECT MAX( CountUser) FROM CTE )
	)
,CTE2 AS (
	SELECT
		movie_id = ( SELECT title FROM Movies WHERE Movies.movie_id = CTE.movie_id)
	FROM
		CTE
	WHERE
		SumRate = ( SELECT MAX( SumRate ) FROM CTE )
)
SELECT
	MIN([user_id]) results
FROM	
	CTE1
UNION ALL
SELECT
	MIN([movie_id])
FROM
	CTE2