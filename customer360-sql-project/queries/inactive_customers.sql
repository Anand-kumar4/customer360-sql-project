-- Find customers who:
-- 	•	Have not placed any orders
-- 	•	OR have not logged in recently (e.g., last login > 30 days ago)


SELECT 
    c.customer_id,
    c.name,
    c.signup_date,
    MAX(l.login_time) as last_login,
    COUNT(o.order_id) as total_orders
    

FROM
    customers c
LEFT JOIN
    ORDERS o
ON
    c.customer_id = o.customer_id
LEFT JOIN
    LOGINS l
ON
    c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.name,
    c.signup_date
HAVING 
    COUNT(o.order_id) = 0
OR 
    DATEDIFF('day',MAX(l.LOGIN_TIME),CURRENT_TIMESTAMP) > 30
;


