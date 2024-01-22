![Caddy Logo](caddy.svg)

This is a special build of [Caddy](https://github.com/caddyserver/caddy) with [caddy-dns/azure](https://github.com/caddy-dns/azure) module built in.

## Purpose

This allows you to use [Azure DNS](https://learn.microsoft.com/en-us/azure/dns/dns-overview) as a provider for Caddy's DNS challenge.

Read more about Caddy and how to use it on Caddy's [website](https://caddyserver.com/).

## Installation

### Basic usage
```
docker run -d -p 80:80 \
    -v $PWD/index.html:/usr/share/caddy/index.html \
    -v caddy_data:/data \
    ghcr.io/cswitenky/caddy-azure
```

See [Caddy documentation] for more information. Use `ghcr.io/cswitenky/caddy-azure` in place of `caddy`.
