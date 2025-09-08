# set the caddy version as a build argument
ARG CADDY_VERSION=latest

# build stage
FROM caddy:${CADDY_VERSION}-builder AS builder

# Set Go build environment for cross-compilation
ARG TARGETOS
ARG TARGETARCH
ENV GOOS=$TARGETOS
ENV GOARCH=$TARGETARCH
ENV CGO_ENABLED=0

# install the azure dns plugin with optimized build flags
RUN xcaddy build \
    --with github.com/caddy-dns/azure

# use the final caddy image
FROM caddy:${CADDY_VERSION}

# copy the plugin from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy