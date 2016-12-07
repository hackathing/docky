docker-build-elixir:
	cd elixir-docky && MIX_ENV=prod mix release --env=prod
	docker build -t elixir-docky ./elixir-docky

docker-build-sinatra:
	docker build -t sinatra-docky ./sinatra-docky

docker-build-express:
	docker build -t express-docky ./express-docky

docker-build-all: docker-build-elixir docker-build-sinatra docker-build-express
