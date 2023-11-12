SELECT
    order_id as id,
    user_id AS customer_id,
    created_at AS order_date,
    shipped_at AS shipped_date,
    returned_at AS returned_date,
    delivered_at AS delivered_date,
    status,
    num_of_item

FROM 
    {{ source('ecommerce_public', 'orders') }}