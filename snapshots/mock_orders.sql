{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
        target_database='fish',
        target_schema=new_schema,
        unique_key='order_id',

        strategy='timestamp',
        updated_at='updated_at',
    )
}}

select * from fish.{{target.schema + '_snapshot'}}.mock_orders

{% endsnapshot %}