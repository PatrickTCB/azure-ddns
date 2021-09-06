# Azure DDNS

This is a simple bash script that can be used as a cronjob to use Azure DNS for your dynamic DNS. If you have a low traffic domain, this is much cheaper than any bespoke DDNS service. Can be run on a Raspberry Pi, Mac, or any other single computer on your network with cron and bash/zsh/sh.

# Setup

1. You need to have the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed on your system. Then login [to the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli).
2. Adapt the variables in the scripts to include your domain, zone, and resource group.
3. Schedule the scripts via [cron](https://crontab.guru).
4. Enjoy your extremely cheap DDNS.