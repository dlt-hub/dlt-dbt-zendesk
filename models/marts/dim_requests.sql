/* Table: requests */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.status,
    t.subject,
    t.description,
    t.organization_id,
    t.via__channel,
    t.via__source__from,
    t.via__source__to,
    t.requester_id,
    t.is_public,
    t.can_be_solved_by_me,
    t.created_at,
    t.updated_at,
    t.assignee_id,
    t.ticket_form_id,
    t.custom_status_id,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_requests') }} as t