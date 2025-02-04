/* Table: settings__supported_locales */
/* Parent: settings */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_settings__supported_locales') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_settings') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)