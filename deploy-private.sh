#!/bin/bash

if [[ "$TRAVIS_BRANCH" == "master" && "$TRAVIS_PULL_REQUEST" == "false" ]]; then
  rm -rf ~/.docker
  export DOCKER_HOST=$DOCKER_HOST_TSD
  curl $TSD_CA --create-dirs -o ~/.docker/ca.pem
  curl $TSD_CERT --create-dirs -o ~/.docker/cert.pem
  curl $TSD_KEY --create-dirs -o ~/.docker/key.pem
  docker stack rm MQ
  docker config rm CA.cert
  docker config rm mq.cert
  docker config rm mq.key
  docker config create CA.cert CA.cert
  docker config create mq.cert mq-private.cert
  docker config create mq.key mq-private.key
  docker build --no-cache -t uiobmi/localega-broker-private:uh private
  docker stack deploy MQ --compose-file docker-stack-private.yml
fi
