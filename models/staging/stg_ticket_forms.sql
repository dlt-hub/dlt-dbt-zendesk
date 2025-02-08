/* Table: ticket_forms */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'ticket_forms' */
    id,
    raw_name,
    raw_display_name,
    end_user_visible,
    position,
    active,
    "default",
    in_all_brands,
    url,
    name,
    display_name,
    created_at,
    updated_at,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'ticket_forms') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )