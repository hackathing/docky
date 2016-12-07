# Docky

Learning about Docker and deployment :)

## Usage

```sh
# Build the sinatra app docker image
docker build -t sinatra-docky ./sinatra-docky

# Start the docker container
docker run sinatra-docky

# View running docker containers
docker ps

# Map a port on local machine to the port on the docker image
docker run -p 127.0.0.1:9292:9292 sinatra-docky
```


