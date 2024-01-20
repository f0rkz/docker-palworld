#!/bin/bash

APPID=2394010
steamcmd.sh +quit
steamcmd.sh +force_install_dir /data \
            +login anonymous \
            +app_update $APPID validate \
            +quit

mkdir -p /home/steam/.steam/sdk64
mkdir -p /data/Pal/Saved/Config/LinuxServer

ln -s /opt/steamcmd/linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

chown steam:steam -R /data /home/steam

su - steam -c 'cd /data && bash PalServer.sh'
