-- For each customer, show their orders along with the amount of their previous order

SELECT
    o.user_id,
    o.order_id,
    o.order_date,
    o.amount,
    LAG(o.amount, 1) OVER (PARTITION BY o.user_id ORDER BY o.order_date)
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
ORDER BY 
    o.user_id, o.order_date;
;
