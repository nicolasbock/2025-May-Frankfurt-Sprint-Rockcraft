repository = 2025-may-frankfurt-engineering-sprint
path = example01

build-docker:
	go build -o hello-world main.go
	docker build --tag $(repository)/$(path):docker .

run-docker: build-docker
	docker run --rm $(repository)/$(path):docker

build-rock:
	rockcraft pack
	sudo rockcraft.skopeo --insecure-policy copy oci-archive:example01_latest_amd64.rock docker-daemon:$(repository)/$(path):rock

run-rock: build-rock
	docker run --rm $(repository)/$(path):rock exec hello-world
