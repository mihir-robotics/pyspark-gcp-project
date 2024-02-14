'''
PySpark Job to ingest data from Cloud Storage Bucket and load in Bigquery
table.
'''
from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.sql.types import StringType, IntegerType, FloatType
from pyspark.sql.utils import AnalysisException

# BigQuery parameters
PROJECT_ID = "your-project-id"
DATASET_ID = "your-dataset"
TABLE_NAME = "your-table-name"

# CSV Object parameters
URI = "gs://[your-bucket-name]/invoices_data.csv"
BUCKET_NAME = "your-bucket-name"

# Table Schema
table_schema = {
    'invoiceno': StringType(),
    'stockcode': StringType(),
    'description': StringType(),
    'quantity': IntegerType(),
    'unitprice': FloatType(),
    'customerid': IntegerType(),
    'country': StringType(),
    'invoicedate': StringType(), # DateType can be used here
    'invoicetime': StringType(), # TimeStampType can also be used
    'invoicetype': StringType()
}

def main() -> None:
    '''
    Main function to execute the PySpark job.
    Returns:
        None
    '''
    try:
        # Initialize SparkSession
        spark = SparkSession.builder.appName("SparkJob").getOrCreate()

        # Read CSV file from Cloud Storage into DataFrame
        df = spark.read.format("csv").option("header", "true")\
            .load(URI)\
            .filter('invoiceno is not null')\
            .filter('stockcode is not null')\
            .filter('customerid is not null')\
            .filter('invoicetype = "Purchase"')

        # Iterate over the schema and cast columns acc.
        for column, datatype in table_schema.items():
            try:
                df = df.withColumn(column, col(column).cast(datatype))

            # Catch exception/ error if invalid datatype is passed or
            # if there is mismatch between schema and dataframe
            except (TypeError, AnalysisException) as e:
                print(e)

        # Check if dataframe schema matches
        df.printSchema()

        # Write DataFrame to BigQuery table
        df.write.format("bigquery") \
            .option("temporaryGcsBucket", BUCKET_NAME) \
            .option("project", PROJECT_ID) \
            .option("dataset", DATASET_ID) \
            .option("table", TABLE_NAME) \
            .mode("overwrite").save()  # use .mode("append") if you don't want to lose existing data

    except Exception as e:
        print(e)

    finally:
        # Stop SparkSession
        spark.stop()

if __name__ == "__main__":
    main()
