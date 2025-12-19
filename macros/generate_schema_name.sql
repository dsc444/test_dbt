{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {# This forces dbt to use ONLY the custom name if it's provided #}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}