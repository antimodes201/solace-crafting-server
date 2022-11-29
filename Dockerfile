FROM ubuntu:20.04
MAINTAINER antimodes201

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

ARG GAME_PORT=27015
ARG QUERY_PORT=27016

# Set some Variables
ENV BRANCH "public"
ENV TZ "America/New_York"

# dependencies
RUN dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
		lib32gcc1 \
		wget \
		unzip \
		tzdata \
		libc6 \
		libstdc++6 \
		ca-certificates && \
		rm -rf /var/lib/apt/lists/*

# create directories
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steamuser && \
    usermod -G tty steamuser \
        && mkdir -p /app \
		&& mkdir -p /scripts \
        && chown steamuser:steamuser /app \
		&& chown steamuser:steamuser /scripts 

USER steamuser

ADD start.sh /scripts/start.sh

# Expose some port
EXPOSE $GAME_PORT/udp
EXPOSE $GAME_PORT/tcp
EXPOSE $QUERY_PORT/udp
EXPOSE $QUERY_PORT/tcp

# Make a volume
# contains configs and world saves
VOLUME /app

CMD ["/scripts/start.sh"]