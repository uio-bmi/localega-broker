#!/usr/bin/env bash

docker build -t uiobmi/localega-broker-private private

docker build -t uiobmi/localega-broker-public public
