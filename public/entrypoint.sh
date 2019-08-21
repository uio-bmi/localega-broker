#!/bin/bash

perl -i.bak -pe 's!USER_NAME!$ENV{"USER_NAME"}!g' /etc/rabbitmq/definitions.json
perl -i.bak -pe 's!PASSWORD_HASH!$ENV{"PASSWORD_HASH"}!g' /etc/rabbitmq/definitions.json
perl -i.bak -pe 's!CEGA_CONNECTION!$ENV{"CEGA_CONNECTION"}!g' /etc/rabbitmq/definitions.json
perl -i.bak -pe 's!CEGA_CONNECTION!$ENV{"CEGA_CONNECTION"}!g' /etc/rabbitmq/advanced.config
perl -i.bak -pe 's!PRIVATE_CONNECTION!$ENV{"PRIVATE_CONNECTION"}!g' /etc/rabbitmq/advanced.config

exec /usr/local/bin/docker-entrypoint.sh "$@"
