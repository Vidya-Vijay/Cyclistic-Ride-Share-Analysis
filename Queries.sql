-- Count total rows in trips
SELECT COUNT(*) AS total_trips
FROM tripdata;

-- Count distinct members vs casual users
SELECT member_casual,
COUNT(*) AS count 
FROM tripdata
GROUP BY member_casual;

-- Check min and max trip duration in minutes
SELECT 
    MIN(DATEDIFF(SECOND, started_at, ended_at))/60 AS min_trip_in_min,
    MAX(DATEDIFF(SECOND, started_at, ended_at))/60 AS max_trip_in_min,
    AVG(DATEDIFF(SECOND, started_at, ended_at))/60 AS avg_trip_in_min
FROM tripdata;


-- Get distinct start station names count
SELECT COUNT(DISTINCT start_station_name) AS unique_start_stations FROM tripdata;

SELECT 
    member_casual,
    DATENAME(weekday, started_at) AS day_of_week,
    AVG(DATEDIFF(SECOND, started_at, ended_at))/60 AS avg_trip_in_minutes,
    COUNT(*) AS trip_count
FROM tripdata
GROUP BY member_casual, DATENAME(weekday, started_at)
ORDER BY member_casual, 
    CASE DATENAME(weekday, started_at)
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;