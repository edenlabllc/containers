FROM fluent/fluentd:v1.2.0

RUN \
  apk add \
    --no-cache \
    --virtual .build-deps \
    make \
    gcc \
    g++ \
    libc-dev \
    ruby-dev \
    libffi-dev && \
  gem install \
    --no-document \
    fluent-plugin-prometheus:1.0.1 \
    fluent-plugin-elasticsearch:2.10.0 \
    fluent-plugin-kubernetes_metadata_filter:2.0.0 \
    fluent-plugin-rewrite-tag-filter:2.0.2 && \
  apk del .build-deps

USER root
