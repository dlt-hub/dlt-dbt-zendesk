/* Table: ticket_metric_events */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.ticket_id,
    t.metric,
    t.instance_id,
    t.type,
    t.time,
    t._dlt_load_id,
    t._dlt_id,
    t.status__business,
    t.status__calendar,
FROM  {{ ref('stg_ticket_metric_events') }} as t