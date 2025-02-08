/* Table: ticket_metric_events */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'ticket_metric_events' */
    id,
    ticket_id,
    metric,
    instance_id,
    type,
    time,
    _dlt_load_id,
    _dlt_id,
    status__business,
    status__calendar,
FROM {{ source('raw_data', 'ticket_metric_events') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )