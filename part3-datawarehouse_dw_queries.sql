## Q1: Total sales revenue by product category for each month
SELECT 
    d.year,
    d.month,
    p.category,
    SUM(f.total_amount) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.year, d.month, p.category
ORDER BY d.year, d.month, total_revenue DESC;

## Q2: Top 2 performing stores by total revenue
SELECT *
FROM (
    SELECT 
        s.store_name,
        SUM(f.total_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(f.total_amount) DESC) AS rnk
    FROM fact_sales f
    JOIN dim_store s ON f.store_id = s.store_id
    GROUP BY s.store_name
) t
WHERE rnk <= 2;

## Q3: Month-over-Month (MoM) sales trend
SELECT 
    d.year,
    d.month,
    SUM(f.total_amount) AS monthly_sales,
    LAG(SUM(f.total_amount)) OVER (ORDER BY d.year, d.month) AS prev_month_sales,
    SUM(f.total_amount) - LAG(SUM(f.total_amount)) OVER (ORDER BY d.year, d.month) AS growth
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

