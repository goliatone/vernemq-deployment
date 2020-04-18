FROM vernemq/vernemq
FROM erlio/docker-vernemq

ARG MQTT_AUTH

ENV DOCKER_VERNEMQ_LOG__CONSOLE=console \
    DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on

COPY vernemq.conf /vernemq/etc/vernemq.conf.local 

EXPOSE 1883/tcp \
       8080/tcp \
       8883/tcp \
       8888/tcp \
       4369/tcp \
       9100-9109/tcp \
       44053/tcp

WORKDIR /vernemq
