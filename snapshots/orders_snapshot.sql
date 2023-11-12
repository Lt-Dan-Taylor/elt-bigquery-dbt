{% snapshot orders_snapshot %}

{{
    config(
      target_database='dbt-project-404011',
      target_schema='ecommerce_snapshots',
      unique_key='order_id',

      strategy='check',
      updated_at='status',
      check_cols=['status']
    )
}}

SELECT * 
FROM 
   {{ source('ecommerce_dbt', 'orders') }}

{% endsnapshot %}