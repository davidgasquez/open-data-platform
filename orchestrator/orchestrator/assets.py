"""
Basic assets for the orchestrator.
"""

import pyarrow as pa
from dagster import asset


@asset
def hits():
    """A simple asset that returns a table with a single column of ints."""
    custom_hits = pa.Table.from_pydict({"hits": [1, 2, 3]})
    return custom_hits
