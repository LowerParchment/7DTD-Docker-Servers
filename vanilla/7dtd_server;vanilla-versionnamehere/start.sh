#!/bin/bash

set -e

# Validate credentials
if [[ -z "$STEAM_USERNAME" || -z "$STEAM_PASSWORD" ]]; then
  echo "Missing Steam credentials. Please provide STEAM_USERNAME and STEAM_PASSWORD."
  exit 1
fi

# Update or install the latest 7DTD server
echo "Logging into SteamCMD and updating server..."
steamcmd +login "$STEAM_USERNAME" "$STEAM_PASSWORD" \
         +force_install_dir /app \
         +app_update 294420 validate \
         +quit

# Launch server
echo "Starting 7 Days to Die dedicated server..."
cd /app
exec ./startserver.sh -configfile=serverconfig.xml
