WITH CommonProducts AS (
    SELECT Product_ID
    FROM pricing_fact
    WHERE Availability = 'Yes'
    GROUP BY Product_ID
    HAVING COUNT(DISTINCT Platform) = 3
)

SELECT 
    f.Platform,
    COUNT(f.product_id) AS matching_items_found,
    ROUND(AVG(
        CAST(f.[discounted_price] AS REAL) + 
        CAST(f.[handling_fee] AS REAL) + 
        CAST(f.[delivery_fee] AS REAL)
    ), 2) AS true_avg_basket_cost
FROM pricing_fact f
JOIN CommonProducts cp ON f.product_id = cp.product_id
GROUP BY f.Platform
ORDER BY true_avg_basket_cost ASC;
