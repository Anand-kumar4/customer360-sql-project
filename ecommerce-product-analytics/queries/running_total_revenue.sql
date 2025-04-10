-- Calculate the running total of revenue day-by-day based on confirmed orders.

SELECT
    o.order_date,
    SUM(o.amount) as daily_revenue,
    SUM(SUM(o.amount)) OVER (ORDER BY o.order_date) as running_total_revenue
FROM
    PRODUCTANALYSIS.PUBLIC.ORDERS o
WHERE o.status = 'confirmed'
GROUP BY
    o.order_date
ORDER BY
    o.order_date;