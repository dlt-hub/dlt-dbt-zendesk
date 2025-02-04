/* Table: triggers */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'triggers' */
    url,
    id,
    title,
    active,
    updated_at,
    created_at,
    default,
    position,
    raw_title,
    category_id,
    _dlt_load_id,
    _dlt_id,
    description,
FROM {{ source('raw_data', 'triggers') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )