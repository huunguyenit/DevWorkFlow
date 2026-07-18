SELECT
    SCHEMA_NAME(o.schema_id) AS schema_name,
    o.name AS object_name,
    o.type AS object_type,
    o.modify_date AS modify_date
FROM sys.objects o WITH (NOLOCK)
WHERE o.is_ms_shipped = 0
  AND o.type IN ('U', 'V', 'FN', 'IF', 'TF', 'P');
