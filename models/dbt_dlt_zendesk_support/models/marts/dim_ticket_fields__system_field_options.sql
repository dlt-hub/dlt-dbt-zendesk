/* Table: ticket_fields__system_field_options */
/* Parent: ticket_fields */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.name,
    t.value,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_ticket_fields__system_field_options') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_ticket_fields') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)