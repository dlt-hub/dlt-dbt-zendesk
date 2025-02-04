/* Table: current_queue_activity */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.agents_online,
    t.average_wait_time,
    t.calls_waiting,
    t.longest_wait_time,
    t.callbacks_waiting,
    t.embeddable_callbacks_waiting,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_current_queue_activity') }} as t