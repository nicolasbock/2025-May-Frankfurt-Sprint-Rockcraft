docker_tag = $(repository)/$(path):docker
rock_tag = $(repository)/$(path):rock

build-docker:
	docker build --tag $(docker_tag) .

run-docker: build-docker
	docker run --rm $(docker_tag)

export-docker: build-docker
	ID=$$(docker create $(docker_tag)); docker export -o $(path).docker.tar.gz $$ID; docker rm $$ID

build-rock:
	rockcraft pack
	rockcraft.skopeo --insecure-policy copy oci-archive:$(path)_latest_amd64.rock docker-daemon:$(rock_tag)

run-rock: build-rock
	docker run --rm $(rock_tag)

export-rock: build-rock
	ID=$$(docker create $(rock_tag)); docker export -o $(path).rock.tar.gz $$ID; docker rm $$ID
