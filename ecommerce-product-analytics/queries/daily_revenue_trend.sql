-- Daily Revenue Trend (Time-Series Analysis)

-- ⸻

-- 🎯 Problem Statement:

-- “Calculate the total revenue generated for each day (based on confirmed orders) and show the trend.”


SELECT
    order_date,
    SUM(amount) as total_revenue
FROM 
    PRODUCTANALYSIS.PUBLIC.ORDERS
WHERE
    status = 'confirmed'
GROUP BY
    order_date
ORDER BY
    ORDER_DATE ASC;