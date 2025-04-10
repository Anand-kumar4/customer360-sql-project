-- Find the products that have never been ordered even once.
---- Query to find products that have never been ordered (anti-join using subquery)

SELECT
    p.product_id,
    p.name as product_name
FROM 
    PRODUCTANALYSIS.PUBLIC.PRODUCTS p
WHERE p.product_id NOT IN
    (
    SELECT DISTINCT o.product_id
    FROM PRODUCTANALYSIS.PUBLIC.ORDERS o
    );


