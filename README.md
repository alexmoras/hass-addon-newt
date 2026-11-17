# Newt - a Home Assistant client for Pangolin reverse-proxy tunnels

The [Fossorial system - with Pangolin](https://docs.fossorial.io/) at its core - is a self-hosted tunneled reverse proxy with identity and access management, designed to securely expose private resources through encrypted WireGuard tunnels running in user space. Think self hosted Cloudflare tunnels.

**This is a community-led repackaging of the Newt client as a Home Assistant add-on and is not endorsed by the wider Fossorial / Pangolin project.**

Newt is the main client, connecting to Pangolin, allowing access to services on the same network as Newt. Install this and connect to your Pangolin instance to allow remote access to Home Assistant, over secure WireGuard tunnels!

[![Add this addon to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fdahamsterbr%2Fhass-addon-newt)

This is a Home Assistant add-on that downloads the Newt binary and runs it on your Home Assistant instance. It exposes the ID, Secret, and Endpoint URL as configuration options within Home Assistant for easy deployment. Visit [the docs](https://github.com/dahamsterbr/hass-addon-newt/blob/main/newt/DOCS.md) to learn how to install it.

Edited version from [alexmoras](https://github.com/alexmoras/hass-addon-newt)

_The code for DNS, mTLS, and Log Level is taken from the work done by [adriaanConijn](https://github.com/alexmoras/hass-addon-newt)._
