# This is a Dockerfile to build a docker image include some client tools.
FROM alpine:3.5
MAINTAINER Mengz <mz@dasudian.com>

# Install the tools
RUN apk update && \
  apk add --no-cache \
    bash \
    ca-certificates \
    python \
    curl \
    postgresql-client

CMD ["bash"]
