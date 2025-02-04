/* Table: triggers__actions__value */
/* Parent: triggers__actions */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.value,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_triggers__actions__value') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_triggers__actions') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)