-- Check BigQuery table for records with 'Return' invoices
-- Query output should be 0
select count(*) 
from `your-project-id.your-dataset.your-table` 
where invoicetype = 'Return';