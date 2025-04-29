repository = 2025-may-frankfurt-engineering-sprint
path = example01

include ../common.mk

run-rock: build-rock
	docker run --rm --name $(path)-rock $(rock_tag) exec hello-world
