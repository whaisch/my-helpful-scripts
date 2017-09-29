#!/bin/sh
# start custom terminal setup
# whaisch@use.startmail.com
# 2017-09-12

# start me up some tabs when opening Terminal:
gnome-terminal --tab -e "htop" --tab -e "watch -n 1 'lsof -P -i -n' | fgrep ESTABLISHED" --tab -e /bin/bash --tab -e /bin/bash --tab -e /bin/bash --tab -e /bin/bash --tab -e /bin/bash

exit 0
