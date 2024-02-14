# Data Engineering using PySpark and BigQuery (Google Cloud Platform)

This repository contains a PySpark job that reads data from a CSV file stored in a Google Cloud Storage bucket and writes it into a BigQuery table.

Additional files include shell scripts containing basic CloudShell commands, SQL queries that can be executed in BigQuery to check data quality and the CSV file.

### Note:

I made this to get acquainted with Dataproc and BigQuery services.

## File Descriptions

`job.py`: This is the main PySpark script that reads the CSV data, performs some transformations, and loads the data into a BigQuery table.

`gcloud_commands.sh`: This shell script contains general configuration commands for Google Cloud Shell, including authentication, project setup, and service listing.

`dataproc_commands.sh`: This shell script contains commands for creating, listing, and deleting Dataproc clusters, as well as submitting PySpark jobs to a cluster.

`\*.sql`: These SQL scripts are used for validating the data in the BigQuery table. They check for records with 'Return' invoices, null values in certain fields, and invalid quantities.

`*.csv`: Contains invoice data for ecommerce platform.

## Prerequisites

- Google Cloud SDK
- PySpark
- Google Cloud Storage bucket
- Google BigQuery

## Setup

- Authenticate your Google Cloud account using the command in `gcloud_commands.sh`.
- Set your default project, compute region, and zone.
- Create a Dataproc cluster using the command in `dataproc_commands.sh`.
- Optional: use `pip install -r requirements.txt` to install libraries in local environment.
- Submit the PySpark job to the cluster using Console / CloudShell

## Usage

- Update the `PROJECT_ID, DATASET_ID, TABLE_NAME, URI, and BUCKET_NAME` variables in `job.py` with your specific Google Cloud project, dataset, table, and bucket details.

- After the job completes, you can run the `\*.sql` scripts in BigQuery to validate the data.

## Cleanup

- Delete the Dataproc cluster using the command in `dataproc_commands.sh`.
- Optionally, delete the Google Cloud project to avoid incurring charges.
