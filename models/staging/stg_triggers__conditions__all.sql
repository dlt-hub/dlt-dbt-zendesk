/* Table: triggers__conditions__all */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_triggers') }}

SELECT
/* select which columns will be available for table 'triggers__conditions__all' */
    field,
    operator,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    value,
FROM {{ source('raw_data', 'triggers__conditions__all') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_triggers') }} )
