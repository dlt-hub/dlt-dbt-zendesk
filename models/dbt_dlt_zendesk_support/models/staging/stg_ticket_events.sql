/* Table: ticket_events */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'ticket_events' */
    id,
    ticket_id,
    timestamp,
    created_at,
    updater_id,
    via,
    event_type,
    _dlt_load_id,
    _dlt_id,
    system__client,
    system__location,
    system__latitude,
    system__longitude,
FROM {{ source('raw_data', 'ticket_events') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )