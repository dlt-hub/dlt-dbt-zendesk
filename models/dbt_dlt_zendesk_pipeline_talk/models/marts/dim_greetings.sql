/* Table: greetings */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t.category_id,
    t.default,
    t.default_lang,
    t.active,
    t.pending,
    t.audio_url,
    t.audio_name,
    t.has_sub_settings,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_greetings') }} as t