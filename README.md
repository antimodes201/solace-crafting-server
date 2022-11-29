# solace-crafting-server
Docker Container for Solace Crafting Dedicated Server

Build to create a containerized version of the dedicated server for Solace Crafting 
https://store.steampowered.com/app/670260/Solace_Crafting/
 
 
Build by hand
```
git clone https://github.com/antimodes201/solace-crafting-server.git
docker build -t antimodes201/solace-crafting-server:latest .
``` 
 
Docker Pull
```
docker pull antimodes201/solace-crafting-server
```
 
Docker Run with defaults 
change the volume options to a directory on your node
 
```
docker run -it -p 27015-27016:27015-27016/udp -p 27015-27016 -p 5055:5055 \
-v /app/docker/temp-vol:/app \
--name solace \
antimodes201/solace-crafting-server:latest
```
 
You will need to run the server once and then stop it in order to create the default servercfg.dat config file.  Edit this to your requirements and restart the container.
  
If you would like to run an expirmental beta version use the build environmentl setting
 
```
docker run -it -p 27015-27016:27015-27016/udp -p 27015-27016 -p 5055:5055 \
-v /app/docker/temp-vol:/app \
-e BUILD="expirmental" \
--name solace \
antimodes201/solace-crafting-server:latest
```
 
For additional details on configuring the server please see https://solace-crafting.fandom.com/wiki/Dedicated_Server_Setup_Guide#Linux_installation
 
Currently exposed environmental variables and their default values
- BUILD default
- GAME_PORT 27015
- QUERY_PORT 27016
- TZ America/New_York
 
#HappyGaming