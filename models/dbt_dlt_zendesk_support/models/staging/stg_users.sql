/* Table: users */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'users' */
    id,
    url,
    name,
    email,
    created_at,
    updated_at,
    time_zone,
    iana_time_zone,
    locale_id,
    locale,
    organization_id,
    role,
    verified,
    active,
    shared,
    shared_agent,
    last_login_at,
    role_type,
    custom_role_id,
    moderator,
    only_private_comments,
    restricted_agent,
    suspended,
    default_group_id,
    report_csv,
    _dlt_load_id,
    _dlt_id,
    photo__url,
    photo__id,
    photo__file_name,
    photo__content_url,
    photo__mapped_content_url,
    photo__content_type,
    photo__size,
    photo__width,
    photo__height,
    photo__inline,
    photo__deleted,
    ticket_restriction,
    alias,
    details,
    notes,
FROM {{ source('raw_data', 'users') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )