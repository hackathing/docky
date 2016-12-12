# Docky

Learning about Docker and deployment :)

## Usage

```sh
# Build the sinatra app docker image
docker build -t sinatra-docky ./sinatra-docky

# Start a container with the sinatra-docky image exposing port 9292
docker run -p 9292:9292 sinatra-docky

# View running docker containers
docker ps

# Launch 1 instance of each of the 3 apps
docker-compose up
```
