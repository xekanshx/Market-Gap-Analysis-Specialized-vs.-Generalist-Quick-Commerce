SELECT 
    p.Category,
    f.Platform,
    SUM(CASE WHEN f.Availability = 'Yes' THEN 1 ELSE 0 END) AS items_in_stock,
    COUNT(f.Product_ID) AS total_items_checked,
    ROUND(SUM(CASE WHEN f.Availability = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(f.Product_ID), 2) AS fill_rate_pct
FROM product_dim p
JOIN pricing_fact f ON p.Product_ID = f.Product_ID
GROUP BY p.Category, f.Platform
ORDER BY p.Category ASC, fill_rate_pct DESC;
