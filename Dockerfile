FROM mcr.microsoft.com/vscode/devcontainers/python:3.10

RUN apt-get update && apt-get -y install --no-install-recommends \
    build-essential

# Install minio mc
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin

# Install Python packages
COPY requirements.txt /tmp/pip-tmp/requirements.txt
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

# Configure Workspace
ENV DBT_PROFILES_DIR=/workspace/dbt
ENV DAGSTER_HOME=/home/vscode/
