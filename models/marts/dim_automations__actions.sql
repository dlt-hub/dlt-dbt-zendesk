/* Table: automations__actions */
/* Parent: automations */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.field,
    t.value,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_automations__actions') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_automations') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)