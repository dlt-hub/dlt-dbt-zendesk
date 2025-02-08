/* Table: tickets */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'tickets' */
    tags,
    custom_fields,
    url,
    id,
    via__channel,
    via__source__from,
    via__source__to,
    created_at,
    updated_at,
    generated_timestamp,
    type,
    subject,
    raw_subject,
    description,
    priority,
    status,
    requester_id,
    submitter_id,
    assignee_id,
    group_id,
    has_incidents,
    is_public,
    satisfaction_rating__score,
    custom_status_id,
    encoded_id,
    ticket_form_id,
    brand_id,
    allow_channelback,
    allow_attachments,
    from_messaging_channel,
    test_field,
    _dlt_load_id,
    _dlt_id,
    organization_id,
    test_field_number_two,
    dummy_dropdown,
FROM {{ source('raw_data', 'tickets') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )