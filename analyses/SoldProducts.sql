SELECT 
    products_ordered.brand AS ProductBrand,
    products_ordered.product_name AS ProductName,
    ROUND(SUM(orders.sales), 2) AS TotalSales

FROM
    {{ ref('products_ordered') }}

LEFT JOIN
    {{ ref('orders') }}
    ON products_ordered.order_id = orders.order_id

GROUP BY ProductBrand, ProductName
ORDER BY TotalSales DESC