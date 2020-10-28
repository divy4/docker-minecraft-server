#!/usr/bin/env sh
set -euf pipefail

echo "eula=$EULA" > eula.txt

java -jar server.jar --nogui --universe /data/
