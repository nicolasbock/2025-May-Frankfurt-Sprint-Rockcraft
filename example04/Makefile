repository = 2025-may-frankfurt-engineering-sprint
path = example04

include ../common.mk

run-docker: build-docker
	docker run --detach --rm --name $(path)-docker $(docker_tag)
	docker logs $(path)-docker
	docker kill $(path)-docker

run-rock: build-rock
	docker run --detach --rm --name $(path)-rock $(rock_tag)
	docker exec --interactive --tty $(path)-rock pebble logs
	docker kill $(path)-rock
