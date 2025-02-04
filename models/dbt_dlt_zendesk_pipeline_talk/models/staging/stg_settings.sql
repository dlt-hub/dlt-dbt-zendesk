/* Table: settings */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'settings' */
    maximum_queue_size,
    maximum_queue_wait_time,
    recordings_public,
    only_during_business_hours,
    agent_wrap_up_after_calls,
    agent_confirmation_when_forwarding,
    voice_ai_enabled,
    voice_ai_display_transcript,
    voice_zendesk_qa_enabled,
    voice,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'settings') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )