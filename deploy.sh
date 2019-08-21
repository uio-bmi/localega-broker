#!/bin/bash

#if [[ "$TRAVIS_BRANCH" == "master" && "$TRAVIS_PULL_REQUEST" == "false" ]]; then
  curl $TRYGGVE_CA --create-dirs -o ~/.docker/ca.pem
  curl $TRYGGVE_CERT --create-dirs -o ~/.docker/cert.pem
  curl $TRYGGVE_KEY --create-dirs -o ~/.docker/key.pem
  docker stack rm MQ
  docker config rm CA.cert
  docker config rm mq.cert
  docker config rm mq.key
  docker config create CA.cert CA.cert
  docker config create mq.cert mq.cert
  docker config create mq.key mq.key
  docker build --no-cache -t uiobmi/localega-broker-public:latest public
  docker stack deploy MQ --compose-file docker-stack.yml
#fi
