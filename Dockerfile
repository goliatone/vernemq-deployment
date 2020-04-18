FROM vernemq/vernemq
FROM erlio/docker-vernemq

ARG MQTT_AUTH_PASS
ARG MQTT_AUTH_USER

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

RUN touch vmq.tmp && \
    echo "$MQTT_AUTH_PASS\n$MQTT_AUTH_PASS" >> vmq.tmp && \
    cat vmq.tmp | vmq-passwd -c /vernemq/vmq.passwd "$MQTT_AUTH_USER"