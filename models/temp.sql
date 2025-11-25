{{
    config(
        materialized='table'
    )
}}

SELECT
    CAST(NULL AS STRING) AS ID,
    CAST(NULL AS INT) AS test_val
LIMIT 0