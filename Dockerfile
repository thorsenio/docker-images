# This image contains the dependencies needed for these CLIs
#
# - AWS CLI: aws
# - ECS CLI: ecs-cli
#
# as well as some useful utilities such as `jq` and `vim`.

FROM python:alpine

RUN apk update && \
  apk upgrade && \
  apk add \
    bash \
    curl \
    groff \
    jq \
    less \
    vim

# Create directories for the project
RUN mkdir -p /var/project

# Upgrade pip
RUN pip install --upgrade pip

# Install the AWS CLI and add it to the PATH
RUN pip install --upgrade awscli --no-warn-script-location

RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
  chmod +x /usr/local/bin/ecs-cli

WORKDIR /var/project

