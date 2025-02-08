/* Table: ticket_fields__custom_statuses */
/* Parent: ticket_fields */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.status_category,
    t.agent_label,
    t.end_user_label,
    t.description,
    t.end_user_description,
    t.active,
    t.default,
    t.created_at,
    t.updated_at,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_ticket_fields__custom_statuses') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_ticket_fields') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)