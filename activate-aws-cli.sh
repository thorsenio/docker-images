#!/usr/bin/env bash

# This script opens a shell in which the AWS CLI and the AWS ECS CLI are enabled.

docker container run \
  --interactive \
  --rm \
  --tty \
  --mount type=bind,source=$(PWD),target=/var/project \
  --mount type=bind,source="${HOME}/.aws",target=/root/.aws \
  --mount type=bind,source="${HOME}/.ecs",target=/root/.ecs \
  --mount type=bind,source="${HOME}/.ssh",target=/root/.ssh \
  skypilot/aws:latest \
  bash

