-- Check BigQuery table for records where 'Invoice No.','Stock Code' or 'Customer ID' are NULL  
-- Query output should be 0
select count(*) 
from `your-project-id.your-dataset.your-table` 
where invoiceno is null or customerid is null or stockcode is null;