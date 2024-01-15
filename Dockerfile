# set the caddy version as a build argument
ARG CADDY_VERSION=latest

FROM caddy:${CADDY_VERSION}-builder AS builder

# install the azure dns plugin
RUN xcaddy build \
    --with github.com/caddy-dns/azure

# use the final caddy image
FROM caddy:${CADDY_VERSION}

# copy the plugin from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy