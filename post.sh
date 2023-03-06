#!/bin/bash
echo "Starting." >> /config/post_torrent.log
# Local information
TR_TORRENT_INFO=`transmission-remote -t "$TR_TORRENT_ID" -i`

# Uncomment to check the torrent info when troubleshooting.
# echo $TR_TORRENT_INFO >> /config/test.log

# Remote resources
REMOTE_SOURCE="/downloads/complete/$TR_TORRENT_NAME/*.mkv"
TV_DESTINATION="/plex/TV/"
FIGHT_DESTINATION="/plex/Fights/"

# Uncomment to make sure some variables look ok
# echo "Source: $REMOTE_SOURCE" >> /config/post_torrent.log
# echo $TR_TORRENT_DIR >> /config/test.log

cd $TR_TORRENT_DIR
if [[ $TR_TORRENT_NAME == *"keyword"* ]];
then
  echo "This looks like a partiuclar type of torrent..." >> /config/post_torrent.log
  if ls "$TR_TORRENT_NAME"/*.rar > /dev/null 2>&1
  then
    find "$TR_TORRENT_NAME" -iname "*.rar" | while read file
    do
      unrar x -inul "$file" $FIGHT_DESTINATION
    done
    echo "Unrarred $TR_TORRENT_NAME" >> /config/post_torrent.log
  fi
else
    echo $TR_TORRENT_INFO >> /config/post_torrent.log
    echo "Normal torrent by the looks..." >> /config/post_torrent.log
    echo "Starting Copy..." >> /config/post_torrent.log
    cp -vr $REMOTE_SOURCE $TV_DESTINATION 2>>/config/post_torrent.log
fi

echo "Operation Completed." >> /config/post_torrent.log
echo "---===========================---" >> /config/post_torrent.log
echo " " >> /config/post_torrent.log

