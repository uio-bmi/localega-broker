#!/bin/bash

perl -i.bak -pe 's!USER_NAME!$ENV{"USER_NAME"}!g' /etc/rabbitmq/definitions.json
perl -i.bak -pe 's!PASSWORD_HASH!$ENV{"PASSWORD_HASH"}!g' /etc/rabbitmq/definitions.json

exec /usr/local/bin/docker-entrypoint.sh "$@"
