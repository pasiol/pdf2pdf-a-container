FROM debian:buster-slim
RUN apt update && apt upgrade -y
RUN apt install -y ghostscript
RUN mkdir /converter
WORKDIR /converter
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
