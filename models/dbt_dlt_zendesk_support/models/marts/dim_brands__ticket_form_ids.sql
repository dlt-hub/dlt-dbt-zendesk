/* Table: brands__ticket_form_ids */
/* Parent: brands */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.value,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_brands__ticket_form_ids') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_brands') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)