/* Table: ticket_events__child_events__tags */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_ticket_events__child_events') }}

SELECT
/* select which columns will be available for table 'ticket_events__child_events__tags' */
    value,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'ticket_events__child_events__tags') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_ticket_events__child_events') }} )
