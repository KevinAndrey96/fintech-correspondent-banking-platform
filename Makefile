# ==============================================================================
# Fintech Correspondent Banking Platform - Makefile
# ==============================================================================

.PHONY: help build up down restart logs sh reset-db seed lint test key

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build docker containers
	docker compose build

up: ## Start containers in detached mode
	docker compose up -d

down: ## Stop and remove containers
	docker compose down

restart: down up ## Restart all services

logs: ## Tail container logs
	docker compose logs -f

sh: ## Open a shell inside the PHP app container
	docker compose exec app bash

key: ## Generate application key
	docker compose exec app php artisan key:generate

reset-db: ## Wipe and recreate database from schema.sql
	docker compose exec database mysql -u fintech_user -pfintech_secret fintech_correspondents < database/schema.sql

seed: ## Populate database with realistic Colombian fintech seed data
	docker compose exec database mysql -u fintech_user -pfintech_secret fintech_correspondents < database/seeds.sql

lint: ## Run PHP syntax check across app, routes and config
	php -l routes/api.php
	php -l routes/web.php
	find app -name "*.php" -exec php -l {} \;

test: ## Run PHPUnit tests
	docker compose exec app ./vendor/bin/phpunit
