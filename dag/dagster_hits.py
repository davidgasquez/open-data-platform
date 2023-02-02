import os
from dagster import asset
import requests


@asset(key_prefix="main")
def raw_hits():
    """Download a HITS dataset from the web and saves it to disk."""
    url = "https://datasets.clickhouse.com/hits_compatible/athena_partitioned/hits_1.parquet"

    # Create data directory
    os.system("mc config host add mn http://minio:9020 minio minio123")
    os.system("mc mb mn/data")

    # Download the file
    with open("data/raw_hits.parquet", "wb") as out_file:
        content = requests.get(url, stream=True).content
        out_file.write(content)

    # Copy the file to S3
    os.system("mc cp data/raw_hits.parquet mn/data/raw_hits.parquet")

    return "data/raw_hits.parquet"
