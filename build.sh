# pull the latest caddy image
docker pull caddy:latest

# get the version of the latest caddy image
# the tr command removes the letter 'v' from 'vX.X.X' to make 'X.X.X'
CADDY_VERSION=$(docker run caddy:latest caddy version | cut -d ' ' -f1 | tr -d 'v')

# build the docker image with the caddy version as a build argument
docker build --build-arg CADDY_VERSION=$CADDY_VERSION -t caddy-azure:$CADDY_VERSION .