ARG BUILD_FROM
FROM ${BUILD_FROM}

LABEL org.opencontainers.image.source=https://github.com/alexmoras/hass-addon-newt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH=amd64
ARG NEWT_VERSION="1.0.0-beta.5"
RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    \
    && curl -o /newt -L -s \
        "https://github.com/fosrl/newt/releases/download/${NEWT_VERSION#v}/newt_linux_${BUILD_ARCH}" \
    \
    && chmod a+x /newt

COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
