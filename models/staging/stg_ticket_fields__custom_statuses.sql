/* Table: ticket_fields__custom_statuses */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_ticket_fields') }}

SELECT
/* select which columns will be available for table 'ticket_fields__custom_statuses' */
    url,
    id,
    status_category,
    agent_label,
    end_user_label,
    description,
    end_user_description,
    active,
    "default",
    created_at,
    updated_at,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'ticket_fields__custom_statuses') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_ticket_fields') }} )
