-- 🎯 Query #7: Customer Funnel Drop-Off Report

-- ✅ Goal:

-- Track how customers progress through key funnel stages, and see where they drop off.

-- ⸻

-- 📊 Funnel Stages:
-- 	1.	Signed up
-- 	2.	Logged in at least once
-- 	3.	Placed an order
-- 	4.	Logged a support ticket

SELECT
  c.customer_id,
  c.name,
  TRUE AS signed_up,
  
  CASE 
    WHEN EXISTS (
      SELECT 1 FROM CUSTOMER360.PUBLIC.LOGINS l 
      WHERE l.customer_id = c.customer_id
    ) THEN TRUE ELSE FALSE 
  END AS logged_in,

  CASE 
    WHEN EXISTS (
      SELECT 1 FROM CUSTOMER360.PUBLIC.ORDERS o 
      WHERE o.customer_id = c.customer_id
    ) THEN TRUE ELSE FALSE 
  END AS ordered,

  CASE 
    WHEN EXISTS (
      SELECT 1 FROM CUSTOMER360.PUBLIC.SUPPORT_TICKETS s 
      WHERE s.customer_id = c.customer_id
    ) THEN TRUE ELSE FALSE 
  END AS contacted_support

FROM
  CUSTOMER360.PUBLIC.CUSTOMERS c;