-- Find customers who have placed more orders than the average number of orders per customer.

WITH customer_order_summary AS (
SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) as total_orders
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
INNER JOIN
    PRODUCTANALYSIS.PUBLIC.USERS u
ON  o.user_id = u.user_id
GROUP BY
    u.user_id,
    u.name
)
SELECT 
    user_id,
    name,
    total_orders    
FROM 
    customer_order_summary
WHERE
    total_orders > (
    SELECT 
        AVG(total_orders)
    FROM
        customer_order_summary
    )
ORDER BY
    total_orders DESC;
