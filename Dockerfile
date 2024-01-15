# set the Caddy version as a build argument
ARG CADDY_VERSION=latest

# use the official caddy image as the base
FROM caddy:${CADDY_VERSION}-builder AS builder

# install the Azure DNS plugin
RUN xcaddy build \
    --with github.com/caddy-dns/azure

# use the final caddy image
FROM caddy:${CADDY_VERSION}

# copy the plugin from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# set up your caddy configuration
COPY Caddyfile /etc/caddy/Caddyfile

# expose the necessary ports
EXPOSE 80 443

# start caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]