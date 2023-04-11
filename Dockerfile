# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-ubuntu:jammy

# set version label
LABEL build_version="latest"
LABEL maintainer="aptalca"

# set environment variables
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y \
    html-xml-utils \
  echo "**** install PTRScrape ****" && \
  mkdir -p /app/ptrscrape/bin && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# add local files
COPY root/ /
COPY bin/ /app/ptrscrape/bin

# ports and volumes
VOLUME /config
