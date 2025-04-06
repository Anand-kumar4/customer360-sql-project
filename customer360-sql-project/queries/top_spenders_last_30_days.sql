-- 🧾 Query #4: Top Spenders (Last 30 Days)

-- ✅ Goal:

-- Get customers who’ve spent the most in the last 30 days, ranked by total spend.

SELECT
    c.customer_id,
    c.name,
    SUM(o.amount) as total_spent_last_30_days
FROM
    CUSTOMER360.PUBLIC.CUSTOMERS c
LEFT JOIN
    CUSTOMER360.PUBLIC.ORDERS o
ON
    c.customer_id = o.customer_id
WHERE
    order_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY
    c.customer_id,
    c.name
ORDER BY 
    total_spent_last_30_days DESC
LIMIT 10;
    