-- location_dimension.sql
WITH location_columns AS
( 
     SELECT DISTINCT address_type, borough, city, incident_address, incident_zip, latitude, longitude, park_borough, street_name
     FROM {{ ref('raw_311_complaints') }}
     ORDER BY 1, 2
)
SELECT 
    row_number() OVER () AS location_dim_id,
    address_type, borough, city, incident_address, incident_zip, latitude, longitude, park_borough, street_name, current_timestamp() as loaded_at
FROM  location_columns
ORDER BY address_type, borough, city, incident_address, incident_zip, latitude, longitude, park_borough, street_name
