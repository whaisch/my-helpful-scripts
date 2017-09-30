#!/bin/bash
# This script will pull your public IP address without
# scraping through HTML pages
# Pass the '-v' option for a user friendly message
# 2012-05-17 - initial version
# 2013-01-13 - updated URL and options
# 2015-01-20 - general if test improvements
# 2016-04-13 - included --insecure curl option
# whaisch@use.startmail.com
# 
# set connection timeout for curl:
TIMEOUT=5
IP='127.0.0.1'
# Comment next line for debugging purposes:
IP=`curl --silent --show-error --insecure --connect-timeout $TIMEOUT https://secure.informaction.com/ipecho/ 2>&1`
# If curl encounters an error, the IP variable becomes the error message, so print it out:
if [ "$?" != "0" ]; then
  echo "[\!] Error: $IP"
else
    if [ "$1" == "-v" ]; then
      echo "Your current public IP address is $IP"
    else
      echo "$IP"
    fi
fi
# EOF
