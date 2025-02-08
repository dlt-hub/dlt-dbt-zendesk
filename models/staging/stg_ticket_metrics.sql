/* Table: ticket_metrics */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'ticket_metrics' */
    url,
    id,
    ticket_id,
    created_at,
    updated_at,
    group_stations,
    assignee_stations,
    reopens,
    replies,
    assignee_updated_at,
    requester_updated_at,
    status_updated_at,
    initially_assigned_at,
    assigned_at,
    latest_comment_added_at,
    on_hold_time_in_minutes__calendar,
    on_hold_time_in_minutes__business,
    custom_status_updated_at,
    _dlt_load_id,
    _dlt_id,
    reply_time_in_minutes__calendar,
    reply_time_in_minutes__business,
FROM {{ source('raw_data', 'ticket_metrics') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )