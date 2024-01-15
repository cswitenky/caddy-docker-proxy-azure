# pull the latest caddy image
docker pull caddy:latest

# get the version of the latest caddy image
CADDY_VERSION=$(docker run caddy:latest caddy version | cut -d ' ' -f1)

# build the docker image with the caddy version as a build argument
docker build --build-arg CADDY_VERSION=$CADDY_VERSION -t caddy-azure:$CADDY_VERSION .