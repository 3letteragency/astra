#!/usr/bin/env bash

steamcmd +force_install_dir /mnt/astra +login $STEAM_USER $STEAM_PASS +download_depot $KSP_STEAM_APP_ID $KSP_STEAM_DEPOT_ID $KSP_STEAM_MANIFEST_ID +quit
mv /home/steam/steamcmd/linux32/steamapps /mnt/astra
