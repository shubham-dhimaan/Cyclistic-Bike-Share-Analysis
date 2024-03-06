-- Q1. What are the number_of_rides taken and average_ride_length across the 12-month period?

SELECT 

EXTRACT(MONTH FROM start_time) as month,
TO_CHAR(start_time, 'Month') as month_name,
COUNT(*) as number_of_rides,
DATE_TRUNC('second', AVG(ride_length)) as average_ride_time -- removes milliseconds from time-interval value

FROM bikes_rental_2018

GROUP BY 1,2
ORDER BY 1


-- Q1a. What is the difference in ride time in customers and subscribers?

SELECT

user_type,
AVG(ride_length) as average_ride_length

FROM bikes_rental_2018

GROUP BY user_type




--  Q2. How many bikes do each usertype rent every month on average?


SELECT

user_type, 

ROUND(AVG(count),0) as avg_bikes_used_per_month

FROM (

SELECT

user_type,
EXTRACT(MONTH FROM start_time) as month,
COUNT(*) as count

FROM bikes_rental_2018

GROUP BY 1,2)

GROUP BY 1



-- Q2a. How many bikes does each userype use in total?

SELECT

user_type,
COUNT(*) as total_bikes_used

FROM bikes_rental_2018

GROUP BY user_type




-- Q3. How many bikes do each usertype rent every month?

SELECT 

user_type,
EXTRACT(MONTH FROM start_time ) as months,
COUNT(*)


FROM bikes_rental_2018

GROUP BY user_type, months



-- Q4. What is ride count and average ride time for each gender? Do male and female riders ride bike differently?

SELECT

member_gender, avg(ride_length) as average_ride_time,
COUNT(*) as no_of_riders

FROM bikes_rental_2018

GROUP BY member_gender



-- Q5. What is ride count and average ride time for each gender and also for each user type?

SELECT

user_type,
member_gender,
COUNT(*) as no_of_riders,
AVG(ride_length) as  average_ride_time

FROM bikes_rental_2018

GROUP BY member_gender, user_type
ORDER BY user_type

-- Ans: No Pattern



-- Q6. How many people take more than a day to return the bikes? 

SELECT

user_type,
COUNT(*)

FROM bikes_rental_2018

WHERE EXTRACT (DAY FROM ride_length) >= 1
GROUP BY 1


-- Q6a. which usertype is more incliined to keeping the bike for more than one day?

-- Ans: No and not enough data to give the answer



-- Q7. How many users take more than 12 hour to retrun the bike?

SELECT

user_type,
COUNT(*)

FROM bikes_rental_2018

WHERE EXTRACT (HOUR FROM ride_length) >= 12
GROUP BY 1



-- Q8. how many times a bikes is being reused by per bike id? 

-- Ans: On average, a member is using one bike 4.26 times more than a customer 

SELECT

user_type,
ROUND(AVG(times_used), 2)

FROM  (
	
SELECT

user_type,
bike_id,
COUNT(*) as times_used

FROM bikes_rental_2018

GROUP BY user_type, bike_id
) as t

GROUP BY 1




-- Q9. How does ride time vary per month?

SELECT

EXTRACT(MONTH FROM start_time) as month_number,
TO_CHAR(start_time, 'Month') as month_name,
AVG(ride_length) as avergae_ride_time

FROM bikes_rental_2018

GROUP BY 1,2
ORDER BY 1




-- Q10. What is weekly ride time?

SELECT 

weekday,
AVG(ride_length) as average_ride_time

FROM bikes_rental_2018

GROUP BY 1




-- Q11. How many user drop bike at the same station vs a different station?


SELECT

dropped_at_station,
COUNT(*) as total_users

FROM bikes_rental_2018

GROUP BY 1



--Q12. What is the ride count and average ride time in different seasons?


SELECT

CASE

 WHEN EXTRACT(MONTH FROM start_time) IN (3,4,5) THEN 'Spring'
 WHEN EXTRACT(MONTH FROM start_time) IN (6,7,8) THEN 'Summer'
 WHEN EXTRACT(MONTH FROM start_time) IN (9,10,11) THEN 'Autum'
 WHEN EXTRACT(MONTH FROM start_time) IN (12,1,2) THEN 'Winter'
   
END AS season_name,

COUNT(*) AS total_users,
AVG(ride_length) AS average_ride_time

FROM bikes_rental_2018

GROUP BY season_name




--Q13. What is the ride count and average ride time in different seasons for each user_type?

SELECT

user_type,

CASE

 WHEN EXTRACT(MONTH FROM start_time) IN (3,4,5) THEN 'Spring'
 WHEN EXTRACT(MONTH FROM start_time) IN (6,7,8) THEN 'Summer'
 WHEN EXTRACT(MONTH FROM start_time) IN (9,10,11) THEN 'Autum'
 WHEN EXTRACT(MONTH FROM start_time) IN (12,1,2) THEN 'Winter'
   
END AS season_name,

COUNT(*) AS total_users,
AVG(ride_length) AS average_ride_time

FROM bikes_rental_2018

GROUP BY user_type, season_name
ORDER BY user_type, total_users DESC





-- Q14. What is the rider count for each age?

SELECT

rider_age,
COUNT(*) AS total_users

FROM bikes_rental_2018

WHERE rider_age  <= 80 AND rider_age > 20
GROUP BY rider_age 




-- Q15. Divide the age into suitable categories. How many riders are there in each age category?

SELECT

CASE 

 WHEN rider_age BETWEEN 20 AND 29 THEN 'Young Adults (20-29)'
 WHEN rider_age BETWEEN 30 AND 39 THEN 'Adults (30-39)'
 WHEN rider_age BETWEEN 40 AND 49 THEN 'Middle-Aged (40-49)'
 WHEN rider_age BETWEEN 50 AND 59 THEN 'Late Middle Aged (50-59)'
 WHEN rider_age >= 60 THEN 'Seniors (60+)'
 
END AS age_group,
COUNT(*) as total_riders

FROM bikes_rental_2018

WHERE rider_age  <= 80 AND rider_age > 20

GROUP BY age_group
ORDER BY total_riders DESC



-- Q16. Divide the age into suitable categories. How does ride time vary across different age categories?


SELECT

CASE 

 WHEN rider_age BETWEEN 20 AND 29 THEN 'Young Adults (20-29)'
 WHEN rider_age BETWEEN 30 AND 39 THEN 'Adults (30-39)'
 WHEN rider_age BETWEEN 40 AND 49 THEN 'Middle-Aged (40-49)'
 WHEN rider_age BETWEEN 50 AND 59 THEN 'Late Middle Aged (50-59)'
 WHEN rider_age >= 60 THEN 'Seniors (60+)'
 
END AS age_group,
AVG (ride_length) AS average_ride_time

FROM bikes_rental_2018

WHERE rider_age  <= 80 AND rider_age > 20

GROUP BY age_group



-- Q17. How does ride count vary across different age categories between customer and subscriber?

-- Ans. Not enough data to answer. There are lots of null values in customer data base when it comes to gender and birth year.

SELECT

user_type,

CASE 

 WHEN rider_age BETWEEN 20 AND 29 THEN 'Young Adults (20-29)'
 WHEN rider_age BETWEEN 30 AND 39 THEN 'Adults (30-39)'
 WHEN rider_age BETWEEN 40 AND 49 THEN 'Middle-Aged (40-49)'
 WHEN rider_age BETWEEN 50 AND 59 THEN 'Late Middle Aged (50-59)'
 WHEN rider_age >= 60 THEN 'Seniors (60+)'
 
END AS age_group,
COUNT(*)

FROM bikes_rental_2018

WHERE rider_age  <= 80 AND rider_age > 20

GROUP BY user_type, age_group
ORDER BY user_type, 3 DESC


-- Q18. How many customer and subscribers drop bikes at the same station and different station respectivly?

SELECT

user_type,
dropped_at_station,
COUNT(*)

FROM bikes_rental_2018

GROUP BY 1,2
ORDER BY 1,2


