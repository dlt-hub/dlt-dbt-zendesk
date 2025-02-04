/* Table: current_queue_activity */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'current_queue_activity' */
    agents_online,
    average_wait_time,
    calls_waiting,
    longest_wait_time,
    callbacks_waiting,
    embeddable_callbacks_waiting,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'current_queue_activity') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )