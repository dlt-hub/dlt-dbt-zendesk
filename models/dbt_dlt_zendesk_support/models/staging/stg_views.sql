/* Table: views */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'views' */
    url,
    id,
    title,
    active,
    updated_at,
    created_at,
    default,
    position,
    execution__group_by,
    execution__group_order,
    execution__sort_by,
    execution__sort_order,
    execution__group__id,
    execution__group__title,
    execution__group__filterable,
    execution__group__sortable,
    execution__group__order,
    execution__sort__id,
    execution__sort__title,
    execution__sort__filterable,
    execution__sort__sortable,
    execution__sort__order,
    raw_title,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'views') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )