{{ config(materialized='incremental') }}

SELECT *
FROM  `NYC_311_Complaints.bicycle_complaints_2014`
UNION DISTINCT
SELECT *
FROM  `NYC_311_Complaints.bicycle_complaints_2015`

{% if is_incremental() %}
  -- this filter will only be applied on incremental runs
  where updated_at > (select max(updated_at) from {{ this }})
{% endif %}