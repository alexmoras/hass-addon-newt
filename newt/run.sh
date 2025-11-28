#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

bashio::log.info "Starting Newt..."

# Build command arguments
ARGS=(
    "--id" "$(bashio::config 'id')"
    "--secret" "$(bashio::config 'secret')"
    "--endpoint" "$(bashio::config 'endpoint')"
    "--log-level" "$(bashio::config 'log-level')"
)

# Add DNS if configured
if bashio::config.has_value 'dns' && [ -n "$(bashio::config 'dns')" ]; then
    ARGS+=("--dns" "$(bashio::config 'dns')")
fi

if bashio::config.has_value 'tls-client-cert' && [ -n "$(bashio::config 'tls-client-cert')" ]; then
    ARGS+=("--tls-client-cert" "$(bashio::config 'tls-client-cert')")
fi

if bashio::config.has_value 'docker' && [ "$(bashio::config 'docker')" = "true" ]; then
    ARGS+=("--docker-socket" "/var/run/docker.sock")
fi

exec /newt "${ARGS[@]}"
