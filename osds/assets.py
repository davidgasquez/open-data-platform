from dagster import asset

import pandas as pd


@asset
def hits():
    # TODO: Download from Clickhouse S3
    return pd.DataFrame([{"hits": 1}])
