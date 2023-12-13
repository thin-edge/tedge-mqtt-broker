FROM eclipse-mosquitto:2.0.18

ARG BUILDTIME
ARG REVISION
ARG VERSION

LABEL org.opencontainers.image.title="thin-edge.io mosquitto container"
LABEL org.opencontainers.image.created=$BUILDTIME
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.description="Custom mosquitto configuration with configuration to work with thin-edge.io out of the box"
LABEL org.opencontainers.image.source="https://github.com/thin-edge/tedge-mosquitto"
LABEL org.opencontainers.image.authors="thin-edge.io"
LABEL org.opencontainers.image.vendor="thin-edge.io"
LABEL org.opencontainers.image.licenses="Eclipse Public License 2.0"
LABEL org.opencontainers.image.url="https://thin-edge.io"
LABEL org.opencontainers.image.documentation="https://thin-edge.github.io/thin-edge.io/"
LABEL org.opencontainers.image.base.name="alpine:3.18"

VOLUME /etc/tedge/mosquitto-conf

COPY entrypoint.sh /entrypoint.sh
COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY tedge-mosquitto.conf /etc/tedge/mosquitto-conf/

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
