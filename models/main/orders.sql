{{ config(materialized='table', primary_key='order_id') }}


WITH
{{ select_ref(['orders', 'products_ordered', 'customers'], ['stg_orders', 'products_ordered', 'customers'] )}}

final AS (

    SELECT
        orders.id AS order_id,
        customers.customer_id,
        orders.order_date,
        orders.status,
        
        CASE
            WHEN status = 'Complete' THEN orders.delivered_date
            WHEN status = 'Shipped' THEN orders.shipped_date
            WHEN status = 'Processing' THEN orders.order_date
            WHEN status = 'Cancelled' THEN orders.order_date
            WHEN status = 'Returned' THEN orders.returned_date

            ELSE NULL
        END AS status_date,
        
        customers.name AS customer_name,
        customers.country,
        customers.address,
        products_ordered.product_name AS product,
        products_ordered.category,
        orders.num_of_item AS quantity,
        products_ordered.sale_price AS price_per_unit,
        products_ordered.sale_price * orders.num_of_item AS sales

    FROM orders

    LEFT JOIN 
        products_ordered 
        ON orders.id = products_ordered.order_id

    LEFT JOIN 
        customers
        ON orders.customer_id = customers.customer_id

)

SELECT *
FROM final
