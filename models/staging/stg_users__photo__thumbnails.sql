/* Table: users__photo__thumbnails */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_users') }}

SELECT
/* select which columns will be available for table 'users__photo__thumbnails' */
    url,
    id,
    file_name,
    content_url,
    mapped_content_url,
    content_type,
    size,
    width,
    height,
    inline,
    deleted,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'users__photo__thumbnails') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_users') }} )
