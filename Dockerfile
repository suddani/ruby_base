FROM ruby:2.3.4-slim

RUN apt update -qq -y;\
    apt install -q -y --no-install-recommends\
                      build-essential\
                      bison\
                      openssl\
                      libreadline6\
                      libreadline6-dev\
                      # curl\
                      # git-core\
                      sgrep\
                      zlib1g\
                      zlib1g-dev\
                      libssl-dev\
                      libyaml-dev\
                      libxml2-dev\
                      autoconf\
                      libc6-dev\
                      # ncurses-dev\
                      automake\
                      libtool;\
    useradd -s /bin/bash ubuntu; \
    chgrp -R ubuntu /usr/local; \
    find /usr/local -type d | xargs chmod g+w; \
    mkdir /etc/sudoers.d; \
    echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ubuntu; \
    chmod 0440 /etc/sudoers.d/ubuntu; \
    mkdir /app; \
    mkdir /data; \
    chown ubuntu:ubuntu /app; \
    chown ubuntu:ubuntu /data;

USER ubuntu

WORKDIR /app

VOLUME /data
EXPOSE 3000
