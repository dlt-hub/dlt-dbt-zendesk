/* Table: brands */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'brands' */
    url,
    id,
    name,
    brand_url,
    subdomain,
    has_help_center,
    help_center_state,
    active,
    "default",
    is_deleted,
    signature_template,
    created_at,
    updated_at,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'brands') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )