-- Rank products based on total quantity sold using both RANK() and DENSE_RANK() window functions.

SELECT
    product_id,
    product_name,
    total_quantity_sold,
    RANK() OVER (ORDER BY total_quantity_sold DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY total_quantity_sold DESC) AS dense_rank
FROM (
    SELECT
        p.product_id,
        p.name AS product_name,
        SUM(o.quantity) AS total_quantity_sold
    FROM 
        PRODUCTANALYSIS.PUBLIC.ORDERS o
    JOIN
        PRODUCTANALYSIS.PUBLIC.PRODUCTS p
    ON o.product_id = p.product_id
    GROUP BY
        p.product_id,
        p.name
) AS product_sales
ORDER BY
    rank;