# BUILD:
# docker build --force-rm --tag "rvannauker/phpstan" --file phpstan.dockerfile .
# RUN:
# docker run --rm --volume $(pwd):/workspace --name="phpstan" "rvannauker/phpstan" analyse --level=5 --no-progress --no-interaction -vvv {destination}
# PACKAGE: PHPStan - PHP Static Analysis Tool
# PACKAGE REPOSITORY: https://github.com/phpstan/phpstan.git
# DESCRIPTION: PHP Static Analysis Tool - discover bugs in your code without running it!
FROM alpine:latest
MAINTAINER Richard Vannauker <richard.vannauker@gmail.com>
# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL     org.label-schema.schema-version="1.0" \
          org.label-schema.build-date="$BUILD_DATE" \
          org.label-schema.version="$VERSION" \
          org.label-schema.name="" \
          org.label-schema.description="" \
          org.label-schema.vendor="SEOHEAT LLC" \
          org.label-schema.url="" \
          org.label-schema.vcs-ref="$VCS_REF" \
          org.label-schema.vcs-url="" \
          org.label-schema.usage="" \
          org.label-schema.docker.cmd="" \
          org.label-schema.docker.cmd.devel="" \
          org.label-schema.docker.cmd.test="" \
          org.label-schema.docker.cmd.debug="" \
          org.label-schema.docker.cmd.help="" \
          org.label-schema.docker.params="" \
          org.label-schema.rkt.cmd="" \
          org.label-schema.rkt.cmd.devel="" \
          org.label-schema.rkt.cmd.test="" \
          org.label-schema.rkt.cmd.debug="" \
          org.label-schema.rkt.cmd.help="" \
          org.label-schema.rkt.params="" \
          com.amazonaws.ecs.task-arn="" \
          com.amazonaws.ecs.container-name="" \
          com.amazonaws.ecs.task-definition-family="" \
          com.amazonaws.ecs.task-definition-version="" \
          com.amazonaws.ecs.cluster=""

RUN mkdir -p /workspace
WORKDIR /workspace
VOLUME /workspace

# Additional tools
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer

# Add path to composed tools
ENV PATH /root/.composer/vendor/bin:$PATH

# PHP binary & extensions
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
           php7 \
           php7-json \
           php7-openssl \
           php7-phar \
           php7-gd \
           php7-iconv \
           php7-intl \
           php7-mbstring \
           php7-pdo_sqlite \
           php7-xml \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/bin/php7 /usr/bin/php

# Make the tools executable and install the tools
RUN chmod +x /usr/local/bin/composer \
    && /usr/local/bin/composer global require \
	      'phpstan/phpstan=0.6.1'

ENTRYPOINT ["phpstan"]