/* Table: groups */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.is_public,
    t.name,
    t.description,
    t.default,
    t.deleted,
    t.created_at,
    t.updated_at,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_groups') }} as t