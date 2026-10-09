{% macro ngn_millions(column, digits=2) %}
    round(sum({{ column }}) / 1000000.0, {{ digits }})
{% endmacro %}
