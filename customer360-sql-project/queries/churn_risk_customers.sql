-- ✅ Goal:

-- Identify customers who are at risk of churn — based on inactivity.

-- ⸻

-- 📊 Common Risk Conditions:
-- 	•	Customer is active (is_active = TRUE)
-- 	•	But has not logged in or ordered in the last 60 days

-- This simulates:

-- “They haven’t churned yet, but we’re losing them.”

SELECT
    c.customer_id,
    c.name,
    DATEDIFF('day', MAX(l.login_time), CURRENT_DATE) AS days_since_last_login,
    DATEDIFF('day', MAX(o.order_date), CURRENT_DATE) AS days_since_last_order,
    CASE 
        WHEN MAX(l.login_time) IS NULL THEN 'Never logged in'
        WHEN MAX(o.order_date) IS NULL THEN 'Never ordered'
        WHEN DATEDIFF('day', MAX(l.login_time), CURRENT_DATE) > 60 
            OR DATEDIFF('day', MAX(o.order_date), CURRENT_DATE) > 60 THEN 'Inactive 60+ days'
        ELSE NULL
    END AS risk_reason
    
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
    c.name
HAVING
    risk_reason IS NOT NULL;

