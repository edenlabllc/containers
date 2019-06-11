FROM alpine:3.6

ENV KONG_VERSION 1.2.0
ENV KONG_SHA256 049c63c930b14d8049ebd028794b690b52600c580be8fe129dac11062b8e2568

RUN apk update \
    && adduser -Su 1337 kong \
    && apk add git \
    && apk add musl-dev \
    && apk add gcc \
    && apk add curl \
    && apk add pcre-dev \
    && apk add --virtual .build-deps wget tar ca-certificates \
    && apk add libgcc openssl pcre perl \
    && wget -O kong.tar.gz "https://bintray.com/kong/kong-alpine-tar/download_file?file_path=kong-$KONG_VERSION.apk.tar.gz" \
    && echo "$KONG_SHA256 *kong.tar.gz" | sha256sum -c - \
    && tar -xzf kong.tar.gz -C /tmp \
    && rm -f kong.tar.gz \
    && cp -R /tmp/usr / \
    && rm -rf /tmp/usr \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && luarocks install kong-plugin-mithril 0.3.3-1 \
    && apk del git gcc musl-dev pcre-dev \
	&& chown -R kong:0 /usr/local/kong \
	&& chmod -R g=u /usr/local/kong

COPY custom_nginx.template /nginx.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000 8443 8001 8444

STOPSIGNAL SIGTERM

CMD ["kong", "docker-start"]
