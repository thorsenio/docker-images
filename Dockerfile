# This image contains the dependencies needed for these CLIs
#
# - AWS CLI: aws
# - ECS CLI: ecs-cli
#
# Required: curl, openssh, python
#
# It also contains useful utilities for working with the CLIs: bash, groff, jq, less, rsync, vim

FROM python:alpine

RUN apk update && \
  apk upgrade && \
  apk add \
    --no-cache \
    bash \
    curl \
    groff \
    jq \
    less \
    openssh \
    rsync \
    vim

# Create directories for the project
RUN mkdir -p \
  /var/lib/aws \
  /var/project

# Upgrade pip
RUN pip install --upgrade pip

# Install the AWS CLI; suppress the warning that comes when installing as root
RUN pip install --upgrade awscli --no-warn-script-location

# Install the ECS CLI
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
  chmod +x /usr/local/bin/ecs-cli

# Set the working directory. Mount the project root to this directory when using the container
WORKDIR /var/project

COPY src/ /var/lib/aws/
