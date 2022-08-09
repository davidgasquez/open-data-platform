# Make default target
default: dev

build:
	@docker-compose build

up: build
	@docker-compose up -d

stop:
	@docker-compose stop

dev: up
	@docker-compose exec -u vscode -w /workspace ubuntu /bin/bash

clean:
	@sudo rm -rf .clickhouse/
