{% macro generate_cardinality_model(table_name) %}

    {# Get the list of columns in the table #}
    {% set columns = run_query("DESCRIBE TABLE " ~ table_name) %} --its a list of dicts
    
    {# Initialize an empty list to store column names and cardinality scores #}
    {% set column_cardinality_list = [] %}

    {# Loop through each column in the table #}
    {% for column in columns %} --column is a dict containing name:<column_name>, etc...
        {# Run a query to count distinct values in the column #}
        {% set distinct_count_query = "SELECT COUNT(DISTINCT {{ column.name }}) AS distinct_count FROM " ~ table_name %}
        {% set distinct_count_result = run_query(distinct_count_query) %} --list of dicts
        
        {# Get the distinct count value from the result #}
        {% set distinct_count = distinct_count_result[0]['distinct_count'] %} -- INT. list zero'th item dict value
        
        {# Add column name and cardinality score to the list #}
        {% set column_cardinality = {"column_name": column.name, "cardinality_score": distinct_count} %}
        {% do column_cardinality_list.append(column_cardinality) %}
    {% endfor %}
    
    {# Generate the SQL SELECT statement based on column_cardinality_list #}
    {% set select_statement %}
        SELECT
            {% for column_cardinality in column_cardinality_list %}
                '{{ column_cardinality.column_name }}' AS column_name,
                {{ column_cardinality.cardinality_score }} AS cardinality_score
                {% if not loop.last %}, {% endif %}
            {% endfor %}
    {% endset %}
    
    {# Create a dbt model using the SELECT statement #}
    {{ config(materialized='table') }}

    {# Add the SQL SELECT statement as the source SQL #}
    {{ select_statement }}

{% endmacro %}
