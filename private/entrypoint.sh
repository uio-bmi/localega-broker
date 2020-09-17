#!/bin/bash

echo "Inserting env-variables to the config-files..."

perl -i.bak -pe 's!USER_NAME!$ENV{"USER_NAME"}!g' /etc/rabbitmq/definitions.json
perl -i.bak -pe 's!PASSWORD_HASH!$ENV{"PASSWORD_HASH"}!g' /etc/rabbitmq/definitions.json
perl -i.bak -pe 's!SSL_VERIFY!$ENV{"SSL_VERIFY"}!g' /etc/rabbitmq/rabbitmq.conf
perl -i.bak -pe 's!SSL_FAIL_IF_NO_PEER_CERT!$ENV{"SSL_FAIL_IF_NO_PEER_CERT"}!g' /etc/rabbitmq/rabbitmq.conf
perl -i.bak -pe 's!SSL_DEPTH!$ENV{"SSL_DEPTH"}!g' /etc/rabbitmq/rabbitmq.conf

exec /usr/local/bin/docker-entrypoint.sh "$@"
