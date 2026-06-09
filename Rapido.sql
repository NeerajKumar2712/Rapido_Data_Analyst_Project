create database Rapido

use Rapido

	select * from Rapido

-- Q1). Retrieve all successful Ride:

	CREATE VIEW Successful_Ride AS

				SELECT * FROM Rapido
				WHERE 
					  Ride = 'Completed';


		SELECT * FROM SUCCESSFUL_RIDE;


-- Q2). Find the average ride distance for each vehicle type:

	CREATE VIEW Avg_distance AS

				SELECT SERVICES,
					AVG(DISTANCE) AS AVG_DISTANCE 
				    FROM 
						RAPIDO
				GROUP BY 
						SERVICES;

					
		SELECT * FROM AVG_DISTANCE;


-- Q3). Get the total number of cancelled rides by customers:

	CREATE VIEW Cancelled_ride as

				SELECT COUNT(*) AS Cancelled_ride
									FROM Rapido
						WHERE
							  Ride_status = 'Cancelled';


		SELECT * FROM CANCELLED_RIDE;


-- Q4). Ratio of Successful Vs Cancelled Ride:

	CREATE VIEW Ride_status_ratio
			
				SELECT	SUM(CASE
								WHEN Ride_status = 'Completed' THEN 1 ELSE 0 
						END)/SUM(CASE
								WHEN Ride_status = 'Cancelled' THEN 1 ELSE 0 
						END)AS RATIO 
								FROM RAPIDO;


		SELECT * FROM RIDE_STATUS_RATIO;

	

-- Q5). List the top 5 Ride_id who booked the highest number of rides:
	
	CREATE VIEW 
				Highest_ride_booking AS
				
					SELECT TOP 5 Ride_id,
								COUNT (*) AS Total_ride
											FROM RAPIDO
					GROUP BY 
							Ride_id
					ORDER BY 
							Total_ride DESC;


		SELECT * FROM HIGHEST_RIDE_BOOKING;



-- Q6). Get the number of rides which was done by bike and auto :

	CREATE VIEW Ride_by_auto_bike AS 

					SELECT 
						   SERVICES, COUNT (*) AS Total_ride
							FROM RAPIDO
					WHERE 
						   SERVICES IN ('bike','auto')
					GROUP BY 
						   SERVICES;


		SELECT * FROM RIDE_BY_AUTO_BIKE;



-- Q7). Find the maximum and minimum Ride_Charge by Services:

	CREATE VIEW Max_min_charge AS
					
					SELECT 
						  SERVICES, MAX(ride_charge) AS Max_charge,
									MIN(ride_charge) AS Min_charge
						  FROM 
							  RAPIDO 
					GROUP BY 
							SERVICES;


		SELECT * FROM MAX_MIN_CHARGE;



-- Q8. Retrieve all rides where payment was made using GPay , misc_charge >40 and total_Fare is less then 200:

	CREATE VIEW GPay_MiscCharge_TotalFare AS
						
					SELECT * FROM RAPIDO
					WHERE 
						  payment_method = 'GPay'
					 AND 
						  misc_charge>40
					 AND 
						  total_fare<200;


		SELECT * FROM GPay_MiscCharge_TotalFare;



-- Q9). Find the average Ride_Charge and Total Rides in July 2024:

	CREATE VIEW July2024_Data AS
					SELECT 
						AVG(ride_charge) AS Avg_Charge, COUNT(*) AS Total_Rides
					FROM
						Rapido
					WHERE
						date LIKE ('%07-2024');


		SELECT * FROM July2024_Data;



-- Q10). List all Cancelled rides along with the destination which was cancelled by more then 1 time:

	CREATE VIEW Cancelled_ride_destination AS

					SELECT 
							destination, 
							COUNT(destination) AS Total_times 
						FROM 
							RAPIDO
					WHERE 
						  ride_status = 'cancelled'
					GROUP BY 
						  destination
					HAVING 
						  COUNT(destination) > 1;


		SELECT * FROM CANCELLED_RIDE_DESTINATION;



		# Retrieve All Answers :-

-- Q1). Retrieve all successful Ride:
SELECT * FROM SUCCESSFUL_RIDE;

-- Q2). Find the average ride distance for each vehicle type:
SELECT *  FROM AVG_DISTANCE; 

-- Q3). Get the total number of cancelled rides by customers:
SELECT * FROM CANCELLED_RIDE; 

-- Q4). Ratio of Successful Vs Cancelled Ride:
SELECT * FROM RIDE_STATUS_RATIO;

-- Q5). List the top 5 Ride_id who booked the highest number of rides:
SELECT * FROM HIGHEST_RIDE_BOOKING;

-- Q6). Get the number of rides which was done by bike and auto :
SELECT * FROM RIDE_BY_AUTO_BIKE;

-- Q7). Find the maximum and minimum Ride_Charge by Services:
SELECT * FROM MAX_MIN_CHARGE;

-- Q8. Retrieve all rides where payment was made using GPay , misc_charge >40 and total_Fare is less than 200:
SELECT * FROM GPAY_MISCCHARGE_TOTALFARE;

-- Q9). Find the average Ride_Charge and Total Rides in July 2024:
SELECT * FROM JULY2024_DATA;

-- Q10). List all Cancelled rides along with the destination which was cancelled by more than 1 time:
SELECT * FROM CANCELLED_RIDE_DESTINATION;