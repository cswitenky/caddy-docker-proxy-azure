# set the caddy version as a build argument
ARG CADDY_VERSION=latest

# build stage
FROM caddy:${CADDY_VERSION}-builder AS builder

# set the image description
LABEL org.opencontainers.image.description="Caddy with Azure DNS plugin"

# install the azure dns plugin
RUN xcaddy build \
    --with github.com/caddy-dns/azure

# use the final caddy image
FROM caddy:${CADDY_VERSION}

# copy the plugin from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy