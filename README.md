# About this Repo

[![Build Status](https://github.com/yevgen4989/base-postgres/workflows/Build%20docker%20image/badge.svg)](https://github.com/yevgen4989/base-postgres/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/yevgen4989/base-postgres.svg)](https://hub.docker.com/r/yevgen4989/base-postgres)
[![Docker Stars](https://img.shields.io/docker/stars/yevgen4989/base-postgres.svg)](https://hub.docker.com/r/yevgen4989/base-postgres)

This repository is a fork of https://github.com/docker-library/postgres with a few changes:

* Only alpine-based images
* All images based on [alpine](https://github.com/yevgen4989/alpine) 3.13 version due to [this](https://github.com/alpinelinux/docker-alpine/issues/182) change in 3.14 that prevents us from running it on older docker versions

## Docker Images

* All images based on Alpine Linux
* Base image: [yevgen4989/alpine](https://github.com/yevgen4989/alpine)
* [Docker Hub](https://hub.docker.com/r/yevgen4989/base-postgres)

Supported tags and respective `Dockerfile` links:

* `14.1`, `14`, `latest` [_(Dockerfile)_](https://github.com/yevgen4989/base-postgres/tree/master/14/alpine/Dockerfile.template)
* `13.5`, `13` [_(Dockerfile)_](https://github.com/yevgen4989/base-postgres/tree/master/13/alpine/Dockerfile.template)
* `12.9`, `12` [_(Dockerfile)_](https://github.com/yevgen4989/base-postgres/tree/master/12/alpine/Dockerfile.template)
* `11.14`, `11` [_(Dockerfile)_](https://github.com/yevgen4989/base-postgres/tree/master/11/alpine/Dockerfile.template)
* `10.19`, `10` [_(Dockerfile)_](https://github.com/yevgen4989/base-postgres/tree/master/10/alpine/Dockerfile.template)
* `9.6.24`, `9.6`, `9` [_(Dockerfile)_](https://github.com/yevgen4989/base-postgres/tree/master/9.6/alpine/Dockerfile.template)

All images built for `linux/amd64` and `linux/arm64`
