FROM debian:buster-slim
ENV LC_ALL=C.UTF-8
RUN apt update && \
  apt upgrade -y && \
  apt install -y ghostscript
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod o+x /usr/local/bin/docker-entrypoint.sh
RUN useradd -m converter
USER converter
RUN mkdir -p /home/converter/files && \
  chown converter:converter /home/converter/files
WORKDIR /home/converter/files
ENTRYPOINT ["docker-entrypoint.sh"]
