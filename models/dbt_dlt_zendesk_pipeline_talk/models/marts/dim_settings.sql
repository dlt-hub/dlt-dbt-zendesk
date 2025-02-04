/* Table: settings */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.maximum_queue_size,
    t.maximum_queue_wait_time,
    t.recordings_public,
    t.only_during_business_hours,
    t.agent_wrap_up_after_calls,
    t.agent_confirmation_when_forwarding,
    t.voice_ai_enabled,
    t.voice_ai_display_transcript,
    t.voice_zendesk_qa_enabled,
    t.voice,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_settings') }} as t