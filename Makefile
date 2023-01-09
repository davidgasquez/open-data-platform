default: dev

build:
	@docker-compose build

up: build
	@docker-compose up -d

stop:
	@docker-compose stop

.PHONY: minio
minio:
	@mc config host add mn http://minio:9020 minio minio123
	@mc mb data

.PHONY: data
data:
	@mkdir -p data
	@wget --continue https://datasets.clickhouse.com/hits_compatible/athena_partitioned/hits_1.parquet -O data/hits.parquet
	@mc cp data/hits.parquet mn/data/hits.parquet

dev: up
	@docker-compose exec -u vscode -w /workspace ubuntu /bin/bash

clean: stop
	@sudo rm -rf data/*
	@sudo rm -rf .minio/
