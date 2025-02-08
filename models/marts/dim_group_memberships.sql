/* Table: group_memberships */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.user_id,
    t.group_id,
    t.default,
    t.created_at,
    t.updated_at,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_group_memberships') }} as t