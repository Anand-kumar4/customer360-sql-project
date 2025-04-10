-- Top Selling Products

-- 🎯 Goal:

-- List products by:
-- 	•	Total units sold (sum of quantity from orders)
-- 	•	Total revenue (sum of amount from orders)
-- 	•	Order count (number of times product was ordered)


SELECT * FROM PRODUCTANALYSIS.PUBLIC.ORDERS;

SELECT * FROM PRODUCTANALYSIS.PUBLIC.PRODUCTS;

SELECT
    p.product_id,
    p.name as product_name,
    SUM(o.quantity) as total_quantity_sold,
    SUM(o.amount) as total_revenue,
    COUNT(o.order_id) as order_count
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
INNER JOIN
    PRODUCTANALYSIS.PUBLIC.PRODUCTS p
ON o.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name
ORDER BY
    total_quantity_sold DESC;