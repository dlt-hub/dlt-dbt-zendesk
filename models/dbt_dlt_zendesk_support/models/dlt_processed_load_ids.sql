{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_ticket_fields') }}
-- depends_on: {{ ref('dim_ticket_events') }}
-- depends_on: {{ ref('dim_tickets') }}
-- depends_on: {{ ref('dim_ticket_metric_events') }}
-- depends_on: {{ ref('dim_users') }}
-- depends_on: {{ ref('dim_groups') }}
-- depends_on: {{ ref('dim_organizations') }}
-- depends_on: {{ ref('dim_brands') }}
-- depends_on: {{ ref('dim_automations') }}
-- depends_on: {{ ref('dim_custom_agent_roles') }}
-- depends_on: {{ ref('dim_group_memberships') }}
-- depends_on: {{ ref('dim_macros') }}
-- depends_on: {{ ref('dim_organization_memberships') }}
-- depends_on: {{ ref('dim_recipient_addresses') }}
-- depends_on: {{ ref('dim_requests') }}
-- depends_on: {{ ref('dim_ticket_forms') }}
-- depends_on: {{ ref('dim_ticket_metrics') }}
-- depends_on: {{ ref('dim_triggers') }}
-- depends_on: {{ ref('dim_views') }}
-- depends_on: {{ ref('dim_automations__actions') }}
-- depends_on: {{ ref('dim_automations__conditions__all') }}
-- depends_on: {{ ref('dim_automations__actions__value') }}
-- depends_on: {{ ref('dim_brands__ticket_form_ids') }}
-- depends_on: {{ ref('dim_macros__actions') }}
-- depends_on: {{ ref('dim_tickets__test_multiple_choice') }}
-- depends_on: {{ ref('dim_ticket_events__child_events') }}
-- depends_on: {{ ref('dim_ticket_events__child_events__tags') }}
-- depends_on: {{ ref('dim_ticket_events__child_events__added_tags') }}
-- depends_on: {{ ref('dim_ticket_fields__system_field_options') }}
-- depends_on: {{ ref('dim_ticket_fields__custom_statuses') }}
-- depends_on: {{ ref('dim_ticket_fields__custom_field_options') }}
-- depends_on: {{ ref('dim_ticket_forms__ticket_field_ids') }}
-- depends_on: {{ ref('dim_triggers__actions') }}
-- depends_on: {{ ref('dim_triggers__actions__value') }}
-- depends_on: {{ ref('dim_triggers__conditions__all') }}
-- depends_on: {{ ref('dim_users__photo__thumbnails') }}
-- depends_on: {{ ref('dim_views__execution__columns') }}
-- depends_on: {{ ref('dim_views__execution__fields') }}
-- depends_on: {{ ref('dim_views__conditions__all') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}