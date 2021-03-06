# localega-broker

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/uiobmi/localega-broker-public.svg)](https://hub.docker.com/r/uiobmi/localega-broker-public)

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/uiobmi/localega-broker-private.svg)](https://hub.docker.com/r/uiobmi/localega-broker-private)

## Docker image for public RabbitMQ broker

Environment variables used:

| Variable name         | Description                                                |
|-----------------------|------------------------------------------------------------|
| USER_NAME             | Admin username for the current broker                      |
| PASSWORD_HASH         | `rabbit_password_hashing_sha256` hash of the password      |
| CEGA_CONNECTION       | Central EGA RabbitMQ broker URI (with credentials)         |
| PRIVATE_CONNECTION    | Private LocalEGA RabbitMQ broker URI (with credentials)    |

## Docker image for private RabbitMQ broker

Environment variables used:

| Variable name         | Description                                                |
|-----------------------|------------------------------------------------------------|
| USER_NAME             | Admin username for the current broker                      |
| PASSWORD_HASH         | `rabbit_password_hashing_sha256` hash of the password      |

## Sample Docker Compose definition:

```
version: '3.3'

services:

  public-mq:
    image: uiobmi/localega-broker-public
    hostname: public-mq
    ports:
      - "5671:5671"
      - "15671:15671"
    environment:
      - USER_NAME=admin
      - PASSWORD_HASH=4tHURqDiZzypw0NTvoHhpn8/MMgONWonWxgRZ4NXgR8nZRBz
      - PRIVATE_CONNECTION=amqps://admin:guest@private-mq:5671/%2F?heartbeat=0\&connection_attempts=30\&retry_delay=10\&server_name_indication=privateMQ\&verify=verify_peer\&fail_if_no_peer_cert=true\&cacertfile=/etc/rabbitmq/CA.cert\&certfile=/etc/rabbitmq/ssl.cert\&keyfile=/etc/rabbitmq/ssl.key
      - CEGA_CONNECTION=
    volumes:
      - ./ssl/CA.cert:/etc/rabbitmq/CA.cert
      - ./ssl/publicMQ.cert:/etc/rabbitmq/ssl.cert
      - ./ssl/publicMQ.key:/etc/rabbitmq/ssl.key

  private-mq:
    image: uiobmi/localega-broker-private
    hostname: private-mq
    ports:
      - "15670:15671"
    environment:
      - USER_NAME=admin
      - PASSWORD_HASH=4tHURqDiZzypw0NTvoHhpn8/MMgONWonWxgRZ4NXgR8nZRBz
    volumes:
      - ./ssl/CA.cert:/etc/rabbitmq/CA.cert
      - ./ssl/privateMQ.cert:/etc/rabbitmq/ssl.cert
      - ./ssl/privateMQ.key:/etc/rabbitmq/ssl.key

```

Run `docker-compose up -d` to test it.
