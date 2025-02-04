/* Table: organization_memberships */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'organization_memberships' */
    url,
    id,
    user_id,
    organization_id,
    default,
    created_at,
    organization_name,
    updated_at,
    view_tickets,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'organization_memberships') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )