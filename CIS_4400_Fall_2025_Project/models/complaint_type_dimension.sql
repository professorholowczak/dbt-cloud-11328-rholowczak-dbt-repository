-- complaint_type_dimension.sql
WITH complaint_type_columns AS
( 
     SELECT DISTINCT complaint_type, descriptor
     FROM {{ ref('raw_311_complaints') }}
     ORDER BY 1, 2
)
SELECT 
    row_number() OVER () AS complaint_type_dim_id,
    complaint_type, descriptor, current_timestamp() as loaded_at
FROM  complaint_type_columns
ORDER BY complaint_type, descriptor

