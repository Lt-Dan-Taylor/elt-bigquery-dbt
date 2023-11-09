{{ config(materialized='table', primary_key='customer_id') }}

WITH
{{ select_ref(['customers', 'orders'], ['stg_customers', 'stg_orders']) }}

customer_orders AS (

    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS latest_order_date,
        COUNT(id) AS number_of_orders

    FROM orders
    GROUP BY customer_id

),

final AS (

    SELECT
        customers.id AS customer_id,
        customers.full_name AS name,
        customers.gender,
        customers.age,
        CONCAT(customers.street_address, ', ', customers.city, ' ', customers.postal_code) AS address,
        customers.country,
        {{ date_formatter('customer_orders.first_order_date') }} AS first_order_date,
        {{ date_formatter('customer_orders.latest_order_date') }} AS latest_order_date,
        COALESCE(customer_orders.number_of_orders, 0) AS number_of_orders

    FROM customers

    LEFT JOIN
        customer_orders
        ON customers.id = customer_orders.customer_id
        
)

SELECT *
FROM final
