/* Table: requests */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'requests' */
    url,
    id,
    status,
    subject,
    description,
    organization_id,
    via__channel,
    via__source__from,
    via__source__to,
    requester_id,
    is_public,
    can_be_solved_by_me,
    created_at,
    updated_at,
    assignee_id,
    ticket_form_id,
    custom_status_id,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'requests') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )