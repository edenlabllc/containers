FROM alpine:3.9

RUN apk update && \
    apk add tar wget && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    wget https://github.com/dhall-lang/dhall-haskell/releases/download/1.24.0/dhall-json-1.3.0-x86_64-linux.tar.bz2 && \
    tar --extract --bzip2 --file dhall-json-1.3.0-x86_64-linux.tar.bz2
