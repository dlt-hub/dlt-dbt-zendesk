/* Table: ticket_forms */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.raw_name,
    t.raw_display_name,
    t.end_user_visible,
    t.position,
    t.active,
    t.default,
    t.in_all_brands,
    t.url,
    t.name,
    t.display_name,
    t.created_at,
    t.updated_at,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_ticket_forms') }} as t