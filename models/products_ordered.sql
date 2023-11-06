WITH
{{ select_ref(['order_items', 'products', 'warehouses'], ['stg_order_items', 'stg_products', 'stg_warehouses']) }}

final AS (

    SELECT
        order_items.id AS product_ordered_id,
        order_items.product_id,
        order_items.order_id,
        products.category,
        products.product_name,
        products.brand,
        products.retail_price,
        order_items.sale_price,
        warehouses.warehouse

    FROM order_items

    LEFT JOIN 
        products 
        ON order_items.product_id = products.id

    LEFT JOIN
        warehouses
        ON products.warehouse_id = warehouses.id

)

SELECT *
FROM final
