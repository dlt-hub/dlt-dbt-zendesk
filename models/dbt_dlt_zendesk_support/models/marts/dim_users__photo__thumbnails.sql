/* Table: users__photo__thumbnails */
/* Parent: users */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.url,
    t.id,
    t.file_name,
    t.content_url,
    t.mapped_content_url,
    t.content_type,
    t.size,
    t.width,
    t.height,
    t.inline,
    t.deleted,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_users__photo__thumbnails') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_users') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)