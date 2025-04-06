-- 🎯 Goal: Funnel Stage Breakdown

-- For each user, identify whether they’ve:
-- 	1.	Viewed a product
-- 	2.	Added to cart
-- 	3.	Checked out
-- 	4.	Placed an order (confirmed)

SELECT
    u.user_id,
    u.name,
    CASE 
        WHEN EXISTS (
            SELECT 1 FROM PRODUCTANALYSIS.PUBLIC.EVENTS e
            WHERE e.user_id = u.user_id AND e.event_type = 'view'
        ) THEN 1 ELSE 0 
    END AS viewed,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM PRODUCTANALYSIS.PUBLIC.ORDERS o
            WHERE o.user_id = u.user_id AND o.status = 'confirmed'
        ) THEN 1 ELSE 0
    END AS ordered,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM PRODUCTANALYSIS.PUBLIC.EVENTS e
            WHERE e.user_id = u.user_id AND e.event_type = 'add_to_cart'
        ) THEN 1 ELSE 0
    END AS added_to_cart,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM PRODUCTANALYSIS.PUBLIC.events e
            WHERE e.user_id = u.user_id AND e.event_type = 'checkout'
        ) THEN 1 ELSE 0
    END AS checkout
FROM 
    PRODUCTANALYSIS.PUBLIC.USERS u
