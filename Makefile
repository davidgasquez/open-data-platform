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
	@mc mb mn/data

.PHONY: data
data:
	@mkdir -p data
	@wget --continue https://datasets.clickhouse.com/hits_compatible/athena_partitioned/hits_1.parquet -O data/hits.parquet
	@mc cp data/hits.parquet mn/data/hits.parquet

# On the rails execution of alto directly as a simple EL tool
.PHONY: carbon-intensity
carbon-intensity-test:
	@cd dbt && alto tap-carbon-intensity:target-jsonl
	@tree dbt/output

# Run an alto embedded dbt python model with tests on the extracted
# data before passing to downstream nodes via `dbt build`
.PHONY: dbt-alto-test
dbt-alto-test:
	@cd dbt && dbt build -s +carbon_intensity
	@mc ls mn/data/

dev: up
	@docker-compose exec -u vscode -w /workspace ubuntu /bin/bash

clean: stop
	@sudo rm -rf data/*
	@sudo rm -rf .minio/
