#!/bin/sh
# run Google Chrome as another local user when logged in as root
# handy if you want to run Chrome on Kali Linux when you are logged in as root
# you will need to create a local user account for this to work (does NOT need to have admin or sudo access)
# set the myLocalUser variable to the name of your local user account
# all settings and Downloads will be in the corresponding user's home directory, not under /root
# without --login, there will be lots of DBUS and dconf errors and may take a long time to load
# run the script like:
#    ./start-chrome.sh myLocalUser
# whaisch@use.startmail.com

if [ -z ${1} ]; then
  echo "Please provide your local user account name:"
  echo "Usage: ${0} myLocalUser"
  exit 1
fi

# set your local user account here (or just provide it on the command line):
myLocalUser=${1}

# enable the local user to run stuff via gksu:
xhost +si:localuser:${myLocalUser}

# run google-chrome in incognito mode as the myLocalUser account:
gksu --login --user ${myLocalUser} '/opt/google/chrome/google-chrome -incognito' 2>/dev/null &

