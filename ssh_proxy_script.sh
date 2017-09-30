#!/bin/bash
# Script to use a SSH connection as a SOCKS proxy for Firefox
# whaisch@use.startmail.com
# 27-MARCH-2012
# source: http://paulstamatiou.com/how-to-surf-securely-with-ssh-tunnel
# original command: ssh -D 8080 -f -C -q -N myuser@myserver.com
USERNAME=myUsername
SERVER_IP=myServerIP
SSH_PORT=80
ssh -D 8080 -C -q -N -p ${SSH_PORT} ${USERNAME}@${SERVER_IP}
# ssh flags:
# -D 8080 = setup a "dynamic" port forwarding SOCKS proxy on local port 8080
# -f = run as a background process after any username/passwords are provided
# -C = enable compression
# -q = quiet mode, do not display warnings or diagnostic messages that will mess with the tunnel
# -N = do not execute a command, just forward ports
# -p $SSH_PORT = use port 80 for destination port number (bypass pesky port blocking firewalls/filters)
#    (you will need to add "Port 80" into the server's /etc/ssh/sshd_config file and restart ssh service)
# -i mykeypair.pem = use this SSH identity key for login (needed to login to Amazon via ssh)
# USERNAME@SERVER_IP = authenticate with the SSH server SERVER_IP as USERNAME
# 
# Firefox setup:
# enter about:config and search for "network.proxy."
# change these values:
# network.proxy.socks = 127.0.0.1
# network.proxy.socks_port = 8080
# network.proxy.socks_remote_dns = true
# network.proxy.type = 1
# network.proxy.no_proxies_on = localhost, 127.0.0.1, 172.16.0.0/12, 192.168.0.0/16, 10.0.0.0/8, 169.254.0.0/16
# (also, remember to enter your local domain if you need access to local servers)
# 
# To disengage the proxy in Firefox:
# change network.proxy.type = 0
# 
