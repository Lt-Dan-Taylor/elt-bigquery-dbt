SELECT 
    country AS Country,
    SUM(quantity) AS ProductsSold,
    SUM(sales) AS TotalSales

FROM
    {{ source('ecommerce_dbt', 'orders') }}

GROUP BY Country
ORDER BY Country ASC

