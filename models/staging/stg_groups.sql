/* Table: groups */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'groups' */
    url,
    id,
    is_public,
    name,
    description,
    "default",
    deleted,
    created_at,
    updated_at,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'groups') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )