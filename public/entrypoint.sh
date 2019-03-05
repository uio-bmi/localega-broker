#!/bin/bash

sed -i 's%USER_NAME%'${USER_NAME}'%g' /etc/rabbitmq/definitions.json
sed -i 's%PASSWORD_HASH%'${PASSWORD_HASH}'%g' /etc/rabbitmq/definitions.json
sed -i 's%CEGA_CONNECTION%'${CEGA_CONNECTION}'%g' /etc/rabbitmq/definitions.json
sed -i 's%CEGA_CONNECTION%'${CEGA_CONNECTION}'%g' /etc/rabbitmq/advanced.config
sed -i 's%PRIVATE_CONNECTION%'${PRIVATE_CONNECTION}'%g' /etc/rabbitmq/advanced.config

exec /usr/local/bin/docker-entrypoint.sh "$@"
