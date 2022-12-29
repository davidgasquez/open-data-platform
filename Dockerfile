FROM mcr.microsoft.com/vscode/devcontainers/base:jammy

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754 && \
    echo "deb https://packages.clickhouse.com/deb stable main" | sudo tee \
    /etc/apt/sources.list.d/clickhouse.list

RUN apt-get update && apt-get -y install --no-install-recommends build-essential python3-dev python3 python3-pip clickhouse-client

RUN pip3 install clickhouse-connect dbt-core dbt-clickhouse
