# This is a Dockerfile to build a docker image include some client tools.
FROM opensuse:42.1
MAINTAINER Mengz <mz@dasudian.com>

# Setup the repoistory
RUN zypper -q ar -r http://download.opensuse.org/repositories/server:/database:/postgresql/openSUSE_Leap_42.1/server:database:postgresql.repo && \
  zypper -q ar -r http://download.opensuse.org/repositories/server:/database/openSUSE_Leap_42.1/server:database.repo && \
  zypper -q ar -G https://repo.mongodb.org/zypper/suse/12/mongodb-org/3.2/x86_64/ mongodb

# Install the tools
RUN zypper -qn --gpg-auto-import-keys ref && \
  echo 'TIMEZONE="Asia/Chongqing"' > /etc/sysconfig/clock && \
  zypper -qn in --no-recommends timezone \
    which \
    curl \
    netcat-openbsd \
    postgresql95 \
    mariadb-client \
    mongodb-org-shell && \
  zypper clean --all

CMD ["bash"]
