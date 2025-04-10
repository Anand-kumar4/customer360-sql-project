-- Find duplicate orders in the ORDERS table — where the same user has placed multiple orders for the same product on the same date.

-- Query to find duplicate orders based on user_id, product_id, and order_date using ROW_NUMBER()

SELECT
    o.user_id,
    o.product_id,
    o.order_date,
    o.order_id,
    ROW_NUMBER() OVER (PARTITION BY o.user_id, o.product_id, o.order_date ORDER BY o.order_id) as ROW_NUM
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
QUALIFY
    ROW_NUM > 1
;
    