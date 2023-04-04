from setuptools import find_packages, setup

setup(
    name="dag",
    packages=find_packages(),
    install_requires=[
        "dagit",
        "dagster",
        "dbt-core",
        "duckdb",
        "dagster-dbt",
        "dagster-docker",
        "dagster-duckdb",
        "dagster-k8s",
        "dbt-duckdb",
        "dbt-osmosis",
        "singer-alto",
        "pyarrow",
    ],
    extras_require={"dev": ["dagit"]},
)
