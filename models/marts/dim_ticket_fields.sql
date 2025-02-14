/* Table: ticket_fields */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.type,
    t.title,
    t.raw_title,
    t.description,
    t.raw_description,
    t.position,
    t.active,
    t.required,
    t.collapsed_for_agents,
    t.title_in_portal,
    t.raw_title_in_portal,
    t.visible_in_portal,
    t.editable_in_portal,
    t.required_in_portal,
    t.created_at,
    t.updated_at,
    t.removable,
    t.initial_title,
    t._dlt_load_id,
    t._dlt_id,
    t.sub_type_id,
    t.agent_description,
FROM  {{ ref('stg_ticket_fields') }} as t