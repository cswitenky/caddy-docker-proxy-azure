# Dockerfile
ARG CADDY_VERSION=2.7.6
ARG TARGETOS
ARG TARGETARCH

# Builder stage
FROM caddy:${CADDY_VERSION}-builder AS builder

# Set Go build environment for cross-compilation
ENV GOOS=$TARGETOS
ENV GOARCH=$TARGETARCH
ENV CGO_ENABLED=0

# Build Caddy with Azure DNS plugin
RUN xcaddy build \
    --with github.com/caddy-dns/azure \
    --ldflags="-s -w -trimpath"

# Final stage: slim image
FROM caddy:${CADDY_VERSION}

# Copy the compiled binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy