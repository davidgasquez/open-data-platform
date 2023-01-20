from dagster import asset
import requests


@asset()
def dagster_hits():
    """Download a HITS dataset from the web and saves it to disk."""
    url = "https://datasets.clickhouse.com/hits_compatible/athena_partitioned/hits_1.parquet"

    with open("data/dagster_hits.parquet", "wb") as out_file:
        content = requests.get(url, stream=True).content
        out_file.write(content)

    return "data/dagster_hits.parquet"
