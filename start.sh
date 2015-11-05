#!/bin/bash

cd /home/steam
echo sed
sed -i 's/steamuser="username"/steamuser=REPLACE_USER/' ShooterGame
sed -i 's/steampass="password"/steampass=REPLACE_PASSWORD/' ShooterGame
sed -i "s/steamuser=REPLACE_USER/steamuser='$STEAM_USERNAME'/" ShooterGame
sed -i "s/steampass=REPLACE_PASSWORD/steampass='$STEAM_PASSWORD'/" ShooterGame
set_steam_guard_code $STEAM_GUARD_CODE
yes y|./ShooterGame install
#cp -v ./serverconfig_template.xml ./serverfiles/ark-server.xml
bash /run.sh
