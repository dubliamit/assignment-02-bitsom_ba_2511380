--## Q1: Customers from Mumbai with total order value
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(p.unit_price * oi.quantity) AS total_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;

--## Q2: Top 3 products by total quantity sold
SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

--## Q3: Sales reps with number of unique customers handled
SELECT 
    sr.sales_rep_id,
    sr.sales_rep_name,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Sales_Reps sr
LEFT JOIN Orders o ON sr.sales_rep_id = o.sales_rep_id
GROUP BY sr.sales_rep_id, sr.sales_rep_name;

--## Q4: Orders with total value > 10,000 (sorted desc)
SELECT 
    o.order_id,
    SUM(p.unit_price * oi.quantity) AS total_order_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_order_value > 10000
ORDER BY total_order_value DESC;

--## Q5: Products never ordered
SELECT 
    p.product_id,
    p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
