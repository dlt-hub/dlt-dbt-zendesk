/* Table: greetings */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'greetings' */
    id,
    name,
    category_id,
    default,
    default_lang,
    active,
    pending,
    audio_url,
    audio_name,
    has_sub_settings,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'greetings') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )