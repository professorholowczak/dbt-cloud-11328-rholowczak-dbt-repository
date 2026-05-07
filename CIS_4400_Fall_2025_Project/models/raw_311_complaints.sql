-- raw_311_complaints.sql  
-- {{ config(materialized='incremental') }}

WITH union_311 AS
(
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2014`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2015`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2016`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2017`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2018`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2019`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2020`
   UNION DISTINCT
   SELECT *
   FROM  `NYC_311_Complaints.bicycle_complaints_2021`
)
SELECT *, current_timestamp() as loaded_at
FROM union_311  

--{% if is_incremental() %}
--  -- this filter will only be applied on incremental runs
--  where loaded_at > (select max(loaded_at) from {{ this }})
--{% endif %}
