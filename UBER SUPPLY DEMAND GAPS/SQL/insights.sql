-- SQL/insights.sql
SELECT *
FROM 'cleaned_data.csv'
LIMIT 10;

-- 1. Total Requests by Status
SELECT Status, COUNT(*) AS Total_Requests
FROM 'cleaned_data.csv'
GROUP BY Status
ORDER BY Total_Requests DESC;

-- 2. Trips Completion and Completion Rate
SELECT 
COUNT(*) AS Total_Requests,
COUNT(*) FILTER (WHERE Status = 'Trip Completed') AS Trip_Completed,
ROUND(COUNT(*) FILTER (WHERE Status = 'Trip Completed') * 100.0 / COUNT(*), 2) AS Trip_Completion_Rercent
FROM 'cleaned_data.csv';

-- 3. Pickup Point Distribution by Day Category
SELECT 
  "Day Category",
  COUNT(*) FILTER (WHERE "Pickup point" = 'Airport') AS Airport,
  COUNT(*) FILTER (WHERE "Pickup point" = 'City') AS City
FROM 'cleaned_data.csv'
GROUP BY "Day Category"
ORDER BY 
  CASE 
    WHEN "Day Category" = 'Early Morning' THEN 1
    WHEN "Day Category" = 'Morning' THEN 2
    WHEN "Day Category" = 'Afternoon' THEN 3
    WHEN "Day Category" = 'Evening' THEN 4
    WHEN "Day Category" = 'Night' THEN 5
    WHEN "Day Category" = 'Late Night' THEN 6
    ELSE 7
  END;

-- 4. Most Common Pickup Point for Each Status
SELECT "Pickup point", Status, COUNT(*) AS Total
FROM 'cleaned_data.csv'
GROUP BY "Pickup point", Status
ORDER BY "Pickup point";

-- 5. Time Slots with Most Supply Gaps
SELECT "Day Category",
       COUNT(*) FILTER (WHERE Status = 'No Cars Available') AS Gaps
FROM 'cleaned_data.csv'
GROUP BY "Day Category"
ORDER BY gaps DESC;

-- 6. Trip Count by Pickup Point and Distance
SELECT 
    "Pickup point",
    Distance,
    COUNT(*) AS Trip_Count
FROM 'cleaned_data.csv'
WHERE Status = 'Trip Completed'
GROUP BY "Pickup point", Distance
ORDER BY "Pickup point", Trip_Count DESC;

-- 7. Top 10 Drivers by Trip Completion at Pickup Points
SELECT 
  "Driver id",
  COUNT(*) FILTER (WHERE "Pickup point" = 'Airport') AS Airport,
  COUNT(*) FILTER (WHERE "Pickup point" = 'City') AS City
FROM 'cleaned_data.csv'
WHERE Status = 'Trip Completed'
  AND "Driver id" IS NOT NULL
GROUP BY "Driver id"
ORDER BY "Airport" DESC, "City" DESC
LIMIT 10;

-- 8. Trip Completion and Completion Rate by Pickup Point
SELECT "Pickup point",
       COUNT(*) FILTER (WHERE Status = 'Trip Completed') AS Completed_Trips,
       ROUND(COUNT(*) FILTER (WHERE Status = 'Trip Completed') * 100.0 / COUNT(*), 2) AS Completion_Rate
FROM 'cleaned_data.csv'
GROUP BY "Pickup point";

-- 9. Distance Distribution by Pickup Point
SELECT 
  "Pickup point",
  COUNT(*) FILTER (WHERE Distance = 'Far') AS Far,
  COUNT(*) FILTER (WHERE Distance = 'Medium') AS Medium,
  COUNT(*) FILTER (WHERE Distance = 'Near') AS Near
FROM 'cleaned_data.csv'
WHERE Status = 'Trip Completed'
GROUP BY "Pickup point";

-- 10. Request to Drop Time Delay Distribution
SELECT 
  "Day Category",
  ROUND(AVG(EXTRACT('minute' FROM CAST("Travel Time" AS TIME))), 2) AS Avg_Time_Minutes
FROM 'cleaned_data.csv'
WHERE "Travel Time" IS NOT NULL
GROUP BY "Day Category"
ORDER BY Avg_Time_Minutes DESC;