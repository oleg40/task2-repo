{{ config(materialized='table') }}

{% import "../macros/utils/macro.sql" as macros %} 

{# Usage #}
{{ macros.generate_cardinality_model('seed_run_state_message_types') }}
{{ config(materialized='table') }}

{% import "../macros/utils/macro.sql" as macros %} 

{# Usage #}
{{ macros.generate_cardinality_model('seed_run_state_message_types') }}
