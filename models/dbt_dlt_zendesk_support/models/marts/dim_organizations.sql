/* Table: organizations */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.name,
    t.shared_tickets,
    t.shared_comments,
    t.created_at,
    t.updated_at,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_organizations') }} as t