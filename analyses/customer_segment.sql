WITH segment AS (

    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(sales) AS total_spent

    FROM
        {{ ref('orders') }}

    GROUP BY customer_id

)
SELECT
    CASE 
        WHEN total_orders >=4 THEN 'Premium Costumers'
        WHEN total_orders >=2 THEN 'Standard Customers'
        ELSE 'Basic Customers'
    END AS customer_segmentation,
    COUNT(DISTINCT customer_id) AS number_of_customer,
    AVG(total_spent) AS avg_purchase_amount

FROM
    segment

GROUP BY customer_segmentation
ORDER BY number_of_customer DESC