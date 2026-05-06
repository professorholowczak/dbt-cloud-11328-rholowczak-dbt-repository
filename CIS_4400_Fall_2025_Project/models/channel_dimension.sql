-- channel_dimension.sql
WITH channel_columns AS
( 
     SELECT DISTINCT open_data_channel_type, status
     FROM {{ ref('raw_311_complaints') }}
     ORDER BY 1, 2
)
SELECT 
    row_number() OVER () AS channel_dim_id,
    open_data_channel_type, status, current_timestamp() as loaded_at
FROM  channel_columns
ORDER BY open_data_channel_type, status
