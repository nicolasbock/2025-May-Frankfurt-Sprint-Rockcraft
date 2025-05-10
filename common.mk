docker_tag = $(repository)/$(path):docker
rock_tag = $(repository)/$(path):rock

build-docker:
	docker build --tag $(docker_tag) .

run-docker: build-docker
	docker run --rm --name $(path)-docker $(docker_tag)

export-docker: build-docker
	ID=$$(docker create $(docker_tag)); docker export --output $(path).docker.tar $$ID; docker rm $$ID

save-docker: build-docker
	docker save --output $(path).docker.image.tar $(docker_tag)

build-rock:
	rockcraft pack
	rockcraft.skopeo --insecure-policy copy oci-archive:$(path)_latest_amd64.rock docker-daemon:$(rock_tag)

run-rock: build-rock
	docker run --rm --name $(path)-rock $(rock_tag)

export-rock: build-rock
	ID=$$(docker create $(rock_tag)); docker export --output $(path).rock.tar $$ID; docker rm $$ID

save-rock: build-rock
	docker save --output $(path).rock.image.tar $(rock_tag)
