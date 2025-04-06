--Query #1: Customer Summary View
---- Summary of customer activity: total orders, spend, last login, open tickets
SELECT 
	c.customer_id,
	c.name,
	COUNT(o.order_id) as total_orders,
	SUM(o.amount) as total_spent,
	MAX(l.login_time) as last_login,
	COUNT(CASE WHEN s.status = 'open' THEN 1 ELSE NULL END) AS open_tickets
FROM 
	customers c
LEFT JOIN
	orders o
ON 
	c.customer_id = o.customer_id
LEFT JOIN
	logins l
ON
	c.customer_id = l.customer_id
LEFT JOIN
	support_tickets s
ON
	c.customer_id = s.customer_id
GROUP BY
	c.customer_id,
	c.name;
