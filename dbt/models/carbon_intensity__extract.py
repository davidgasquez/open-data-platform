import os
import shutil
import uuid

import alto.engine
import duckdb


def model(dbt, session: duckdb.DuckDBPyConnection):
    dbt.config(materialized="table")
    engine = alto.engine.get_engine("dev")
    # Setup pipeline
    tap, target, runtime_config = alto.engine.setup_tap_target(
        "tap-carbon-intensity",
        "target-jsonl",
        engine.filesystem,
        engine.configuration,
        engine.alto,  # type: ignore
    )
    # Run pipeline
    shutil.rmtree(runtime_config[target.name]["destination_path"])
    alto.engine.run_pipeline(
        tap,
        target,
        str(uuid.uuid4()),
        engine.filesystem,
    )
    # Return data
    return session.read_json(
        os.path.join(runtime_config[target.name]["destination_path"], "entry-*.jsonl"),
        sample_size=-1,
    )
