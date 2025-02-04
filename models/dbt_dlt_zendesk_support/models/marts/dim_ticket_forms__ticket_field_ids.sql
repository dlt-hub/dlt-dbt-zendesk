/* Table: ticket_forms__ticket_field_ids */
/* Parent: ticket_forms */
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
FROM  {{ ref('stg_ticket_forms__ticket_field_ids') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_ticket_forms') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)