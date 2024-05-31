SELECT TOP 500 *
FROM hotel_reservation;

SELECT COUNT(*) AS Total_No_Reservation
FROM hotel_reservation;

SELECT TOP (1) MAX(type_of_meal_plan), COUNT(*)
FROM [hotel_reservation]
GROUP BY type_of_meal_plan;

SELECT ROUND(AVG(avg_price_per_room),2) AS Average_Price_Per_Room
FROM hotel_reservation
WHERE no_of_children >= 1;

SELECT COUNT(*) AS No_Of_Reservation
FROM hotel_reservation
WHERE YEAR(arrival_date) = 2018;

SELECT room_type_reserved, COUNT(*) AS No_Of_Reservation
FROM hotel_reservation
GROUP BY room_type_reserved
ORDER BY No_Of_Reservation DESC;

SELECT COUNT(*) AS No_Of_Weekend_Reservation
FROM hotel_reservation
WHERE no_of_weekend_nights >=1;

SELECT MAX(lead_time) AS Highest_Lead_Time, MIN(lead_time) AS Lowest_Lead_Time
FROM hotel_reservation;

SELECT market_segment_type, COUNT(*) AS No_Of_Reservation
FROM hotel_reservation
GROUP BY market_segment_type
ORDER BY No_Of_Reservation DESC;

SELECT COUNT(*) AS No_of_confirmed_reservation
FROM hotel_reservation
WHERE booking_status = 'Not_Canceled';

SELECT SUM(no_of_children) AS Total_Children, SUM(no_of_adults) AS Total_Adults
FROM hotel_reservation;


SELECT AVG(no_of_weekend_nights) AS Avg_Weekend_Night_For_Children
FROM hotel_reservation
WHERE no_of_children >= 1;

SELECT MONTH(arrival_date) AS Month, COUNT(*) AS No_Of_Reservation
FROM hotel_reservation
GROUP BY MONTH(arrival_date);

SELECT room_type_reserved, AVG(no_of_week_nights + no_of_weekend_nights) AS Avg_Total_Nights_Per_Room
FROM hotel_reservation
WHERE room_type_reserved IS NOT NULL --filter to cancel null room
GROUP BY room_type_reserved;

WITH rooms AS (
	SELECT room_type_reserved, COUNT(*) AS No_Of_Reservation, AVG(avg_price_per_room) AS Average_Price_Per_Room
	FROM hotel_reservation
	WHERE no_of_children >= 1
	GROUP BY room_type_reserved
)
SELECT room_type_reserved, Average_Price_Per_Room
FROM rooms
ORDER BY No_Of_Reservation DESC;

SELECT TOP (1) market_segment_type, AVG(avg_price_per_room) AS Average_Price_Per_Room
FROM hotel_reservation
GROUP BY market_segment_type
ORDER BY Average_Price_Per_Room DESC;