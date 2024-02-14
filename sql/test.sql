-- Query to check data in BigQuery table
SELECT 
    CASE 
        WHEN return_count = 0 AND null_values_count = 0 AND invalid_quantity_count = 0 THEN 'Data: Clean'
        ELSE 'Null/Unneccessary Data Present'
    END AS data_status
FROM (
    SELECT 
        (SELECT COUNT(*) FROM `your-project-id.your-dataset.your-table` WHERE invoicetype = 'Return') AS return_count,
        (SELECT COUNT(*) FROM `your-project-id.your-dataset.your-table` WHERE invoiceno IS NULL OR customerid IS NULL OR stockcode IS NULL) AS null_values_count,
        (SELECT COUNT(*) FROM `your-project-id.your-dataset.your-table` WHERE quantity < 0 OR quantity IS NULL) AS invalid_quantity_count
) AS counts
