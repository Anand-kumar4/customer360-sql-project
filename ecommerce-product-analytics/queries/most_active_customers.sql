-- Most Active Customers Ranking (using Window Functions)

-- ⸻

-- 🎯 Problem Statement:

-- “Find the top N customers who have placed the highest number of orders.
-- If two customers have the same order count, show them with the same rank.”

SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders,
    RANK() OVER(ORDER BY COUNT(o.order_id) DESC) AS rank
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
JOIN
    PRODUCTANALYSIS.PUBLIC.USERS u
ON o.user_id = u.user_id
GROUP BY
    u.user_id,
    u.name
ORDER BY
    rank;