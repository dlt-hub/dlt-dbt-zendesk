# Zendesk dlt-dbt Package

### Overview
The Zendesk dlt-dbt package offers data models to help you transform and analyze Zendesk data. It's designed to integrate with the dlt Zendesk pipeline, which extracts and loads Zendesk data into your data warehouse.

### Who is this for?
This package is perfect for dbt users who want to integrate Zendesk data into their analytics workflows without building models from scratch.


### Key Features
- **Staging Models:** Clean and prepare raw Zendesk data for downstream analysis.
- **Mart Models:** Pre-built dimension and fact tables for key Zendesk entities like tickets, requests etc.
- **Incremental Loading:** Supports incremental data processing to optimize performance.
- **Easy Integration:** Designed to work out-of-the-box with the dlt Zendesk pipeline.

### Setup Instructions

#### Prerequisites
- dbt Core installed in your environment.
- Access to a supported data warehouse: BigQuery, Snowflake, Redshift, Athena, or PostgreSQL.
- The dlt Zendesk pipeline is set up and running.

### Step 1: Set Up the dlt Zendesk Pipeline
1. **Install dlt:**
   ``` 
   pip install dlt
   ```
2. **Configure the Pipeline:**
   Follow the dlt Zendesk [pipeline documentation](https://dlthub.com/docs/dlt-ecosystem/verified-sources/zendesk) to set up your pipeline. Ensure you have your Zendesk and destination credentials configured.

3. **Run the Pipeline:**
    Extract and load data from the Zendesk API into your data warehouse using the Zendesk pipeline. As Zendesk pipeline integrates multiple sources. Here, we will build a model for the `zendesk_support` source. For more details on sources, refer to the documentation.

### Step 2: Install and Configure the dbt Project

1. Install the Zendesk dbt package into your dbt environment.
2. Configure your 'dbt_project.yml' file with the appropriate connection details for your data warehouse.
3. Ensure the data from your dlt Zendesk pipeline is available in your warehouse.

This is how the tables in dbt packages look like:

For Zendesk Support:

```text
marts/
├── models/
│   ├── marts/
│   │   ├── dim__dlt_loads.sql
│   │   ├── dim_automations__actions__value.sql
│   │   ├── dim_automations__actions.sql
│   │   ├── dim_automations__conditions__all.sql
│   │   ├── dim_automations.sql
│   │   ├── dim_brands__ticket_form_ids.sql
│   │   ├── dim_brands.sql
│   │   ├── dim_custom_agent_roles.sql
│   │   ├── dim_group_memberships.sql
│   │   ├── dim_groups.sql
│   │   ├── dim_macros__actions.sql
│   │   ├── dim_macros.sql
│   │   ├── dim_organization_memberships.sql
│   │   ├── dim_organizations.sql
│   │   ├── dim_recipient_addresses.sql
│   │   ├── dim_requests.sql
│   │   ├── dim_ticket_events__child_events__added_tags.sql
│   │   ├── dim_ticket_events__child_events__tags.sql
│   │   ├── dim_ticket_events__child_events.sql
│   │   ├── dim_ticket_events.sql
│   │   ├── dim_ticket_fields__custom_field_options.sql
│   │   ├── dim_ticket_fields__custom_statuses.sql
│   │   ├── dim_ticket_fields__system_field_options.sql
│   │   ├── dim_ticket_fields.sql
│   │   ├── dim_ticket_forms__ticket_field_ids.sql
│   │   ├── dim_ticket_forms.sql
│   │   ├── dim_ticket_metric_events.sql
│   │   ├── dim_ticket_metrics.sql
│   │   ├── dim_tickets__test_multiple_choice.sql
│   │   ├── dim_tickets.sql
│   │   ├── dim_triggers__actions__value.sql
│   │   ├── dim_triggers__actions.sql
│   │   ├── dim_triggers__conditions__all.sql
│   │   ├── dim_triggers.sql
│   │   ├── dim_users__photo__thumbnails.sql
│   │   ├── dim_users.sql
│   │   ├── dim_views__conditions__all.sql
│   │   ├── dim_views__execution__columns.sql
│   │   ├── dim_views__execution__fields.sql
│   │   └── dim_views.sql
│   ├── staging/  #same models as marts with prefix `stg`
│   ├── dlt_active_load_ids.sql
│   └── dlt_processed_load_ids.sql
│   └── sources.yml
├── tests/
```

### Step 3: Run dbt
Execute the dbt models to transform the raw Zendesk data into useful tables:

```sh
dbt build
```

### Customization
While this package provides a solid foundation, you can customize it to suit your specific needs:

- Modify the models to align with your business logic.
- Add relationships between tables by modifying your dlt pipeline schema.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.

### Schema diagram
The dbt model above can be further customized according to the requirements. Using this package you'll get a basic template
for data model which can be further modified as required.

1. The schema of data modelled Zendesk Support above using dlt-dbt-generator:
    
   ![picture](https://storage.googleapis.com/dlt-blog-images/zendesk_support_dlt_dbt_v0.1.0.png)

   Here's the link to the DB diagram: [link](https://dbdiagram.io/d/zendesk_support_dlt_dbt_v0-1-0-67a1f7c0263d6cf9a0f9bb5f).


> ⚠️ **Note:**
> 
> Please note that this is a starting template for your data model and is not the final product. It is advised to customize the data model as per your needs.

#### Optional: Advanced Usage (Generator and Licensing)

This package was created using the dlt-dbt-generator by dlt-plus. For more information about dlt-plus, refer to the 
[dlt-plus documentation.](https://dlt-plus.netlify.app/docs/plus/intro/).To learn more about the dlt-dbt-generator, 
consult the [dlt-dbt-generator](https://dlthub.com/blog/dbt-gen) documentation.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed
