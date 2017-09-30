#!/bin/bash
# My simple backup script
# All sources are mirrored to all destinations via rsync
# Tested on Mac OS X, Kali Linux
# whaisch@use.startmail.com
# v3.0
# last update on 2011-DEC-17

# Enter source paths you wish to rsync from ... (no trailing /)
SOURCES=( "${HOME}/Documents" "${HOME}/Desktop" )
# Enter destination paths you wish to rsync to ... (no trailing /)
DESTINATIONS=( "/Volumes/BACKUP" "/media/${USER}/BACKUP" )

echo ' '
echo 'Started on '`date`

for DESTINATION in ${DESTINATIONS[@]}
do
  if [ -d "${DESTINATION}" ]; then
    for SOURCE in ${SOURCES[@]}
    do
       if [ -d "${SOURCE}" ]; then
          echo "*** Syncing ${SOURCE} to ${DESTINATION} ..."
          eval rsync --dry-run -vrth --delete-during --progress --stats --modify-window=2 ${SOURCE} ${DESTINATION} #2>${HOME}/Desktop/rsync-errors.txt
       else # SRC does not exist
         echo "*** ${SOURCE} does not exist."
       fi # endif SRC exists
    done
  else # DEST does not exist
    echo "*** ${DESTINATION} does not exist."
  fi # endif DEST exists
done

echo 'Finished on '`date`
echo ' '

# rsync flags used:
# -v = verbose
# -r = recursive
# -t = preserve times
# -h = human readable units
# --delete-during = remove other files and directories while rsync runs
# --progress = show progress of the copy function
# --stats = show some neat-o stats at the end of the sync
# --modify-window=2 = timestamps on FAT volumes have a 2 second resolution
#
# EOF
