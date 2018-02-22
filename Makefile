GIT_COMMIT := $(strip $(shell git rev-parse --short HEAD))
BUILD_DATE := $(date -u +"%Y-%m-%dT%H:%M:%SZ")
ELIXIR_TAG := 1.5.2
ELIXIR_IMAGE := edenlabllc/elixir
BASIC_UTILS_TAG := 1.0
BASIC_UTILS_IMAGE := edenlabllc/basic-utils

default:

build-basic-utils:
	cd basic-utils
	docker build \
		--no-cache \
		--file basic-utils/Dockerfile \
		--label org.label-schema.build-date="$(BUILD_DATE)" \
		--label org.label-schema.name="Basic utilities" \
		--label org.label-schema.description="Container with basic utilities." \
		--label org.label-schema.url="https://hub.docker.com/r/edenlabllc/basic-utils" \
		--label org.label-schema.vcs-ref=$(GIT_COMMIT) \
		--label org.label-schema.vcs-url="http://github.com/edenlabllc/containers" \
		--label org.label-schema.vendor="Edenlab LLC." \
		--label org.label-schema.schema-version="1.0" \
		--tag $(BASIC_UTILS_IMAGE):$(BASIC_UTILS_TAG) .

build-elixir:
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

push-basic-utils:
	docker push $(BASIC_UTILS_IMAGE):$(BASIC_UTILS_TAG)

push-elixir:
	docker push $(ELIXIR_IMAGE):$(ELIXIR_TAG)
