# Builder with Go
FROM golang:latest AS builder

RUN apt-get update && apt-get upgrade -y

RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

RUN xcaddy build \
    --with github.com/caddy-dns/azure \
    --output /caddy

# Final slim image
FROM caddy:alpine
COPY --from=builder /caddy /usr/bin/caddy
