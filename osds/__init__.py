from dagster import Definitions

from dagster._utils import file_relative_path

from osds.assets import dagster_hits

from dagster_dbt import dbt_cli_resource, load_assets_from_dbt_project

DBT_DIR = file_relative_path(__file__, "../modeling")

dbt_resource = (
    dbt_cli_resource.configured({"project_dir": DBT_DIR, "profiles_dir": DBT_DIR}),
)

dbt_assets = load_assets_from_dbt_project(DBT_DIR, DBT_DIR)

defs = Definitions(assets=[dagster_hits, *dbt_assets], resources={"dbt": dbt_resource})
