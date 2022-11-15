default: dev

build:
	@docker-compose build

up: build
	@docker-compose up -d

stop:
	@docker-compose stop

dev: up
	@docker-compose exec -u vscode -w /workspace ubuntu /bin/bash

clean: stop
	@sudo rm -rf .clickhouse/
	@sudo rm -rf .grafana/
	@sudo rm -rf .minio/
