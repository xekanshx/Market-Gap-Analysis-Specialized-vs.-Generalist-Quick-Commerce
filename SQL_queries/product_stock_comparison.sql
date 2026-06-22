SELECT 
    p.Category,
    SUM(CASE WHEN f.Platform = 'OZi' AND f.Availability = 'Yes' THEN 1 ELSE 0 END) AS ozi_available,
    SUM(CASE WHEN f.Platform = 'firstcry' AND f.Availability = 'Yes' THEN 1 ELSE 0 END) AS firstcry_available,
    SUM(CASE WHEN f.Platform = 'blinkit' AND f.Availability = 'Yes' THEN 1 ELSE 0 END) AS blinkit_available
FROM pricing_fact f
JOIN product_dim p ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY p.Category;
