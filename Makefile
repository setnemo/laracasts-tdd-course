SHELL ?= /bin/bash
ARGS = $(filter-out $@,$(MAKECMDGOALS))

.SILENT: ;
.ONESHELL: ;
.NOTPARALLEL: ;
.EXPORT_ALL_VARIABLES: ;
Makefile: ;

.PHONY:
up: network
	docker-compose up -d

.PHONY: mysql
mysql:
	docker-compose exec mysql mysql -u root -p

.PHONY: redis
redis:
	docker-compose exec redis redis-cli ${ARGS}

.PHONY: stop
stop:
	docker-compose stop ${ARGS}

.PHONY: redis-m
redis-m:
	docker-compose exec redis redis-cli MONITOR

.PHONY: tinker
tinker:
	docker-compose exec app php artisan tinker

.PHONY: migrate
migrate:
	docker-compose exec app php artisan migrate

.PHONY: artisan
artisan:
	docker-compose exec app php artisan ${ARGS}

.PHONY: help
help: .title
	echo ''
	echo 'Available targets:'
	echo '  help:       Show this help and exit'
	echo '  up:         Create and start application in detached mode (in the background)'
	echo '  stop:       Stop container {name}'
	echo '  redis:      Run redis-cli {args}'
	echo '  mysql:      Run mysql {args}'
	echo '  redis-m:    Run redis monitor'
	echo ''

%:
	@: