/* Table: views__execution__columns */
/* Parent: views */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.title,
    t.filterable,
    t.sortable,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_views__execution__columns') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_views') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)