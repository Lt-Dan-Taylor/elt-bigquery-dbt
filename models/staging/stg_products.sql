SELECT 
    id,
    name AS product_name,
    brand,
    category,
    cost,
    retail_price,
    department,
    distribution_center_id AS warehouse_id

FROM 
    {{ source('ecommerce_public', 'products') }}
