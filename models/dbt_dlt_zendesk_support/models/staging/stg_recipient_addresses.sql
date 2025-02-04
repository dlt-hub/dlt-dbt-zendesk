/* Table: recipient_addresses */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'recipient_addresses' */
    url,
    id,
    brand_id,
    default,
    name,
    email,
    forwarding_status,
    spf_status,
    cname_status,
    domain_verification_status,
    created_at,
    updated_at,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'recipient_addresses') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )