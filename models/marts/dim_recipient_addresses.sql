/* Table: recipient_addresses */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.brand_id,
    t.default,
    t.name,
    t.email,
    t.forwarding_status,
    t.spf_status,
    t.cname_status,
    t.domain_verification_status,
    t.created_at,
    t.updated_at,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_recipient_addresses') }} as t