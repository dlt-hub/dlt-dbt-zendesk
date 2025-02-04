/* Table: organization_memberships */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.user_id,
    t.organization_id,
    t.default,
    t.created_at,
    t.organization_name,
    t.updated_at,
    t.view_tickets,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_organization_memberships') }} as t