SELECT
    id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    age,
    gender,
    country,
    city,
    postal_code,
    street_address,
    traffic_source

FROM 
    {{ source('ecommerce_public', 'users') }}