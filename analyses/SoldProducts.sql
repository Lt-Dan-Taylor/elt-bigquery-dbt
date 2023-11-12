SELECT 
    products_ordered.brand AS ProductBrand,
    products_ordered.product_name AS ProductName,
    ROUND(SUM(orders.sales), 2) AS TotalSales

FROM
    {{ source('ecommerce_dbt', 'products_ordered') }} AS products_ordered

LEFT JOIN
    {{ source('ecommerce_dbt', 'orders') }} AS orders
    ON products_ordered.order_id = orders.order_id

GROUP BY ProductBrand, ProductName
ORDER BY TotalSales DESC