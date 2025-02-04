/* Table: greeting_categories */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'greeting_categories' */
    id,
    name,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'greeting_categories') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )