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
RUN mkdir -p /var/project/src /var/project/output

# Install the AWS CLI and add it to the PATH
RUN pip install --upgrade awscli --no-warn-script-location

RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
  chmod +x /usr/local/bin/ecs-cli

WORKDIR /var/project/src

