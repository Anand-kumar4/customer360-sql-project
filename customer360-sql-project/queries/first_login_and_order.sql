-- 🎯 Query #5: First Login + First Order

-- ✅ Goal:

-- For each customer, get:
-- 	•	First login date
-- 	•	First order date
-- 	•	Days between signup and first order

SELECT
    c.customer_id,
    c.name,
    c.signup_date,
    MIN(l.login_time) as first_login,
    MIN(o.order_date) as first_order,
    DATEDIFF('day',c.signup_date, first_order) as days_to_first_order
FROM
    CUSTOMER360.PUBLIC.CUSTOMERS c
LEFT JOIN
    CUSTOMER360.PUBLIC.ORDERS o
ON
    c.customer_id = o.customer_id
LEFT JOIN
    CUSTOMER360.PUBLIC.LOGINS l
ON 
    c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.name,
    c.signup_date;
    