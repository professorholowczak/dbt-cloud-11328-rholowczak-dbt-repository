SELECT 
    row_number() OVER () AS agency_dim_id,
    agency, agency_name
FROM  
   ( SELECT DISTINCT agency, agency_name
     FROM {{ raw_311_complaints.sql }}
     
    )
