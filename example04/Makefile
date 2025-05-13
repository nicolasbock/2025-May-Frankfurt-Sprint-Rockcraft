repository = 2025-may-frankfurt-engineering-sprint
path = example04

include ../common.mk

run-docker: build-docker
	docker run --detach --rm --name $(path)-docker $(docker_tag)
	sleep 1
	docker logs $(path)-docker
	docker kill $(path)-docker

run-rock: build-rock
	docker run --detach --rm --name $(path)-rock $(rock_tag)
	sleep 1
	docker logs $(path)-rock
	docker exec $(path)-rock pebble logs
	docker kill $(path)-rock
