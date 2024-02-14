-- Check BigQuery table for records where 'Quantity' is NULL or less than 0 
-- Query output should be 0
select count(*)
from `your-project-id.your-dataset.your-table`
where quantity < 0 or quantity is null;