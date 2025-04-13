docker_tag = $(repository)/$(path):docker
rock_tag = $(repository)/$(path):rock

build-docker:
	docker build --tag $(docker_tag) .

run-docker: build-docker
	docker run --rm $(docker_tag)

build-rock:
	rockcraft pack
	sudo rockcraft.skopeo --insecure-policy copy oci-archive:$(path)_latest_amd64.rock docker-daemon:$(rock_tag)

run-rock: build-rock
	docker run --rm $(rock_tag) exec hello-world
