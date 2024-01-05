#checkov:skip=CKV_DOCKER_3:Allow root user
FROM ubuntu:22.04

LABEL org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.source="https://github.com/balling-dev/docker-github-action-molecule" \
      org.opencontainers.image.authors="Kristoffer Winther Balling <balling_cc@k.wbnet.dk>"

HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

ENV TZ=Etc/UTC
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /github/workspace

COPY scripts requirements.txt cmd.sh /scripts/

RUN /scripts/install_docker.sh \
  && /scripts/install_python.sh

ENTRYPOINT ["/scripts/cmd.sh"]
