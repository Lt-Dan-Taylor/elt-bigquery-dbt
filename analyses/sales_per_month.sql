SELECT 
    FORMAT_DATE('%Y-%m', order_date) AS month,
    SUM(quantity) AS products_sold,
    SUM(sales) AS total_sales

FROM
    {{ ref('orders') }}

GROUP BY month
ORDER BY month