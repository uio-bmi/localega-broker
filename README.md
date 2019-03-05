# localega-broker

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/uiobmi/localega-broker.svg)](https://hub.docker.com/r/uiobmi/localega-broker)

## Docker image for LocalEGA RabbitMQ broker

Environment variables used:

| Variable name         | Description                                                |
|-----------------------|------------------------------------------------------------|
| CEGA_CONNECTION       | Central EGA RabbitMQ broker URI (with credentials)         |
| USER_NAME             | Admin username for the current broker                      |
| PASSWORD_HASH         | `rabbit_password_hashing_sha256` hash of the password      |

## Sample Docker Compose definition:

```
version: '3.3'

services:

  mq:
    image: uiobmi/localega-broker
    ports:
      - "5672:5672"
      - "15672:15672"
    environment:
      - CEGA_CONNECTION
      - USER_NAME
      - PASSWORD_HASH
```

Run `docker-compose up -d` to test it.
