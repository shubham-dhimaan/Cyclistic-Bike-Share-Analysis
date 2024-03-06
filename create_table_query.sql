CREATE TABLE bikes_rental_2018(

rental_id	INT PRIMARY KEY,
start_time	TIMESTAMP,
end_time	TIMESTAMP,
bike_id	    INT,
rental_duration	INT,
start_station_id INT,
start_station_name VARCHAR(300),
end_station_id	INT,
end_station_name VARCHAR(300),
user_type VARCHAR(50),
member_gender VARCHAR(10),
member_birth_year INT,
ride_length	INTERVAL,
dropped_at_station VARCHAR(20),
weekday	VARCHAR(20),
rider_age INT
	
)