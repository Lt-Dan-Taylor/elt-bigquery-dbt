SELECT
    id,
    order_id,
    product_id,
    sale_price

FROM 
    {{ source('ecommerce_public', 'order_items') }}