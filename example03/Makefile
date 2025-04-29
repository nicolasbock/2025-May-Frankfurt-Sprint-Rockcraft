repository = 2025-may-frankfurt-engineering-sprint
path = example03

include ../common.mk

run-docker: build-docker
	docker run --detach --name $(path)-docker --rm --publish 2080:2080 $(docker_tag)
	while ! curl localhost:2080; do sleep 1; done
	docker kill $(path)-docker

run-rock: build-rock
	docker run --detach --name $(path)-rock --rm --publish 2080:2080 $(rock_tag)
	while ! curl localhost:2080; do sleep 1; done
	docker kill $(path)-rock
