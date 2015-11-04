#!/bin/bash

cd /home/steam
echo sed
sed -i 's/steamuser="username"/steamuser=REPLACE_USER/' arkserver
sed -i 's/steampass="password"/steampass=REPLACE_PASSWORD/' arkserver
sed -i "s/steamuser=REPLACE_USER/steamuser='$STEAM_USERNAME'/" arkserver
sed -i "s/steampass=REPLACE_PASSWORD/steampass='$STEAM_PASSWORD'/" arkserver
set_steam_guard_code $STEAM_GUARD_CODE
yes y|./arkserver install
cp -v ./serverconfig_template.xml ./serverfiles/ark-server.xml
bash /run.sh
