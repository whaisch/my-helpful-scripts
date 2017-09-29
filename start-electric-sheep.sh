#!/bin/bash
# start electric sheep in full screen mode
# whaisch@use.startmail.com
# 2016-04-26

# hide panels:
gsettings set org.cinnamon panels-autohide "['1:true']"

# start electric sheep:
/usr/bin/electricsheep

# unhide panels:
gsettings set org.cinnamon panels-autohide "['1:false']"

exit 0
