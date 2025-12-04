-- agency_dimension.sql
SELECT 
    row_number() OVER () AS agency_dim_id,
    agency, agency_name, current_timestamp() as loaded_at
FROM  
   ( SELECT DISTINCT agency, agency_name
     FROM {{ ref('raw_311_complaints') }}
    )
