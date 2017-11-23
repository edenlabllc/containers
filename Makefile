GIT_COMMIT := $(strip $(shell git rev-parse --short HEAD))
BUILD_DATE := $(date -u +"%Y-%m-%dT%H:%M:%SZ")
ELIXIR_TAG := 1.5.2
ELIXIR_IMAGE := edenlabllc/elixir

default: build

build:
	cd elixir
	docker build \
		--no-cache \
		--file elixir/Dockerfile \
		--label org.label-schema.build-date="$(BUILD_DATE)" \
		--label org.label-schema.name="Elixir container" \
		--label org.label-schema.description="Container with latest Elixir and Erlang." \
		--label org.label-schema.url="https://hub.docker.com/r/edenlabllc/elixir" \
		--label org.label-schema.vcs-ref=$(GIT_COMMIT) \
		--label org.label-schema.vcs-url="http://github.com/edenlabllc/containers" \
		--label org.label-schema.vendor="Edenlab LLC." \
		--label org.label-schema.schema-version="1.0" \
		--tag $(ELIXIR_IMAGE):$(ELIXIR_TAG) .

push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
