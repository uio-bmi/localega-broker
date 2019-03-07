# localega-broker

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/uiobmi/localega-broker.svg)](https://hub.docker.com/r/uiobmi/localega-broker)

## Docker image for public RabbitMQ broker

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

  public-mq:
    image: uiobmi/localega-broker:public
    hostname: public-mq
    ports:
      - "5672:5672"
      - "15672:15672"
    environment:
      - USER_NAME=admin
      - PASSWORD_HASH=4tHURqDiZzypw0NTvoHhpn8/MMgONWonWxgRZ4NXgR8nZRBz
      - PRIVATE_CONNECTION=amqp://admin:guest@private-mq:5672
      - CEGA_CONNECTION

  private-mq:
    image: uiobmi/localega-broker:private
    hostname: private-mq
    ports:
      - "15673:15672"
    environment:
      - USER_NAME=admin
      - PASSWORD_HASH=4tHURqDiZzypw0NTvoHhpn8/MMgONWonWxgRZ4NXgR8nZRBz
```

Run `docker-compose up -d` to test it.
