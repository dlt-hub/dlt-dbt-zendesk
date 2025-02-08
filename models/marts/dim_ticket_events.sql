/* Table: ticket_events */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.ticket_id,
    t.timestamp,
    t.created_at,
    t.updater_id,
    t.via,
    t.event_type,
    t._dlt_load_id,
    t._dlt_id,
    t.system__client,
    t.system__location,
    t.system__latitude,
    t.system__longitude,
FROM  {{ ref('stg_ticket_events') }} as t