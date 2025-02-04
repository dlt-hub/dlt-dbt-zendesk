/* Table: triggers__conditions__all */
/* Parent: triggers */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.field,
    t.operator,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.value,
FROM  {{ ref('stg_triggers__conditions__all') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_triggers') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)