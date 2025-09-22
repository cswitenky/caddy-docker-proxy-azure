![Caddy Logo](caddy.svg)

This is a custom build of [Caddy](https://github.com/caddyserver/caddy) with the following modules included:

- [caddy-dns/azure](https://github.com/caddy-dns/azure): Enables Azure DNS as a provider for Caddy's DNS-01 challenge.
- [caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy): Allows Caddy to act as a reverse proxy for Docker containers.

## Purpose

This build is designed to simplify the use of Azure DNS for the DNS-01 challenge, enabling automatic HTTPS certificates, and to provide dynamic reverse proxying for Docker containers.

Read more about Caddy and its features on the official [Caddy website](https://caddyserver.com/).

## Installation

### Basic Usage

```bash
docker run -d -p 80:80 -p 443:443 \
    -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
    -v caddy_data:/data \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/cswitenky/caddy-docker-proxy-azure
```

### DNS-01 Challenge with Azure

To use the DNS-01 challenge with Azure DNS, you need to configure your Azure credentials. Add the following environment variables to your `docker run` command or Docker Compose file:

- `AZURE_CLIENT_ID`: Your Azure client ID.
- `AZURE_CLIENT_SECRET`: Your Azure client secret.
- `AZURE_TENANT_ID`: Your Azure tenant ID.
- `AZURE_SUBSCRIPTION_ID`: Your Azure subscription ID.
- `AZURE_RESOURCE_GROUP`: The resource group containing your DNS zone.

Example:

```bash
docker run -d -p 80:80 -p 443:443 \
    -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
    -v caddy_data:/data \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e AZURE_CLIENT_ID=<your-client-id> \
    -e AZURE_CLIENT_SECRET=<your-client-secret> \
    -e AZURE_TENANT_ID=<your-tenant-id> \
    -e AZURE_SUBSCRIPTION_ID=<your-subscription-id> \
    -e AZURE_RESOURCE_GROUP=<your-resource-group> \
    ghcr.io/cswitenky/caddy-docker-proxy-azure
```

### Notes

- Replace `$PWD/Caddyfile` with the path to your Caddyfile.
- Mount the Docker socket (`/var/run/docker.sock`) to enable the Docker Proxy module.
- Ensure your Azure credentials are set correctly for the DNS-01 challenge.

See the [Caddy documentation](https://caddyserver.com/docs/running#docker-compose) for more information. Use `ghcr.io/cswitenky/caddy-docker-proxy-azure` as the image name in place of the default `caddy`.
