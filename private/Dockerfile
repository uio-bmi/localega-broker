FROM rabbitmq:3.7.13-management-alpine

RUN apk add perl

RUN rabbitmq-plugins enable --offline rabbitmq_federation rabbitmq_federation_management rabbitmq_shovel rabbitmq_shovel_management

COPY entrypoint.sh /usr/local/bin/ega-entrypoint.sh

RUN chmod +x /usr/local/bin/ega-entrypoint.sh

COPY definitions.json /etc/rabbitmq/definitions.json

COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

ENTRYPOINT ["/usr/local/bin/ega-entrypoint.sh"]

CMD ["rabbitmq-server"]
