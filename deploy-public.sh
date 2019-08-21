#!/bin/bash

if [[ "$TRAVIS_BRANCH" == "master" && "$TRAVIS_PULL_REQUEST" == "false" ]]; then
  rm -rf ~/.docker
  export DOCKER_HOST=$DOCKER_HOST_TRYGGVE
  curl $TRYGGVE_CA --create-dirs -o ~/.docker/ca.pem
  curl $TRYGGVE_CERT --create-dirs -o ~/.docker/cert.pem
  curl $TRYGGVE_KEY --create-dirs -o ~/.docker/key.pem
  docker stack rm MQ
  docker config rm CA.cert
  docker config rm mq.cert
  docker config rm mq.key
  docker config create CA.cert CA.cert
  docker config create mq.cert mq-public.cert
  docker config create mq.key mq-public.key
  docker build --no-cache -t uiobmi/localega-broker-public:uh public
  docker stack deploy MQ --compose-file docker-stack-public.yml
fi
