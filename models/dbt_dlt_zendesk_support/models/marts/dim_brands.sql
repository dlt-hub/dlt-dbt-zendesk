/* Table: brands */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.name,
    t.brand_url,
    t.subdomain,
    t.has_help_center,
    t.help_center_state,
    t.active,
    t.default,
    t.is_deleted,
    t.signature_template,
    t.created_at,
    t.updated_at,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_brands') }} as t