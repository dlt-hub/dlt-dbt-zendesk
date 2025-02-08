/* Table: ticket_events__child_events__added_tags */
/* Parent: ticket_events__child_events */
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
FROM  {{ ref('stg_ticket_events__child_events__added_tags') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_ticket_events__child_events') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)