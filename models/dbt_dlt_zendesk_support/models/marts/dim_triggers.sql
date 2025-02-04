/* Table: triggers */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.title,
    t.active,
    t.updated_at,
    t.created_at,
    t.default,
    t.position,
    t.raw_title,
    t.category_id,
    t._dlt_load_id,
    t._dlt_id,
    t.description,
FROM  {{ ref('stg_triggers') }} as t