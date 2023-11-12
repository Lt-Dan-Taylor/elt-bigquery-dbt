SELECT 
    country,
    SUM(quantity) AS products_sold,
    SUM(sales) AS total_sales

FROM
    {{ ref('orders') }}

GROUP BY country
ORDER BY country ASC