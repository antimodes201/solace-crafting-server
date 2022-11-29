#!/bin/bash
# Sample run script.  Primarly used in build / testing

docker rm solace
docker run -it -p 27015-27016:27015-27016/udp -p 27015-27016 -p 5055:5055 -v /app/docker/temp-vol:/app \
--name solace antimodes201/solace-crafting-server:latest