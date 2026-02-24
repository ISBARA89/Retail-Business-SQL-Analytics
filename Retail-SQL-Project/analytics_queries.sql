-- Total Revenue Per Customer
SELECT 
c.name,
SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.name
ORDER BY total_revenue DESC;

-- Best Selling Product
SELECT 
p.product_name,
SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Order Status Analysis (Operations Team Query)
SELECT 
status,
COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Revenue by City (Management Insight)
SELECT 
c.city,
SUM(p.price * oi.quantity) AS city_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.city
ORDER BY city_revenue DESC

-- Rank Customers by Revenue
SELECT 
c.name,
SUM(p.price * oi.quantity) AS total_revenue,
RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS revenue_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.name;

-- Running Revenue OverTime
SELECT 
DATE_TRUNC('month', order_date) AS month,
SUM(p.price * oi.quantity) AS monthly_revenue,
SUM(SUM(p.price * oi.quantity)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS running_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY month
ORDER BY month;

-- Customer Purchase Frequency
SELECT 
c.name,
COUNT(o.order_id) AS total_orders,
ROW_NUMBER() OVER (ORDER BY COUNT(o.order_id) DESC) AS activity_rank
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name; 
