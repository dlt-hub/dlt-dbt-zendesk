/* Table: views__conditions__all */
/* Parent: views */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.field,
    t.operator,
    t.value,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_views__conditions__all') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_views') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)