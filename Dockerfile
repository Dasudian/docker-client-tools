# This is a Dockerfile to build a docker image include some client tools.
FROM alpine:3.4
MAINTAINER Mengz <mz@dasudian.com>

# Install the tools
RUN apk --update add \
  curl \
  postgresql-client && \
  rm -rf /var/cache/apk/*

CMD ["sh"]
