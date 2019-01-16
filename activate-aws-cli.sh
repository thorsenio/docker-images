#!/usr/bin/env bash

# This script opens a shell in a container that enables the AWS CLI and the AWS ECS CLI.

docker container run \
  --interactive \
  --rm \
  --tty \
  --mount type=bind,source=$(PWD),target=/var/project \
  thorsenio/aws:latest \
  bash
