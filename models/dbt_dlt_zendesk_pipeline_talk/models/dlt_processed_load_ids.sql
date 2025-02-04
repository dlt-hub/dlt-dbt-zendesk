{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_greeting_categories') }}
-- depends_on: {{ ref('dim_greetings') }}
-- depends_on: {{ ref('dim_settings') }}
-- depends_on: {{ ref('dim_current_queue_activity') }}
-- depends_on: {{ ref('dim_settings__supported_locales') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}