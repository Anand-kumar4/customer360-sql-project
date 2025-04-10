-- For each customer, show their orders along with the amount of their next order (if available).

-- Query to get each order of customer along with their next order amount using LEAD() Window Function

SELECT
    o.user_id,
    o.order_id,
    o.order_date,
    o.amount,
    LEAD(amount, 1) OVER (PARTITION BY o.user_id ORDER BY o.order_date) AS next_order_amount
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
ORDER BY
    o.user_id,
    o.order_date;