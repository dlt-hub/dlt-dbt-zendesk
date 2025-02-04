/* Table: ticket_fields */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'ticket_fields' */
    url,
    id,
    type,
    title,
    raw_title,
    description,
    raw_description,
    position,
    active,
    required,
    collapsed_for_agents,
    title_in_portal,
    raw_title_in_portal,
    visible_in_portal,
    editable_in_portal,
    required_in_portal,
    created_at,
    updated_at,
    removable,
    initial_title,
    _dlt_load_id,
    _dlt_id,
    sub_type_id,
    agent_description,
FROM {{ source('raw_data', 'ticket_fields') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )