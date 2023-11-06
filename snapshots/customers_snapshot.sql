{% snapshot customer_snapshot %}

{{
    config(
      target_database='ecommerce_snapshots',
      target_schema='customers_snapshot',
      unique_key='customer_id',

      strategy='timestamp',
      updated_at='latest_order_date',
    )
}}

SELECT * FROM `ecommerce_dbt.customers`

{% endsnapshot %}