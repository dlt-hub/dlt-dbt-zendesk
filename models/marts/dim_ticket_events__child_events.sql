/* Table: ticket_events__child_events */
/* Parent: ticket_events */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.via,
    t.comment_present,
    t.comment_public,
    t.event_type,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.requester_id,
    t.assignee_id,
    t.subject,
    t.status,
    t.group_id,
    t.ticket_form_id,
    t.type,
    t.previous_value,
    t.priority,
    t.brand_id,
    t.custom_status_id,
    t.custom_ticket_fields___13726277415953,
    t.organization_id,
    t.custom_ticket_fields___15372534629137,
    t.custom_ticket_fields___15372805838609,
    t.custom_ticket_fields___15372560286609,
    t.x,
FROM  {{ ref('stg_ticket_events__child_events') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_ticket_events') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)