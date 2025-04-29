repository = 2025-may-frankfurt-engineering-sprint
path = example02

include ../common.mk

run-rock: build-rock
	docker run --rm $(rock_tag) --name $(path)-rock exec hello-world
