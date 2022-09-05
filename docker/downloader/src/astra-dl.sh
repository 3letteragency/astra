#!/usr/bin/env bash
#steamcmd +force_install_dir /mnt/astra +login $STEAM_USER $STEAM_PASS +download_depot $KSP_STEAM_APP_ID $KSP_STEAM_DEPOT_ID $KSP_STEAM_MANIFEST_ID +quit
#mv /home/steam/steamcmd/linux32/steamapps /mnt/astra

ASTRA_DIR=/mnt/astra/steamapps/content/app_220200/depot_220203

wget https://github.com/KSP-CKAN/CKAN/releases/download/v1.28.0/ckan_1.28.0_all.deb
apt -y install ./ckan_1.28.0_all.deb
rm -f ckan*.deb
# Install CKAN mods
ckan ksp add astra $ASTRA_DIR
ckan update --headless
ckan install --headless RSSTextures2048
ckan install --headless --no-recommends RealSolarSystem
ckan install --headless --no-recommends RealismOverhaul
ckan compat add 1.9.1
ckan install --headless SpaceXLaunchVehicles

#Install raw mods
# kRPC
cd $(mktemp -d)
wget https://github.com/haeena/krpc/releases/download/v0.4.9.1/krpc-0.4.9.1.zip
unzip krpc*.zip
mv GameData/kRPC $ASTRA_DIR/GameData
cp /opt/astra/kRPC/krpc-settings.cfg $ASTRA_DIR/GameData/kRPC/PluginData/settings.cfg
