-- Query #3: Customers With Only Cancelled Orders

-- 🧠 Why it’s important:

-- This helps spot:
-- 	•	Failed conversions
-- 	•	Cart/checkout issues
-- 	•	Refund-heavy users


-- Find customers whose only orders (if any) are in 'cancelled' status.


SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) as total_orders,
    COUNT(CASE WHEN o.status = 'cancelled' THEN 1 END) as cancelled_orders
FROM
    CUSTOMER360.PUBLIC.CUSTOMERS c
LEFT JOIN
    CUSTOMER360.PUBLIC.ORDERS o
ON
    c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name
HAVING
    total_orders = cancelled_orders;