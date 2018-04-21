FROM fluent/fluentd:v1.1.3

RUN apk add make gcc g++ libc-dev ruby-dev libffi-dev

RUN gem install --no-document \
  fluent-plugin-prometheus:1.0.1 \
  fluent-plugin-elasticsearch:2.8.6 \
  fluent-plugin-kubernetes_metadata_filter:1.0.1 \
  fluent-plugin-rewrite-tag-filter:2.0.2

RUN apk del make gcc g++ libc-dev ruby-dev libffi-dev

USER root
