-- Metadata cột để sinh CREATE TABLE.
-- Placeholder: {{schema}}, {{name}}
SELECT
    c.column_id,
    c.name AS column_name,
    tp.name AS type_name,
    c.max_length,
    c.[precision],
    c.scale,
    c.is_nullable,
    c.is_identity,
    CAST(CASE WHEN ic.object_id IS NOT NULL THEN 1 ELSE 0 END AS bit) AS is_primary_key
FROM sys.columns c
INNER JOIN sys.objects o ON o.object_id = c.object_id
INNER JOIN sys.types tp ON c.user_type_id = tp.user_type_id
LEFT JOIN sys.index_columns ic
    ON ic.object_id = c.object_id
   AND ic.column_id = c.column_id
   AND ic.is_included_column = 0
LEFT JOIN sys.indexes i
    ON i.object_id = ic.object_id
   AND i.index_id = ic.index_id
   AND i.is_primary_key = 1
WHERE o.object_id = OBJECT_ID(QUOTENAME(N'{{schema}}') + N'.' + QUOTENAME(N'{{name}}'))
ORDER BY c.column_id;
