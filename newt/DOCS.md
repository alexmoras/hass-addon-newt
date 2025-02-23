# Newt - a client for Pangolin reverse-proxy tunnels

The [Fossorial system - with Pangolin](https://docs.fossorial.io/) at its core - is a self-hosted tunneled reverse proxy with identity and access management, designed to securely expose private resources through encrypted WireGuard tunnels running in user space. Think self hosted Cloudflare tunnels.

Newt is the main client, connecting to Pangolin, allowing access to services on the same network as Newt. Install this and connect to your Pangolin instance to allow remote access to Home Assistant, over secure WireGuard tunnels!

## Prerequisites
You need a configured Pangolin server which is externally accessible. [Follow this guide](https://docs.fossorial.io/Getting%20Started/quick-install) to get yourself setup.

Create a new "Site" with `Newt` as the Method. Save the `id`, `secret`, and `endpoint` as we'll need these in a minute.

## Installation
1. Add this repository to Home Assistant and install the addon.  
   [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexmoras%2Fhass-addon-newt)
2. Configure the addon in the "Configuration" tab using the configuration documentation below. Hit "Start" and check the "Logs" tab to check the status. On your Pangolin dashboard, you will see the newly created Site status change to "Online".
3. Visit your Pangolin dashboard and add a new Resource called `Home Assistant`. Choose the correct site that relates to the Home Assistant Newt instance, that you defined in the prerequisites and give your Resource a subdomain.
4. Make sure the "Enable SSL" option is toggled on, so that you get an automatically generated SSL certificate to encrypt the browser connections.
5. In the "Target configuation" panel, add a target with the `HTTP` method, domain `homeassistant.local.hass.io`, and port `8123`. Hit "Add target" and save.
6. Visit the [Home Assistant docs](https://www.home-assistant.io/integrations/http) and follow the instructions to add a `trusted_proxy` to your `configuration.yaml` file. It will probably be `172.30.33.0/24`. Make sure you also set `use_x_forwarded_for: true` so that the client's IP appears in your logs, rather than the IP of the reverse proxy. Restart Home Assistant.
7. Your Home Assistant instance should now be available from the Resources subdomain you configured. You can now change the authentication methods or even create a new Resource to point at other addons on Home Assistant.
8. (Optional) If you wish to have a Resource that points to a Home Assistant addon, in the "domain" part or the "Target configuration" panel, use the slug of the addon. You can find this by going to the addon configuration page in Home Assistant. In this example, the slug is "a0d7b954_tailscale". If there is an `_`, such as this example, it must be replaced with a `-`. So, the correct domain for this example would be `a0d7b954-tailscale`. Your port depends on the addon, you'll need to refer to the addon documentation or configuration.

## Configuration
In the prerequisites section, you will have created a new Site on the Pangolin server. This will give you an endpoint, an ID, and a secret. We will put these in to the Newt addon configuration panel.

### - Option: `id`
The `id` given by the Pangolin server. It is the unique string after `--id` in the creation wizard. Paste it here without any additional symbols or quotation marks.

### - Option: `secret`
The `secret` given by the Pangolin server. It is the unique string after `--secret` in the creation wizard. Paste it here without any additional symbols or quotation marks. Do not share this with anyone and delete any saved copies once this has been setup.

### - Option: `endpoint`
The `endpoint` of the Pangolin server. It is the URL after `--endpoint` in the creation wizard. Paste it here including the `https://` bit. This URL must be accessible by the Home Assistant instance - it is normally a domain that can be accessed by the wider internet.
