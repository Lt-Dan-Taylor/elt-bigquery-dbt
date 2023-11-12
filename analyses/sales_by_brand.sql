SELECT 
    products_ordered.brand AS brand,
    COUNT(products_ordered.product_name) AS product_count,
    ROUND(AVG(products_ordered.sale_price), 2) AS avg_product_price,
    SUM(orders.quantity) AS products_sold,
    ROUND(SUM(orders.sales), 2) AS total_sales

FROM
    {{ ref('products_ordered') }} AS products_ordered

LEFT JOIN
    {{ ref('orders') }} AS orders
    ON products_ordered.order_id = orders.order_id
    
GROUP BY brand
ORDER BY total_sales DESC