#!/bin/bash

sed -i 's%USER_NAME%'${USER_NAME}'%g' /etc/rabbitmq/definitions.json
sed -i 's%PASSWORD_HASH%'${PASSWORD_HASH}'%g' /etc/rabbitmq/definitions.json

exec /usr/local/bin/docker-entrypoint.sh "$@"
