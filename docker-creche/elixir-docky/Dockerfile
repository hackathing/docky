From debian

RUN apt-get -y update
RUN apt-get install locales libssl-dev --yes

COPY _build/prod/rel/docky /app

# BEAM requires utf8
ENV LANG=C.UTF-8

ENV START_WEB=true
ENV PORT=4000
EXPOSE 4000
CMD ["/app/bin/docky", "foreground"]
