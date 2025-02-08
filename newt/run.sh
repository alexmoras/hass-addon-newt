#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

bashio::log.info "Starting Newt..."

exec /newt \
  --id $(bashio::config 'id') \
  --secret $(bashio::config 'secret') \
  --endpoint $(bashio::config 'endpoint')
