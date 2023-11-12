SELECT 
    products.brand AS ProductBrand,
    products.product_name AS ProductName,
    SUM(orders.sales) AS TotalSales

FROM
    {{ source('ecommerce_dbt', 'products_ordered') }} AS products_ordered

LEFT JOIN
    {{ source('ecommerce_dbt', 'orders') }} AS orders
    ON products_ordered.order_id = orders.order_id

GROUP BY ProductBrand, ProductName
ORDER BY TotalSales