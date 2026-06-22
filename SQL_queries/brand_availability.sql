SELECT 
    p.Brand,
    MAX(CASE WHEN f.Platform = 'OZi' AND f.Availability = 'Yes' THEN 1 ELSE 0 END) AS on_ozi,
    MAX(CASE WHEN f.Platform = 'firstcry' AND f.Availability = 'Yes' THEN 1 ELSE 0 END) AS on_firstcry,
    MAX(CASE WHEN f.Platform = 'blinkit' AND f.Availability = 'Yes' THEN 1 ELSE 0 END) AS on_blinkit
FROM product_dim p
JOIN pricing_fact f ON p.Product_ID = f.Product_ID
GROUP BY p.Brand
ORDER BY on_ozi DESC, on_firstcry DESC;
