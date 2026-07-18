-- Script definition module (VIEW / FUNCTION / PROCEDURE).
-- Placeholder: {{schema}}, {{name}}
SELECT OBJECT_DEFINITION(
    OBJECT_ID(QUOTENAME(N'{{schema}}') + N'.' + QUOTENAME(N'{{name}}'))
) AS definition;
