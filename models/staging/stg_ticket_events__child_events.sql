/* Table: ticket_events__child_events */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_ticket_events') }}

SELECT
/* select which columns will be available for table 'ticket_events__child_events' */
    id,
    via,
    comment_present,
    comment_public,
    event_type,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    requester_id,
    assignee_id,
    subject,
    status,
    group_id,
    ticket_form_id,
    type,
    previous_value,
    priority,
    brand_id,
    custom_status_id,
    custom_ticket_fields___13726277415953,
    organization_id,
    custom_ticket_fields___15372534629137,
    custom_ticket_fields___15372805838609,
    custom_ticket_fields___15372560286609,
    x,
FROM {{ source('raw_data', 'ticket_events__child_events') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_ticket_events') }} )
