/* Table: greeting_categories */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_greeting_categories') }} as t