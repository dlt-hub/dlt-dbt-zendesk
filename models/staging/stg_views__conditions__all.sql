/* Table: views__conditions__all */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_views') }}

SELECT
/* select which columns will be available for table 'views__conditions__all' */
    field,
    operator,
    value,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'views__conditions__all') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_views') }} )
