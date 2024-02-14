# General Dataproc commands for Cloudshell:
#1. Create Dataproc cluster
gcloud dataproc clusters create your-cluster-name \
    --bucket your-bucket \
    --region your-region \
    --master-machine-type n2-standard-4 --master-boot-disk-size 500 \
    --num-workers 2 \
    --worker-machine-type n2-standard-2 \
    --worker-boot-disk-size 500 --image-version 2.1-debian11 \
    --project your-project-id

#2. List clusters in region
gcloud dataproc clusters list --region your-region

#3. Delete cluster
gcloud dataproc clusters delete your-cluster-name --region your-region

#4. Submit Pyspark job to cluster
gcloud dataproc jobs submit pyspark \
    --cluster=your-cluster-name \
    --region=your-region \
    --project=your-project-id \
    --properties spark.submit.deployMode=cluster \
    --main=gs://your-bucket/job.py

#5. List Dataproc jobs
gcloud dataproc jobs list --region your-region
