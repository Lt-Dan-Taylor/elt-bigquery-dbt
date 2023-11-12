SELECT
    id,
    name AS warehouse,
    latitude,
    longitude

FROM 
    {{ source('ecommerce_public', 'distribution_centers') }}