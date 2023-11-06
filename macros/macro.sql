-- Macro Function

-- Selecting cte reference
{% macro select_ref(cte_names, model_refs) %}
{% for name in cte_names %}
  {{ name }} AS (
    SELECT * FROM {{ ref(model_refs[loop.index0]) }}
  ),
{% endfor %}
{% endmacro %}

-- Formatting date datatype value
{% macro date_formatter(column) %}
    FORMAT_DATE('%Y-%m-%d', {{ column }})
{% endmacro %}