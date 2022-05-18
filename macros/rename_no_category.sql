{# Used for genres and moods, this ensures that if you get '-' you return a human readable category instead #}

{% macro rename_category(column_name) %}
    case
    -- handle no genre or no mood when we use a hyphen, additionall remove the underscore and any leading numbers
    when {{ column_name }} = '-' or contains_substr({{ column_name }}, '_') then split(initcap('No {{ column_name }}'), '_')[offset (0)]
    -- handle apostrophes which can inadvertently break a query
    when contains_substr({{ column_name }}, "'") then replace({{ column_name }}, "'", '')
    else {{ column_name }}
    end
{% endmacro %}
