#!/bin/bash -ex
# Start script for Solace Crafting called from docker

# Move steamcmd install to startup
if [ ! -f /app/steamcmd/steamcmd.sh ]
then
	# no steamcmd
	printf "SteamCMD not found, installing\n"
	mkdir /app/steamcmd/
	cd /app/steamcmd/
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xf steamcmd_linux.tar.gz
	rm steamcmd_linux.tar.gz
fi
	
# create symlinks
# saves
if [ ! -d /app/saves ]
then
	mkdir /app/saves
fi
mkdir -p /home/steamuser/.config/unity3d/Big\ Kitty\ Games
ln -sf /app/saves /home/steamuser/.config/unity3d/Big\ Kitty\ Games/Solace\ Crafting

#steamclient.so fix
mkdir -p /home/steamuser/.steam/sdk64/
ln -sf /app/steamcmd/linux64/steamclient.so /home/steamuser/.steam/sdk64/steamclient.so 

build=${BRANCH}

if [ ${BRANCH} == "public" ]
then
	# GA
	/app/steamcmd/steamcmd.sh +force_install_dir /app +login anonymous +app_update 1086950 +quit
else
	# Expermental 
	/app/steamcmd/steamcmd.sh +force_install_dir /app +login anonymous +app_update 1086950 -beta ${BRANCH} +quit
fi


# Launch Server
cd /app
./Solace\ Crafting.x86_64
