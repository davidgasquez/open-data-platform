from dagster import asset
import requests


@asset(key_prefix="main")
def raw_hits():
    """Download a HITS dataset from the web and saves it to disk."""
    url = "https://datasets.clickhouse.com/hits_compatible/athena_partitioned/hits_1.parquet"

    with open("data/raw_hits.parquet", "wb") as out_file:
        content = requests.get(url, stream=True).content
        out_file.write(content)

    return "data/raw_hits.parquet"
