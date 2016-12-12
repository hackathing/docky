# Docky

Learning about Docker and deployment :)

## Usage

```sh
# Build the node app docker image
docker build -t express-docky ./express-docky

# Start a container with the sinatra-docky image exposing port 9292
docker run -p 3000:3000 express-docky

# View running docker containers
docker ps

# Stop container by using docker ps to find CONTAINER ID
docker stop CONTAINER ID
```

