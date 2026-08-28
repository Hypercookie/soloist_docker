FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    tar \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    libatomic1 \
    && rm -rf /var/lib/apt/lists/*
ARG TARGETARCH=amd64

ARG TARGETARCH
RUN case "${TARGETARCH}" in \
        "amd64") ARCH="x86_64" ;; \
        "arm64") ARCH="arm64" ;; \
        "arm")   ARCH="arm32" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}"; exit 1 ;; \
    esac && \
    curl --fail --location -o soloist.tar.gz "https://soloist-builds.spotifycdn.com/soloist_release_${ARCH}.tar.gz" && \
    tar -xzf soloist.tar.gz && \
    mv soloist /usr/local/bin/soloist && \
    chmod 755 /usr/local/bin/soloist && \
    rm soloist.tar.gz