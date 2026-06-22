SELECT 
    f.Platform,
    ROUND(AVG(CAST(f.Delivery_Time_mi AS REAL)), 2) AS avg_delivery_time_mins,
    MIN(CAST(f.Delivery_Time_mi AS REAL)) AS fastest_delivery,
    MAX(CAST(f.Delivery_Time_mi AS REAL)) AS slowest_delivery,
    COUNT(CASE WHEN f.Availability = 'Yes' THEN 1 END) AS products_measured
FROM pricing_fact f
WHERE f.Platform IN ('OZi', 'blinkit')
AND f.Availability = 'Yes'
AND f.Delivery_Time_mi IS NOT NULL
AND f.Delivery_Time_mi != 'NA'
GROUP BY f.Platform
ORDER BY avg_delivery_time_mins ASC;
