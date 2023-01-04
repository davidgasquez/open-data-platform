FROM mcr.microsoft.com/vscode/devcontainers/python:3.10

RUN apt-get update && apt-get -y install --no-install-recommends \
    build-essential

# Install minio mc
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin

# Install duckdb
RUN pip3 --disable-pip-version-check --no-cache-dir install \
    duckdb==0.6.1 dbt-duckdb==1.3.3 dbt-osmosis==0.9.8 \
    && rm -rf /tmp/pip-tmp

# Configure Workspace
ENV DBT_PROFILES_DIR=/workspace/dbt
